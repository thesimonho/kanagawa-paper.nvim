#!/bin/bash
set -e

nvim -u scripts/minit.lua --headless +"lua require('kanagawa-paper.extras').setup()" +qa
