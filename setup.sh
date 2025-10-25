#!/bin/bash

# setup.sh
# Main setup script for Linux Desktop ClaudeMD Seeder
# This script prepares the repository for use by:
# 1. Syncing context model to data directory (non-destructively)
# 2. Installing slash commands to .claude/commands

set -e

# Color output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BOLD}${BLUE}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${BLUE}║  Linux Desktop ClaudeMD Seeder - Setup Script    ║${NC}"
echo -e "${BOLD}${BLUE}╚════════════════════════════════════════════════════╝${NC}"
echo ""

# Step 1: Sync context model to data directory
echo -e "${BOLD}${BLUE}[Step 1/2]${NC} Syncing context model to data directory..."
echo -e "${YELLOW}This creates the data storage structure for your filesystem context.${NC}"
echo ""

if [ -x "$SCRIPT_DIR/scripts/sync-context.sh" ]; then
    "$SCRIPT_DIR/scripts/sync-context.sh"
    SYNC_EXIT=$?
    if [ $SYNC_EXIT -ne 0 ]; then
        echo -e "${RED}✗ Context sync failed with exit code $SYNC_EXIT${NC}"
        exit $SYNC_EXIT
    fi
else
    echo -e "${RED}✗ Error: scripts/sync-context.sh not found or not executable${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Step 2: Install slash commands
echo -e "${BOLD}${BLUE}[Step 2/2]${NC} Installing slash commands to .claude/commands..."
echo -e "${YELLOW}This makes the workflow slash commands available in Claude Code.${NC}"
echo ""

if [ -x "$SCRIPT_DIR/scripts/install-slash-commands.sh" ]; then
    "$SCRIPT_DIR/scripts/install-slash-commands.sh"
    INSTALL_EXIT=$?
    if [ $INSTALL_EXIT -ne 0 ]; then
        echo -e "${RED}✗ Slash command installation failed with exit code $INSTALL_EXIT${NC}"
        exit $INSTALL_EXIT
    fi
else
    echo -e "${RED}✗ Error: scripts/install-slash-commands.sh not found or not executable${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BOLD}${GREEN}✓ Setup completed successfully!${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo -e "  1. Review the slash commands in ${GREEN}.claude/commands/${NC}"
echo -e "  2. Run the slash commands in order (see ${GREEN}data/slash-execution-order.json${NC})"
echo -e "  3. Or use the ${GREEN}/run-slashes${NC} command to execute them all in sequence"
echo ""
echo -e "${YELLOW}Tip:${NC} The slash commands are designed to be run systematically to:"
echo -e "     - Map your filesystem structure"
echo -e "     - Interview you about directory purposes"
echo -e "     - Match templates to your paths"
echo -e "     - Install CLAUDE.md files throughout your system"
echo ""
