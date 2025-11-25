#!/usr/bin/env bash

# Fail fast
set -e

# Find directory of this script (so it works from anywhere)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"   # assumes scripts/ lives in repo root

pushd "$REPO_DIR" > /dev/null

OUTPUT="pkglist-repo.txt"

echo "Saving installed package list to $OUTPUT ..."

# Generate package list:
#   - List explicitly installed packages (not dependencies)
#   - Sort alphabetically
#   - Remove version numbers, keep clean names only
#   - Save as plain text
pacman -Qqe | sort > "$OUTPUT"

# Force correct line endings (LF only)
dos2unix "$OUTPUT" >/dev/null 2>&1 || true

echo "Done. Package count: $(wc -l < "$OUTPUT")"
echo "File written to: $REPO_DIR/$OUTPUT"

popd > /dev/null

