set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

test *args:
    @scripts/test.sh {{args}}

test-targets:
    @scripts/test.sh tests/targets_spec.lua
