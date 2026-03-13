#!/bin/bash
# Auto-push second-brain updates to GitHub
cd /home/petritkrasniqi/second-brain
git add -A
if ! git diff --cached --quiet; then
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M')"
    git push origin main
fi
