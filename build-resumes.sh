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

# Download Font Awesome desktop OTFs (Netlify's container does not have FontAwesome installed).
FA_VERSION="7.3.1"
if [ ! -d external/resume/fonts ]; then
	echo "Downloading Font Awesome ${FA_VERSION}..."
	curl -fsSL "https://github.com/FortAwesome/Font-Awesome/releases/download/${FA_VERSION}/fontawesome-free-${FA_VERSION}-desktop.zip" -o fa.zip
	mkdir -p external/resume/fonts
	unzip -q fa.zip
	cp "fontawesome-free-${FA_VERSION}-desktop/otfs/"*.otf external/resume/fonts/
	rm -rf fa.zip "fontawesome-free-${FA_VERSION}-desktop"
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
