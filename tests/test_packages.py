import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("assemble", ROOT / "scripts/assemble.py")
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class Packages(unittest.TestCase):
    def test_installable_neovim(self):
        with tempfile.TemporaryDirectory() as temporary:
            tree = module.assemble("neovim", Path(temporary))
            self.assertFalse((tree / "lua/kanagawa-paper/extras").exists())
            script = Path(temporary) / "check.lua"
            script.write_text("vim.opt.runtimepath:prepend(" + json.dumps(str(tree)) + ")\n"
                              'require("kanagawa-paper").setup({cache=false})\n'
                              'for _, name in ipairs({"ink", "canvas"}) do\n'
                              ' vim.cmd.colorscheme("kanagawa-paper-" .. name)\n'
                              ' assert(vim.api.nvim_get_hl(0, {name="Normal"}).fg)\nend\n')
            subprocess.run(["nvim", "--headless", "--clean", "-l", str(script)], check=True, cwd=temporary)
            self.assertEqual((tree / "README.md").read_bytes(), (ROOT / "README.md").read_bytes())

    def test_vscode_contract(self):
        with tempfile.TemporaryDirectory() as temporary:
            tree = module.assemble("vscode", Path(temporary))
            metadata = json.loads((tree / "package.json").read_text())
            self.assertEqual((metadata["publisher"], metadata["name"]), ("SimonHo", "kanagawa-paper"))
            for entry in metadata["contributes"]["themes"]:
                theme = json.loads((tree / entry["path"]).read_text())
                self.assertTrue(theme["colors"])
                self.assertTrue(theme["tokenColors"])
                self.assertNotIn("@palette.", json.dumps(theme))
                self.assertNotIn("@theme.", json.dumps(theme))
            first = {str(p.relative_to(tree)): p.read_bytes() for p in tree.rglob("*") if p.is_file()}
            module.assemble("vscode", Path(temporary))
            second = {str(p.relative_to(tree)): p.read_bytes() for p in tree.rglob("*") if p.is_file()}
            self.assertEqual(first, second)
            self.assertEqual((tree / "LICENSE").read_bytes(), (ROOT / "LICENSE").read_bytes())
