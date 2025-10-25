This repository is a utility intended to help Linux Desktop users who use Claude Code to "spawn" CLAUDE.md files at various levels of their local filesystem.

The context: Claude Code is a vastly powerful tool for local sysadmin/management as well as for code development. CLAUDE.md files (as you know) provide folder level context to Claude. This method aims to improve the utility of Claude for this purpose by frontloading the creation of CLAUDE.md at common places in the Linux FS.

We will approach this project systematically and recurrently: on the first run we may seed a lot of CLAUDE.md files. On later runs, we may only need to update or move existing ones - or create just a few.

The intended methodology is as follows:

- **slash-commands**: Contains slash commands which are intended to ensure that key parts of your operation/task are done precisely. There is a copy script (install-slash-commands.sh) which you should use to copy these into the project-level .claude folder
- **templates**: Contains prewritten templates for common parts of the filesystem organised into folders corresponding to common purposes (e.g. repo bases)
- **context-model**: Provides the structure/schema for the context store that Claude should create. This is the reference model maintained by the repository maintainer
- **data**: The actual working directory where context data about the user's filesystem is stored and updated. This is where you should read from and write to during operations. For example, data/captured-context/distro.json is where you will capture and note the user's Linux distro so that you may integrate this into the CLAUDE.md files you generate
- **find-non-repo-claude-files.sh**: Discovery script that finds existing CLAUDE.md files outside repository bases and saves them to data/captured-context/discovered-claudemd.json to prevent duplicate installations

**Important Design Pattern:**
- `context-model/` is the authoritative template/schema (version controlled, maintained by repo maintainer)
- `data/` is the user-specific instance (gitignored, unique to each user's system)
- `sync-context.sh` synchronizes updates from context-model to data non-destructively when the model is updated
- Slash commands reference `data/` (not context-model) to work with user-specific information 

Every computer user likes to organise their files differently. So to account for this variability, you should interview the user and interrogate their filesystem. 

The objective of these processes: you try to find folders that the user has set up for a clear purpose (including those covered by the templates). And you try to identify more unique folders. 

You can use the slash commands to ensure that the tasks you run are followed precisely. The installation script copies these into the project level .claude on the end user's machine. Then, run them in order.

**Execution Order:**

The slash commands should be executed in the following order (see data/slash-execution-order.json for details):

1. **run-depersonalise-checker** - Depersonalize template files
2. **capture-distro** - Capture distribution information
3. **discover-existing** - Find and record existing CLAUDE.md files to prevent overwrites
4. **probe** - Map the filesystem structure
5. **user-interview** - Interview user about directory purposes
6. **path-match** - Match templates to user paths
7. **create-custom-paths** - Create custom mappings for unique directories
8. **install-claudemd** - Install CLAUDE.md files (skips discovered locations)

The **discover-existing** step (step 3) is crucial: it runs find-non-repo-claude-files.sh to locate any existing CLAUDE.md files outside repository bases and saves them to data/captured-context/discovered-claudemd.json. These locations are automatically skipped during the install-claudemd step to preserve user-customized context files.

The overarching objective is that by the end of your task and the process:

- The user has CLAUDE.md files at key levels of the filesystem so that when claude spiders locally it gains quick context into the purpose of these folders
- Existing CLAUDE.md files are preserved and not overwritten
- Users can track and manage where CLAUDE.md files exist via the discovered-claudemd.json data store

You can remind the user of the maintainer's vision for using this tool: it's intended as a "starter" - because creating these one by one would be tedious. Encourage the users to tweak the CLAUDE.md files to account for the uniqueness of their OS!