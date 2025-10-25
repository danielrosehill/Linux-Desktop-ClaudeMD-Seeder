You are running the **discover-existing** slash command.

## Purpose

Discover existing CLAUDE.md files outside of repository bases and record them in the data store to prevent duplicate installations.

## Task

1. Execute the discovery script: `./scripts/find-non-repo-claude-files.sh`
   - This script will scan the home directory for CLAUDE.md files
   - It will identify which files are outside repository bases
   - It will save findings to `data/captured-context/discovered-claudemd.json`

2. Review the output and confirm the discovery completed successfully

3. Report to the user:
   - Number of CLAUDE.md files discovered outside repo bases
   - List the directories where these files were found
   - Confirm that these locations will be skipped during CLAUDE.md installation

## Data Store Location

The discovered files are saved to: `data/captured-context/discovered-claudemd.json`

This file tracks:
- Paths to existing CLAUDE.md files
- When they were discovered
- A `skip_on_install` flag (set to `true` by default)
- Optional user notes about each location

## Important Notes

- Files already tracked in the data store will have their user-provided data preserved
- New discoveries are automatically marked to be skipped during installation
- Users can manually edit the JSON file to add notes or change the skip behavior
- This command should be run BEFORE the installation phase to prevent conflicts
