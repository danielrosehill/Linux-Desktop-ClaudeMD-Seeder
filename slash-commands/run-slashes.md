You are running the **run-slashes** meta-command.

## Purpose

Execute the complete Linux Desktop ClaudeMD Seeder workflow by running all slash commands in the correct sequence.

## Task

Run the following slash commands in this exact order:

1. **/run-depersonalise-checker** - Depersonalize template files
2. **/capture-distro** - Capture distribution information
3. **/discover-existing** - Find and record existing CLAUDE.md files to prevent overwrites
4. **/probe** - Map the filesystem structure
5. **/user-interview** - Interview user about directory purposes
6. **/path-match** - Match templates to user paths
7. **/create-custom-paths** - Create custom mappings for unique directories
8. **/install-claudemd** - Install CLAUDE.md files (skips discovered locations)

## Notes

- Each command builds upon context gathered by previous commands
- If any command fails, stop and report the issue to the user
- The complete workflow is defined in `data/slash-execution-order.json`
- Users can run individual commands later for maintenance or updates