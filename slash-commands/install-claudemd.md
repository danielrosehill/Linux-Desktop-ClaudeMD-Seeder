You are running the **install-claudemd** slash command.

## Purpose

Install CLAUDE.md files to matched paths on the user's filesystem based on templates and path mappings, while respecting existing CLAUDE.md files that have been discovered.

## Prerequisites

Before running this command, ensure these steps have been completed:
1. `run-depersonalise-checker` - Templates depersonalized
2. `capture-distro` - Distribution info captured
3. `discover-existing` - Existing CLAUDE.md files discovered and recorded
4. `path-match` - Templates matched to user's filesystem paths
5. `create-custom-paths` - Custom paths created for unique directories

## Task

### 1. Load Required Data

Read the following data files:
- `data/captured-context/osmap.json` - Path mappings from templates to user directories
- `data/captured-context/user-paths.json` - Additional user-specific paths
- `data/captured-context/discovered-claudemd.json` - Existing CLAUDE.md files to skip
- `data/captured-context/distro.json` - User's distribution info for templating

### 2. Build Skip List

From `discovered-claudemd.json`, extract all directories where:
- `skip_on_install` is `true` (default for discovered files)

These directories should NOT receive new CLAUDE.md files.

### 3. Install CLAUDE.md Files

For each path mapping in osmap.json and user-paths.json:

1. **Check skip list**: If the target directory is in the skip list, skip it and note this to the user
2. **Check if directory exists**: Verify the target directory exists on the filesystem
3. **Check for existing CLAUDE.md**:
   - If one exists and it's not in discovered-claudemd.json, ask the user if they want to overwrite
   - If it's in the skip list, skip it automatically
4. **Apply template substitutions**:
   - Replace distribution-specific placeholders using distro.json data
   - Replace any user-specific variables
5. **Copy or create the CLAUDE.md file** to the target directory
6. **Log the installation**: Track which files were installed, skipped, or had errors

### 4. Report Results

Provide a summary to the user:
- Number of CLAUDE.md files installed
- Number of locations skipped (due to existing files in skip list)
- Number of locations where installation failed (with reasons)
- List of all installed locations
- List of all skipped locations (from discovered files)

### 5. Suggest Next Steps

Recommend to the user:
- Review the newly installed CLAUDE.md files
- Customize them based on their specific needs
- Consider updating the skip list in discovered-claudemd.json if they want different behavior
- Run periodic scans with `discover-existing` to keep track of manually created CLAUDE.md files

## Important Notes

- **Never overwrite** CLAUDE.md files in directories marked with `skip_on_install: true`
- **Preserve user data**: If a CLAUDE.md exists and user chooses to keep it, record it in discovered-claudemd.json
- **Be conservative**: When in doubt, skip rather than overwrite
- **Maintain the skip list**: This prevents accidental overwrites of user-customized files
