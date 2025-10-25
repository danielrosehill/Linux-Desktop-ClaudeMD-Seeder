Probe the user's filesystem by capturing two directory maps:

- One to capture /
- The other to capture ~ to infinite levels of recursion

Run the capture remembering the context of the project: we are trying to identify parts of the filesystem that the user may be using for specific purposes.

Save the filesystem probe data to data/captured-context/fs-probes/

Once you have captured this raw data, you should:

If you feel that a particular directory contains subdirectories that are particularly important and may be specific enough to merit their own nested CLAUDE.md files, note those in data/captured-context/user-paths.json in addition to osmap.json. These data sources will be considered together to form the final mapping.

Note: data/captured-context is where actual user context data is stored. The context-model directory only defines the storage schema and is git-ignored.

