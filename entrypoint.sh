#!/bin/bash
set -e

# Input parameters
SHA=$1
REPO=$2
TOKEN=$3
ISSUE=$4

# Create a temporary directory
TEMP_DIR=$(mktemp -d)

# Fetch the artifact using the GitHub API
curl -sSL -H "Authorization: token $TOKEN" \
 "https://github.com/yume190/LeakDetect/releases/download/0.0.4.2/leakDetect" \
 -o "$TEMP_DIR/leakDetect"

sha=$SHA repository=$REPO auth=$TOKEN issue=$ISSUE $TEMP_DIR/leakDetect \
    --sdk macosx \
    --file Sources/ActionTest/ActionTest.swift

# Clean up
rm -rf "$TEMP_DIR"
