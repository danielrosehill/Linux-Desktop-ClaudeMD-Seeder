#!/bin/bash

# sync-context.sh
# Incrementally syncs context-model to context without deleting files in destination
# This allows context to accumulate data while context-model serves as a template/source

set -e

# Color output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Get the repository root (parent of scripts directory)
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

SOURCE_DIR="$REPO_ROOT/context-model"
DEST_DIR="$REPO_ROOT/data/captured-context"

echo -e "${BLUE}=== Context Model → Context Sync ===${NC}"
echo -e "Source: ${GREEN}$SOURCE_DIR${NC}"
echo -e "Destination: ${GREEN}$DEST_DIR${NC}"
echo ""

# Create destination directory if it doesn't exist
if [ ! -d "$DEST_DIR" ]; then
    echo -e "${YELLOW}Creating destination directory...${NC}"
    mkdir -p "$DEST_DIR"
fi

# Use rsync for incremental sync
# -a: archive mode (preserves permissions, timestamps, etc.)
# -v: verbose
# -u: update only (skip files that are newer in destination)
# --ignore-existing: skip files that already exist in destination (alternative to -u)
# We'll use -u to update files that are older in destination

echo -e "${BLUE}Syncing files...${NC}"
rsync -av --update "$SOURCE_DIR/" "$DEST_DIR/"

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✓ Sync completed successfully${NC}"
    echo -e "${YELLOW}Note: Existing files in data/captured-context/ were preserved${NC}"
    echo -e "${YELLOW}      Only newer files from context-model/ were copied${NC}"
else
    echo ""
    echo -e "${YELLOW}⚠ Sync completed with errors (exit code: $EXIT_CODE)${NC}"
    exit $EXIT_CODE
fi
