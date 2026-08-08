#!/usr/bin/env bash
set -euo pipefail

TYPST_VERSION="v0.15.1"
mkdir -p bin static/files

# Install Typst (cached across builds if present)
if [ ! -f bin/typst ]; then
	echo "Installing Typst ${TYPST_VERSION}..."
	curl -fsSL "https://github.com/typst/typst/releases/download/${TYPST_VERSION}/typst-x86_64-unknown-linux-musl.tar.xz" |
		tar -xJ --strip-components=1 -C bin typst-x86_64-unknown-linux-musl/typst
fi

# Compile both CVs. --root lets the compiler resolve local imports.
echo "Compiling academic CV..."
bin/typst compile --root external/resume \
	external/resume/rendercv/main.typ \
	static/files/cv.pdf

echo "Compiling industry resume..."
bin/typst compile --root external/resume \
	external/resume/basic-resume/main.typ \
	static/files/resume.pdf

# Hand off to Hugo
echo "Building site..."
hugo --gc --minify
