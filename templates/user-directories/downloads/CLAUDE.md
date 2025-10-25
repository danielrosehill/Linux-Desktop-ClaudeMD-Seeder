# CLAUDE.md For Downloads Directory

## Purpose

This directory serves as the default location for files downloaded from web browsers, email clients, and other applications. It's typically a temporary staging area that requires regular organization and cleanup.

## Typical Contents

- Browser downloads (files, images, PDFs, archives)
- Email attachments
- Application installers and packages (.deb, .rpm, .AppImage)
- Compressed archives (.zip, .tar.gz, .7z)
- Document files (PDFs, office documents)
- Media files (images, videos, audio)
- Temporary files from various sources
- Installation scripts and configuration files

## Common Tasks

When operating at this level of the filesystem, you may be asked to:

### Organization and Cleanup
- Sort files by type, date, or project
- Move files to appropriate permanent locations
- Delete old or unnecessary downloads
- Identify and remove duplicate files
- Archive important downloads
- Free up disk space
- Create organized subdirectories for specific purposes

### File Management
- Extract compressed archives
- Verify file integrity (checksums, signatures)
- Rename files with descriptive names
- Convert file formats
- Scan files for security issues
- Organize downloads into project folders
- Move installer files to appropriate locations

### Analysis
- Generate reports on disk usage
- Identify large files consuming space
- Find files older than a specific date
- Categorize files by type or purpose
- Detect potentially harmful files
- List recently downloaded items

### Batch Operations
- Extract multiple archives
- Rename multiple files with consistent naming
- Move files to organized directories by type
- Delete files matching specific patterns
- Convert multiple files to different formats
- Verify checksums for multiple files

## Organization Strategies

### By File Type
```
Downloads/
├── documents/
├── images/
├── videos/
├── audio/
├── archives/
├── installers/
├── scripts/
└── misc/
```

### By Project
```
Downloads/
├── project-a/
├── project-b/
├── work/
├── personal/
└── temp/
```

### By Date
```
Downloads/
├── 2025-01/
├── 2025-02/
├── archive/
└── keep/
```

## Best Practices

1. **Regular Cleanup**: Schedule regular reviews to prevent clutter
2. **Immediate Organization**: Move important files to permanent locations quickly
3. **Security**: Scan downloaded files for malware before opening
4. **Verification**: Check file integrity for important downloads
5. **Temporary Nature**: Treat Downloads as a temporary staging area
6. **Automation**: Use scripts or tools to auto-organize by file type
7. **Disk Space**: Monitor disk usage and clean up regularly
8. **Archive Old Files**: Move old but potentially useful files to archive

## Security Considerations

### File Verification
- Verify checksums (SHA256, MD5) for critical downloads
- Check GPG signatures for software packages
- Scan files with antivirus before execution
- Verify download sources and URLs
- Check file permissions and ownership

### Safe Practices
- Don't execute unknown scripts or binaries
- Verify package authenticity before installation
- Keep downloads directory permissions restricted
- Regularly review for suspicious files
- Delete unnecessary files promptly
- Be cautious with email attachments

## Maintenance Tasks

### Weekly Cleanup
- Review files downloaded in the past week
- Move permanent files to appropriate locations
- Delete unnecessary or duplicate files
- Empty browser download history if needed

### Monthly Archive
- Archive or delete files older than 30 days
- Review disk space usage
- Organize remaining files
- Clear out old installers and packages

### Disk Space Management
- Identify and remove large unnecessary files
- Compress old archives
- Move large media files to appropriate storage
- Monitor disk usage trends

## Common Commands

### Find and Clean
```bash
# Find files older than 30 days
find ~/Downloads -type f -mtime +30

# List largest files
du -ah ~/Downloads | sort -rh | head -20

# Count files by extension
find ~/Downloads -type f | sed 's/.*\.//' | sort | uniq -c | sort -rn

# Find duplicate files
fdupes -r ~/Downloads

# Delete empty directories
find ~/Downloads -type d -empty -delete
```

### Organization
```bash
# Sort by file type
mkdir -p ~/Downloads/{images,documents,videos,archives}
mv ~/Downloads/*.{jpg,png,gif} ~/Downloads/images/
mv ~/Downloads/*.{pdf,doc,docx} ~/Downloads/documents/

# Extract all archives
find ~/Downloads -name "*.tar.gz" -exec tar -xzf {} \;
find ~/Downloads -name "*.zip" -exec unzip {} \;
```

### Security
```bash
# Scan with ClamAV
clamscan -r ~/Downloads

# Verify checksum
sha256sum -c file.sha256

# Check file types
file ~/Downloads/*
```

## File Type Categories

### Documents
- `.pdf`, `.doc`, `.docx`, `.odt`, `.txt`, `.md`
- Move to ~/Documents or project folders

### Images
- `.jpg`, `.png`, `.gif`, `.svg`, `.webp`
- Move to ~/Pictures or project assets

### Archives
- `.zip`, `.tar.gz`, `.7z`, `.rar`, `.tar.xz`
- Extract to appropriate locations, then delete

### Installers
- `.deb`, `.rpm`, `.AppImage`, `.sh`, `.run`
- Move to ~/programs or install and delete

### Media
- `.mp4`, `.mkv`, `.avi`, `.mp3`, `.flac`, `.wav`
- Move to ~/Videos or ~/Music

### Code/Scripts
- `.py`, `.sh`, `.js`, `.json`, `.yaml`
- Move to appropriate project directories

## Automation Ideas

### Auto-Organization Script
- Monitor Downloads directory
- Automatically sort by file type
- Move to predefined locations
- Clean up after extraction
- Alert on large files

### Scheduled Cleanup
- Cron job for weekly cleanup
- Delete files older than threshold
- Archive important files
- Generate cleanup reports
- Notify user of actions taken

## Integration with Other Tools

### Browser Integration
- Configure browser download location
- Set up automatic file organization
- Enable download scanning

### File Managers
- Use Dolphin, Nautilus, or Thunar for visual organization
- Configure custom actions for common tasks
- Set up folder views and sorting

### Cloud Sync
- Sync important downloads to cloud storage
- Backup critical files automatically
- Archive to remote storage

## Working in This Directory

- This is a high-traffic, temporary directory
- Don't store important files here permanently
- Regular cleanup prevents disk space issues
- Be mindful of sensitive data in downloads
- Verify files before executing
- Keep organized to find files easily
