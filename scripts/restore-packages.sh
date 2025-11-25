#!/usr/bin/env bash

# Fail fast
set -e

# Find directory of this script (so it works from anywhere)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"  # assumes scripts/ lives inside repo root

pushd "$REPO_DIR" > /dev/null

PKGLIST="pkglist-repo.txt"

# Safety check
if [[ ! -f "$PKGLIST" ]]; then
    echo "Error: $PKGLIST not found in repo root ($REPO_DIR)"
    popd > /dev/null
    exit 1
fi

# Normalize line endings (fix CRLF issues from Windows/WSL)
dos2unix "$PKGLIST" >/dev/null 2>&1 || true

# Extract packages, strip comments and empty lines
PKGS=$(grep -v '^\s*#' "$PKGLIST" | sed '/^\s*$/d')

# Prevent disastrous empty package set
if [[ -z "$PKGS" ]]; then
    echo "Error: no packages found in $PKGLIST (after filtering). Aborting."
    popd > /dev/null
    exit 1
fi

echo "Updating pacman db (pacman -Syu)"

sudo pacman -Syu

echo "------------------------------------------"

echo "Installing pacman packages:"
echo "$PKGS"
echo "------------------------------------------"

sudo pacman -S --needed $PKGS

popd > /dev/null

