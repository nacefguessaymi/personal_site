#!/usr/bin/env bash
set -euo pipefail

# Compile both CVs. --root lets the compiler resolve local imports.
echo "Compiling academic CV..."
typst compile --root external/resume \
	--font-path "$CONDA_PREFIX"/fonts \
	external/resume/rendercv/main.typ \
	static/files/cv.pdf

echo "Compiling industry resume..."
typst compile --root external/resume \
	--font-path "$CONDA_PREFIX"fonts \
	external/resume/basic-resume/main.typ \
	static/files/resume.pdf
