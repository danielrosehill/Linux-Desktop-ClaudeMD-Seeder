# CLAUDE.md For Scripts Directory

## Purpose

This directory serves as a centralized location for system scripts, automation tools, utility scripts, and executable programs. It's a critical directory for system administration, workflow automation, and custom tools.

## Typical Contents

- Shell scripts (bash, zsh, fish)
- Python automation scripts
- System administration utilities
- Backup and maintenance scripts
- Data processing scripts
- Build and deployment scripts
- Monitoring and alerting scripts
- Custom command-line tools
- Installation and setup scripts
- Productivity automation

## Common Tasks

When operating at this level of the filesystem, you may be asked to:

### Script Management
- Organize scripts by function or category
- Create new automation scripts
- Update and maintain existing scripts
- Version control scripts
- Document script purposes and usage
- Archive deprecated scripts
- Test scripts in safe environments

### Script Development
- Write new shell scripts for automation
- Create Python scripts for data processing
- Develop system administration tools
- Build monitoring and alerting scripts
- Implement backup automation
- Create deployment scripts
- Write testing and validation scripts

### Organization
- Group related scripts into subdirectories
- Create consistent naming conventions
- Maintain script libraries
- Separate production and development scripts
- Organize by system function or service
- Keep experimental scripts separate

### Documentation
- Add header comments to all scripts
- Create usage documentation
- Document dependencies and requirements
- Maintain a script catalog or index
- Include examples in comments
- Document expected inputs and outputs

### Security and Permissions
- Set appropriate execute permissions
- Secure sensitive scripts
- Review scripts for security issues
- Implement access controls
- Audit script usage
- Validate script integrity

## Organization Strategies

### By Function
```
scripts/
├── backup/
│   ├── daily-backup.sh
│   ├── cloud-sync.sh
│   └── verify-backup.sh
├── system/
│   ├── update-system.sh
│   ├── clean-logs.sh
│   └── monitor-resources.sh
├── development/
│   ├── build-project.sh
│   ├── deploy.sh
│   └── test-runner.sh
├── automation/
│   ├── email-reports.py
│   ├── process-data.py
│   └── sync-files.sh
└── utilities/
    ├── convert-images.sh
    ├── organize-downloads.sh
    └── extract-archives.sh
```

### By System Component
```
scripts/
├── display/
├── audio/
├── network/
├── gpu/
├── docker/
├── services/
└── boot/
```

### By Frequency
```
scripts/
├── daily/
├── weekly/
├── monthly/
├── on-demand/
└── emergency/
```

## Script Types

### Shell Scripts
- System administration tasks
- File and directory operations
- Process automation
- Service management
- Quick utilities

### Python Scripts
- Data processing and analysis
- API interactions
- Complex automation
- Machine learning workflows
- Text processing

### Other Languages
- Ruby, Perl, or Node.js scripts
- Compiled binaries (Go, Rust)
- Specialized tools

## Best Practices

1. **Shebang Lines**: Always include proper shebang (e.g., `#!/bin/bash`)
2. **Error Handling**: Implement proper error checking and handling
3. **Logging**: Log script execution and errors appropriately
4. **Idempotency**: Scripts should be safe to run multiple times
5. **Documentation**: Include usage information and examples
6. **Version Control**: Track scripts in Git
7. **Testing**: Test scripts before production use
8. **Permissions**: Set execute permissions appropriately (`chmod +x`)
9. **Dependencies**: Document all dependencies clearly
10. **Modularity**: Break complex scripts into reusable functions

## Script Template Structure

### Bash Script Template
```bash
#!/bin/bash
#
# Script Name: example-script.sh
# Description: Brief description of what this script does
# Author: User Name
# Created: YYYY-MM-DD
# Last Modified: YYYY-MM-DD
#
# Usage: ./example-script.sh [options] [arguments]
#
# Dependencies:
#   - dependency1
#   - dependency2
#
# Exit codes:
#   0 - Success
#   1 - General error
#   2 - Specific error

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="/var/log/example-script.log"

# Functions
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}ERROR: $*${NC}" >&2
    log "ERROR: $*"
}

success() {
    echo -e "${GREEN}$*${NC}"
    log "SUCCESS: $*"
}

# Main script logic
main() {
    log "Script started"

    # Your code here

    log "Script completed successfully"
}

# Run main function
main "$@"
```

### Python Script Template
```python
#!/usr/bin/env python3
"""
Script Name: example_script.py
Description: Brief description of what this script does
Author: User Name
Created: YYYY-MM-DD
Last Modified: YYYY-MM-DD

Usage: python3 example_script.py [options] [arguments]

Dependencies:
    - package1
    - package2
"""

import argparse
import logging
import sys
from pathlib import Path

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('/var/log/example_script.log'),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger(__name__)

def main():
    """Main script logic"""
    logger.info("Script started")

    # Your code here

    logger.info("Script completed successfully")
    return 0

if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as e:
        logger.error(f"Script failed: {e}", exc_info=True)
        sys.exit(1)
```

## Common Commands

### Script Management
```bash
# Make script executable
chmod +x script.sh

# Find all executable scripts
find ~/scripts -type f -executable

# Search for scripts containing specific text
grep -r "search term" ~/scripts

# List scripts by modification date
ls -lt ~/scripts

# Find scripts not used recently
find ~/scripts -type f -executable -atime +90
```

### Running Scripts
```bash
# Run with explicit interpreter
bash script.sh

# Run in debug mode
bash -x script.sh

# Run with specific shell options
bash -euo pipefail script.sh

# Run in background
nohup ./script.sh &

# Run with timeout
timeout 300 ./script.sh
```

### Script Testing
```bash
# Check bash syntax without running
bash -n script.sh

# Use shellcheck for linting
shellcheck script.sh

# Test Python syntax
python3 -m py_compile script.py

# Run with dry-run flag (if supported)
./script.sh --dry-run
```

## Automation and Scheduling

### Cron Jobs
```bash
# Edit crontab
crontab -e

# Daily backup at 2 AM
0 2 * * * /home/user/scripts/backup/daily-backup.sh

# Weekly cleanup on Sunday at 3 AM
0 3 * * 0 /home/user/scripts/system/cleanup.sh

# Every 15 minutes
*/15 * * * * /home/user/scripts/monitoring/check-status.sh
```

### Systemd Timers
```ini
# /etc/systemd/system/backup.timer
[Unit]
Description=Daily Backup Timer

[Timer]
OnCalendar=daily
OnCalendar=02:00
Persistent=true

[Install]
WantedBy=timers.target
```

### Systemd Services
```ini
# /etc/systemd/system/backup.service
[Unit]
Description=Daily Backup Service

[Service]
Type=oneshot
ExecStart=/home/user/scripts/backup/daily-backup.sh
User=user
```

## Security Considerations

### Script Security
- Validate all inputs
- Avoid hardcoded credentials (use environment variables or secure storage)
- Check file permissions before writing
- Sanitize user input
- Use absolute paths for critical operations
- Implement proper error handling
- Log security-relevant actions

### Credential Management
- Use 1Password CLI for secrets (`op`)
- Store credentials in environment variables
- Use secure credential stores
- Never commit credentials to version control
- Encrypt sensitive configuration files
- Implement least privilege access

### Safe Practices
- Test scripts in non-production environments first
- Use `set -euo pipefail` in bash scripts
- Implement dry-run modes for destructive operations
- Create backups before modifications
- Validate critical operations with confirmation prompts
- Log all actions for audit trails

## Version Control

### Git Integration
```bash
# Initialize git repo
cd ~/scripts
git init
git add .
git commit -m "Initial commit of scripts"

# Create .gitignore
echo "*.log" > .gitignore
echo ".env" >> .gitignore
echo "credentials.json" >> .gitignore

# Push to remote
git remote add origin git@github.com:username/scripts.git
git push -u origin main
```

### Backup Strategy
- Version control all scripts
- Push to remote repository regularly
- Keep archive of stable versions
- Document breaking changes
- Tag release versions
- Maintain changelog

## Common Script Categories

### System Administration
- System updates and patching
- Log rotation and cleanup
- Service management
- User and permission management
- Disk space monitoring
- Process monitoring

### Backup and Recovery
- File backups (local and cloud)
- Database backups
- System snapshots
- Backup verification
- Restore procedures
- Disaster recovery scripts

### Development
- Build automation
- Deployment scripts
- Testing automation
- Code quality checks
- Documentation generation
- Environment setup

### Data Processing
- ETL (Extract, Transform, Load)
- Data validation
- Format conversions
- Report generation
- Log analysis
- Data migration

### Monitoring and Alerting
- Resource usage monitoring
- Service health checks
- Performance monitoring
- Alert notifications
- Status reporting
- Incident response

## Working in This Directory

- All scripts should be executable (`chmod +x`)
- Include comprehensive documentation
- Test thoroughly before deploying
- Version control is essential
- Follow consistent coding standards
- Implement proper error handling
- Use logging for troubleshooting
- Keep scripts modular and reusable
- Regular security audits
- Document dependencies clearly
- Maintain script inventory/catalog
