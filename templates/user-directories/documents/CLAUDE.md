# CLAUDE.md For Documents Directory

## Purpose

This directory serves as the primary storage location for personal and professional documents, including text files, PDFs, spreadsheets, presentations, and other document formats. It's a central hub for organized document management.

## Typical Contents

- Text documents and word processing files
- PDFs and technical documentation
- Spreadsheets and financial records
- Presentations and slides
- Forms and templates
- Notes and personal writing
- Scanned documents
- Reports and research papers
- Correspondence and letters
- Resumes and professional materials

## Common Tasks

When operating at this level of the filesystem, you may be asked to:

### Document Organization
- Create logical folder structures by project, topic, or date
- Rename documents with descriptive, searchable names
- Sort documents by type, date, importance, or client
- Archive old or completed documents
- Create template libraries
- Organize documents into work/personal categories
- Implement naming conventions

### Document Management
- Convert between document formats (PDF, DOCX, ODT, Markdown)
- Merge multiple documents
- Split large documents into sections
- Extract text from PDFs or images (OCR)
- Generate tables of contents
- Create document indexes
- Version control for important documents

### Search and Retrieval
- Search document contents for specific text
- Find documents by metadata (date, author, title)
- Locate documents by keyword or tag
- Build searchable indexes
- Create cross-references between related documents
- Tag documents for easy retrieval

### Batch Operations
- Convert multiple documents to PDF
- Apply consistent formatting across documents
- Rename documents in bulk
- Extract specific pages from multiple PDFs
- Compress documents to save space
- Add watermarks or headers/footers
- Update document metadata

### Analysis and Reporting
- Generate reports on document inventory
- Analyze disk usage by document type
- Identify duplicate documents
- Track document versions
- Audit document security and permissions
- Find outdated documents needing review

## Organization Strategies

### By Category
```
Documents/
├── Personal/
│   ├── Finance/
│   ├── Health/
│   ├── Legal/
│   └── Education/
├── Work/
│   ├── Clients/
│   ├── Projects/
│   ├── Proposals/
│   └── Contracts/
├── Reference/
│   ├── Manuals/
│   ├── Guides/
│   └── Research/
└── Templates/
```

### By Project
```
Documents/
├── Project-A/
│   ├── Drafts/
│   ├── Final/
│   └── Archive/
├── Project-B/
└── Active-Work/
```

### By Date
```
Documents/
├── 2025/
│   ├── Q1/
│   ├── Q2/
│   └── Archive/
├── 2024/
└── Archive/
```

## Best Practices

1. **Naming Conventions**: Use descriptive, consistent file names (e.g., `2025-01-15_ClientName_Proposal_v2.pdf`)
2. **Folder Structure**: Create logical, hierarchical folder organization
3. **Version Control**: Keep track of document versions with clear naming or version control systems
4. **Backups**: Regularly backup important documents to cloud storage or external drives
5. **Security**: Encrypt sensitive documents and control access permissions
6. **Metadata**: Add tags, descriptions, and metadata for easier searching
7. **Archiving**: Move old documents to archive folders to keep active workspace clean
8. **Templates**: Maintain a library of reusable document templates
9. **Scanning**: Use consistent scan settings and file naming for scanned documents
10. **Cleanup**: Regularly review and delete obsolete documents

## Document Workflows

### Creating Documents
- Start with templates when possible
- Save with descriptive names immediately
- Include version numbers in file names
- Save drafts in designated folders
- Use consistent formatting

### Reviewing Documents
- Track changes and comments
- Maintain review history
- Create review checklists
- Save review versions separately
- Document approval status

### Finalizing Documents
- Move from drafts to final folder
- Archive previous versions
- Apply final formatting
- Generate PDFs for distribution
- Update document registers

### Archiving Documents
- Move completed documents to archive
- Compress old documents to save space
- Maintain archive indexes
- Document retention policies
- Periodic archive cleanup

## Document Formats

### Text Documents
- `.txt` - Plain text
- `.md` - Markdown (preferred for version-controlled docs)
- `.docx` - Microsoft Word
- `.odt` - LibreOffice Writer
- `.rtf` - Rich Text Format

### PDFs
- Final documents and reports
- Scanned documents
- Forms and templates
- Signed documents
- Archived materials

### Spreadsheets
- `.xlsx` - Microsoft Excel
- `.ods` - LibreOffice Calc
- `.csv` - Comma-separated values

### Presentations
- `.pptx` - Microsoft PowerPoint
- `.odp` - LibreOffice Impress
- `.pdf` - PDF presentations

## Common Commands

### Document Conversion
```bash
# Convert DOCX to PDF using LibreOffice
libreoffice --headless --convert-to pdf document.docx

# Markdown to PDF using pandoc
pandoc document.md -o document.pdf

# Merge PDFs
pdfunite file1.pdf file2.pdf merged.pdf

# Extract text from PDF
pdftotext document.pdf output.txt

# OCR on scanned PDF
ocrmypdf input.pdf output.pdf
```

### Organization
```bash
# Find documents modified in last 7 days
find ~/Documents -type f -mtime -7

# Search document contents
grep -r "search term" ~/Documents

# Find large documents
find ~/Documents -type f -size +10M

# List documents by size
du -ah ~/Documents | sort -rh | head -20

# Find duplicate documents
fdupes -r ~/Documents
```

### Security
```bash
# Encrypt a document with GPG
gpg --encrypt --recipient user@email.com document.pdf

# Decrypt document
gpg --decrypt document.pdf.gpg > document.pdf

# Set restrictive permissions
chmod 600 sensitive-document.pdf
```

## Security and Privacy

### Sensitive Documents
- Encrypt financial records
- Protect medical documents
- Secure legal contracts
- Password-protect sensitive PDFs
- Use proper file permissions (600 or 640)

### Access Control
- Set appropriate file permissions
- Use encryption for sensitive data
- Control sharing permissions
- Audit document access
- Implement retention policies

### Data Protection
- Regular backups to multiple locations
- Version history for important documents
- Secure deletion of sensitive files
- Compliance with data protection regulations
- Document classification system

## Integration with Other Tools

### Office Suites
- LibreOffice for document editing
- Microsoft Office compatibility
- Google Docs for collaboration
- OnlyOffice for web-based editing

### PDF Tools
- CUPS-PDF for PDF creation
- Okular or Evince for viewing
- PDFtk for manipulation
- Poppler utilities for conversion

### Note-Taking
- Markdown editors (Typora, Mark Text)
- Obsidian for linked notes
- Joplin for encrypted notes
- Standard Notes for privacy

### Cloud Sync
- Nextcloud for self-hosted sync
- Syncthing for peer-to-peer sync
- Rclone for cloud storage integration
- Backup solutions (Restic, Borg)

## Automation Ideas

### Automated Organization
- Watch folder for new documents
- Auto-sort by file type or metadata
- Apply naming conventions automatically
- Move scanned documents to appropriate folders
- Tag documents based on content

### Scheduled Backups
- Daily backup of active documents
- Weekly full backup
- Monthly archive to external storage
- Cloud sync for critical documents
- Verify backup integrity

### Document Processing
- Auto-convert new DOCX to PDF
- OCR on scanned documents
- Extract metadata and index
- Compress old documents
- Generate document catalogs

## Working in This Directory

- Maintain consistent organization system
- Regular cleanup prevents clutter
- Use descriptive file names for searchability
- Keep working documents separate from archives
- Back up regularly and verify backups
- Encrypt sensitive information
- Consider document retention policies
- Use version control for important documents
- Implement consistent metadata tagging
