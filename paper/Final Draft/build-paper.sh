#!/usr/bin/env bash
# Build generalized crown paper with correct working directory (see COMPILE.md).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
cd "$HERE"
exec latexmk -pdf -interaction=nonstopmode -halt-on-error novelty_theory_generalized_crown.tex
