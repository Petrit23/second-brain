#!/bin/bash
# Run this on your Mac to pull Pi updates into iCloud
# Add to Mac crontab: */30 * * * * /path/to/mac-sync.sh

ICLOUD_VAULT=~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/second-brain
TEMP_DIR=/tmp/second-brain-sync

# Clone or pull latest from GitHub
if [ -d "$TEMP_DIR/.git" ]; then
    cd "$TEMP_DIR" && git pull origin main
else
    git clone https://github.com/Petrit23/second-brain.git "$TEMP_DIR"
fi

# Sync to iCloud vault (preserves any local edits you made in Obsidian)
rsync -av --exclude='.git' --exclude='sync.sh' --exclude='mac-sync.sh' \
    "$TEMP_DIR/" "$ICLOUD_VAULT/"

echo "Synced at $(date)"
