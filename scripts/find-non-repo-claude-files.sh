#!/bin/bash

# find-non-repo-claude-files.sh
# Identifies CLAUDE.md files that are NOT within any of the user's repository bases
# This helps find CLAUDE.md files in system directories, home folder, etc.
# Saves findings to data/captured-context/discovered-claudemd.json

set -euo pipefail

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Get the repository root (parent of scripts directory)
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
DATA_FILE="$REPO_ROOT/data/captured-context/discovered-claudemd.json"

# Define repository base paths
REPO_BASES=(
    "$HOME/repos/github"
    "$HOME/repos/hugging-face"
    "$HOME/repos/forks"
    "$HOME/repos/work-repos"
    "$HOME/repos/cloned"
    "$HOME/repos/docs"
    "$HOME/repos/documentation"
    "$HOME/repos/excerpts"
    "$HOME/repos/indexing-repos"
    "$HOME/repos/kaggle"
    "$HOME/repos/mgmt"
)

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Finding CLAUDE.md files outside repository bases ===${NC}"
echo ""

# Find all CLAUDE.md files in home directory
echo -e "${YELLOW}Searching for CLAUDE.md files...${NC}"
mapfile -t ALL_CLAUDE_FILES < <(find "$HOME" -name "CLAUDE.md" -type f 2>/dev/null)

if [ ${#ALL_CLAUDE_FILES[@]} -eq 0 ]; then
    echo -e "${RED}No CLAUDE.md files found in home directory${NC}"
    exit 0
fi

echo -e "${GREEN}Found ${#ALL_CLAUDE_FILES[@]} CLAUDE.md file(s) total${NC}"
echo ""

# Function to check if a path is within any repo base
is_in_repo_base() {
    local file_path="$1"
    for base in "${REPO_BASES[@]}"; do
        if [[ "$file_path" == "$base"* ]]; then
            return 0  # true - is in repo base
        fi
    done
    return 1  # false - not in repo base
}

# Arrays to hold categorized files
NON_REPO_FILES=()
REPO_FILES=()

# Categorize files
for file in "${ALL_CLAUDE_FILES[@]}"; do
    if is_in_repo_base "$file"; then
        REPO_FILES+=("$file")
    else
        NON_REPO_FILES+=("$file")
    fi
done

# Display results
echo -e "${BLUE}=== CLAUDE.md files OUTSIDE repository bases ===${NC}"
if [ ${#NON_REPO_FILES[@]} -eq 0 ]; then
    echo -e "${GREEN}None found - all CLAUDE.md files are within repository bases${NC}"
else
    echo -e "${YELLOW}Found ${#NON_REPO_FILES[@]} file(s):${NC}"
    echo ""
    for file in "${NON_REPO_FILES[@]}"; do
        echo -e "${GREEN}✓${NC} $file"
    done
fi

echo ""
echo -e "${BLUE}=== CLAUDE.md files WITHIN repository bases ===${NC}"
if [ ${#REPO_FILES[@]} -eq 0 ]; then
    echo -e "${YELLOW}None found${NC}"
else
    echo -e "${YELLOW}Found ${#REPO_FILES[@]} file(s)${NC}"
    if [ "${1:-}" == "--verbose" ] || [ "${1:-}" == "-v" ]; then
        echo ""
        for file in "${REPO_FILES[@]}"; do
            echo "  $file"
        done
    else
        echo -e "${YELLOW}(use --verbose or -v to list them)${NC}"
    fi
fi

echo ""
echo -e "${BLUE}=== Summary ===${NC}"
echo -e "Total CLAUDE.md files: ${#ALL_CLAUDE_FILES[@]}"
echo -e "Outside repo bases: ${GREEN}${#NON_REPO_FILES[@]}${NC}"
echo -e "Within repo bases: ${#REPO_FILES[@]}"

# Save findings to JSON data store
echo ""
echo -e "${YELLOW}Saving findings to data store...${NC}"

# Ensure jq is available
if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is required but not installed. Please install jq to save data.${NC}"
    exit 1
fi

# Build JSON array of discovered files
DISCOVERED_JSON="[]"
for file in "${NON_REPO_FILES[@]}"; do
    dir=$(dirname "$file")
    timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    # Check if this file already exists in the data store to preserve user data
    existing_entry=$(jq --arg path "$file" '.discovered_files[] | select(.path == $path)' "$DATA_FILE" 2>/dev/null || echo "{}")

    if [ "$existing_entry" != "{}" ]; then
        # File already tracked - preserve existing data
        DISCOVERED_JSON=$(echo "$DISCOVERED_JSON" | jq --argjson entry "$existing_entry" '. += [$entry]')
    else
        # New file - create new entry
        new_entry=$(jq -n \
            --arg path "$file" \
            --arg dir "$dir" \
            --arg timestamp "$timestamp" \
            '{
                path: $path,
                directory: $dir,
                discovered_at: $timestamp,
                skip_on_install: true,
                purpose: "",
                notes: ""
            }')
        DISCOVERED_JSON=$(echo "$DISCOVERED_JSON" | jq --argjson entry "$new_entry" '. += [$entry]')
    fi
done

# Update the data file
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
scan_count=$(jq '.metadata.scan_count // 0' "$DATA_FILE")
scan_count=$((scan_count + 1))

jq --arg timestamp "$timestamp" \
   --argjson scan_count "$scan_count" \
   --argjson total "${#ALL_CLAUDE_FILES[@]}" \
   --argjson non_repo "${#NON_REPO_FILES[@]}" \
   --argjson discovered "$DISCOVERED_JSON" \
   '.metadata.last_scan = $timestamp |
    .metadata.scan_count = $scan_count |
    .metadata.total_files_found = $total |
    .metadata.non_repo_files_count = $non_repo |
    .discovered_files = $discovered' \
   "$DATA_FILE" > "$DATA_FILE.tmp" && mv "$DATA_FILE.tmp" "$DATA_FILE"

echo -e "${GREEN}✓ Data saved to: $DATA_FILE${NC}"
echo -e "${GREEN}✓ Scan #$scan_count completed${NC}"

# Exit with status code based on findings
exit 0
