set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

test *args:
    @scripts/test.sh {{ args }}

test-targets:
    @python3 -m unittest discover -s tests -p "test_*.py"

# Open the compact syntax specimen using your normal Neovim configuration.
syntax-specimen:
    @nvim -c 'lua dofile([[{{ justfile_directory() }}/scripts/syntax_specimen.lua]])'

# Assemble installable application trees.
build target="all":
    @python3 scripts/assemble.py {{ target }}

# Refresh checked-in extras and palette documentation before committing input changes.
generate:
    @scripts/build.sh
    @nvim --headless --clean -l scripts/generate_palette.lua

check:
    @scripts/test.sh
    @python3 -m unittest discover -s tests -p "test_*.py"
    @python3 scripts/assemble.py
