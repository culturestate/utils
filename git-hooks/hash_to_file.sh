#!/usr/bin/env bash

# Writes the current commit hash to a file so that
# deployment services like Netlify will rebuild
# when only files outside of the deploy dir have 
# changed. 

# Useful for monorepo development of Netlify build
# plugns as a pre-commit hook.

# Find the full path to the current repo
BASE_DIR=$(git rev-parse --show-toplevel)

# Set the target file
TARGET="${BASE_DIR}/force.rebuild.txt"

# Do the job
HASH=$(git rev-parse HEAD)
echo "${HASH}" > "${TARGET}"
git add ${TARGET}

# Brag about it
echo "Added hash to ${TARGET}"