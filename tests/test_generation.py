"""Exercise post-merge publication against real local Git remotes."""

import os
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

PUBLISHER = Path(__file__).resolve().parents[1] / "scripts/publish-generated.sh"


class GenerationPublication(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.repo = self.root / "repo"
        self.remote = self.root / "remote.git"
        self.repo.mkdir()
        self.env = dict(
            os.environ, GIT_CONFIG_GLOBAL=os.devnull, GIT_CONFIG_NOSYSTEM="1"
        )
        self.git("init", "--bare", str(self.remote))
        self.git("init", "-b", "main")
        self.git("config", "user.name", "Test")
        self.git("config", "user.email", "test@example.com")
        (self.repo / "scripts").mkdir()
        (self.repo / "extras").mkdir()
        (self.repo / ".gitignore").write_text("extras/**\n")
        (self.repo / "source.txt").write_text("reviewed source\n")
        (self.repo / "extras/old.txt").write_text("stale\n")
        (self.repo / "palette_colors.md").write_text("stale\n")
        shutil.copy(PUBLISHER, self.repo / "scripts/publish-generated.sh")
        (self.repo / "scripts/build.sh").write_text(
            "#!/bin/bash\nset -eu\nprintf 'current\\n' > extras/old.txt\n"
            "printf 'new\\n' > extras/new.txt\n"
        )
        binaries = self.root / "bin"
        binaries.mkdir()
        nvim = binaries / "nvim"
        nvim.write_text("#!/bin/bash\nprintf 'palette\\n' > palette_colors.md\n")
        nvim.chmod(0o755)
        self.env["PATH"] = str(binaries) + os.pathsep + self.env["PATH"]
        self.git("add", "-f", ".")
        self.git("commit", "-m", "initial reviewed source")
        self.git("remote", "add", "origin", str(self.remote))
        self.git("push", "origin", "main")
        self.initial = self.git("rev-parse", "HEAD")

    def git(self, *args):
        return subprocess.check_output(
            ["git", *args],
            cwd=self.repo,
            env=self.env,
            text=True,
            stderr=subprocess.PIPE,
        ).strip()

    def publish(self):
        return subprocess.run(
            ["bash", "scripts/publish-generated.sh"],
            cwd=self.repo,
            env=self.env,
            text=True,
            capture_output=True,
            check=False,
        )

    def remote_head(self):
        return self.git("--git-dir=" + str(self.remote), "rev-parse", "main")

    def test_publish_new_ignored_outputs_and_noop(self):
        result = self.publish()
        self.assertEqual(result.returncode, 0, result.stderr)
        published = self.remote_head()
        self.assertNotEqual(published, self.initial)
        self.assertEqual(
            set(self.git("diff", "--name-only", self.initial, published).splitlines()),
            {"extras/old.txt", "extras/new.txt", "palette_colors.md"},
        )
        self.assertEqual(self.git("status", "--porcelain"), "")
        result = self.publish()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.remote_head(), published)
        self.assertEqual(self.git("rev-parse", "HEAD"), published)

    def test_reject_source_branch(self):
        self.git("switch", "-c", "contribution")
        self.assertNotEqual(self.publish().returncode, 0)
        self.assertEqual(self.remote_head(), self.initial)

    def test_reject_dirty_checkout(self):
        (self.repo / "source.txt").write_text("unreviewed\n")
        self.assertNotEqual(self.publish().returncode, 0)
        self.assertEqual(self.remote_head(), self.initial)

    def test_generator_failure_does_not_publish(self):
        (self.root / "bin/nvim").write_text("#!/bin/bash\nexit 1\n")
        self.assertNotEqual(self.publish().returncode, 0)
        self.assertEqual(self.remote_head(), self.initial)

    def test_concurrent_source_push_is_not_overwritten(self):
        # Another reviewed commit lands after this job's checkout.
        (self.repo / "source.txt").write_text("newer reviewed source\n")
        self.git("add", "source.txt")
        self.git("commit", "-m", "newer source")
        newer = self.git("rev-parse", "HEAD")
        self.git("push", "origin", "main")
        self.git("reset", "--hard", self.initial)
        result = self.publish()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.remote_head(), newer)
        self.assertIn("rejected", result.stderr)


if __name__ == "__main__":
    unittest.main()
