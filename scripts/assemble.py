#!/usr/bin/env python3
"""Assemble installable target trees from checked-in source."""
import argparse
import json
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGETS = ("neovim", "vscode")


def assemble(target: str, output: Path) -> Path:
    destination = output / target
    if destination.exists():
        shutil.rmtree(destination)
    destination.mkdir(parents=True)
    source = ROOT / "packages" / target
    if target == "neovim":
        for directory in ("lua", "colors", "doc"):
            shutil.copytree(source / directory, destination / directory, ignore=shutil.ignore_patterns("tags"))
        shutil.copytree(ROOT / "shared/lua", destination / "lua", dirs_exist_ok=True)
    else:
        shutil.copytree(source / "assets", destination / "assets")
        shutil.copy2(source / "package.json", destination / "package.json")
        subprocess.run(["nvim", "--headless", "--clean", "-l", "scripts/render-vscode.lua", str(destination / "themes")], cwd=ROOT, check=True)
        for path in (destination / "themes").glob("*.json"):
            path.write_text(json.dumps(json.loads(path.read_text()), indent=2, sort_keys=True) + "\n")
    for filename in ("README.md", "LICENSE"):
        shutil.copy2(ROOT / filename, destination / filename)
    shutil.copy2(source / "CHANGELOG.md", destination / "CHANGELOG.md")
    return destination


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("target", choices=(*TARGETS, "all"), default="all", nargs="?")
    args = parser.parse_args()
    for target in TARGETS if args.target == "all" else (args.target,):
        print(assemble(target, ROOT / "dist"))
