set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

test *args:
    @scripts/test.sh {{ args }}

test-targets:
    @scripts/test.sh tests/targets_spec.lua

# Open the compact syntax specimen using your normal Neovim configuration.
syntax-specimen:
    @nvim -c 'lua dofile([[{{ justfile_directory() }}/scripts/syntax_specimen.lua]])'
