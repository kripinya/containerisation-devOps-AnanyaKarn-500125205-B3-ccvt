#!/bin/bash

# Configuration
TITLE="Containerisation and DevOps Lab Report"
AUTHOR="Ananya Karn"
SAPID="500125205"
BASE_URL="https://kripinya.github.io/containerisation-devOps-AnanyaKarn-500125205-B3-ccvt"

# Discover markdown files from README.md links
FILES=("README.md")

# Extract links from README.md, skipping empty or non-markdown links
# We look for links like [text](path/to/file.md) or [text](<path with spaces/file.md>)
EXTRACTED_FILES=$(grep -E "\[.*\]\(<?.*\.md>?\)" README.md | sed -E 's/.*\(<?([^>)]*\.md)>?\).*/\1/')

# Add extracted files to the list
while read -r file; do
    if [[ -f "$file" ]]; then
        FILES+=("$file")
    fi
done <<< "$EXTRACTED_FILES"

# Generate URL array for validation or reference
URLS=()
for file in "${FILES[@]}"; do
    # Convert local path to URL (assuming Jekyll-style .html conversion or raw .md access)
    # For pandoc compilation, local files are more reliable
    URLS+=("$BASE_URL/${file// /%20}")
done

# Check if any pages were found
if [[ ${#FILES[@]} -eq 0 ]]; then
    echo "No experiment pages found."
    exit 1
fi

# Compile using Pandoc
# Using local files for better image resolution and reliability
echo "Generating PDF from ${#FILES[@]} pages..."

# Build resource path from all directories containing markdown files
RESOURCE_PATH=$(find . -type d -not -path '*/.*' | tr '\n' ':' | sed 's/:$//')

pandoc "${FILES[@]}" \
    -o output.pdf \
    --pdf-engine=xelatex \
    --toc \
    --number-sections \
    -V title="$TITLE" \
    -V author="$AUTHOR (SAP ID: $SAPID)" \
    -V geometry:margin=1in \
    -V mainfont="Arial" \
    --resource-path="$RESOURCE_PATH"

if [[ $? -eq 0 ]]; then
    echo "Successfully generated output.pdf"
else
    echo "Failed to generate PDF. Ensure pandoc and xelatex are installed."
    exit 1
fi
