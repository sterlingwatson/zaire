#!/bin/bash
# publish.sh — Sync vault to Quartz with publish-friendly swaps
# Place this next to your quartz folder, NOT inside it
# Usage: ./publish.sh        (sync + local preview)
#        ./publish.sh deploy  (sync + push to GitHub)

VAULT="/Users/sterlingwatson/Library/Mobile Documents/com~apple~CloudDocs/Documents/Daggerheart"
QUARTZ=~/Repos/quartz

echo "=== Syncing vault to Quartz ==="
rsync -av --delete \
  --exclude='.obsidian' \
  --exclude='99 - Archive' \
  --exclude='00 - Templates' \
  --exclude='05 - GM Resources' \
  --exclude='*.canvas' \
  --exclude='.DS_Store' \
  --exclude='publish.sh' \
  --exclude='.gitignore' \
  "$VAULT/" "$QUARTZ/content/"

echo ""
echo "=== Swapping plugin files for publish versions ==="

# Maps: replace Leaflet version with static image version
if [ -f "$QUARTZ/content/05 - GM Resources/Maps/World Map Published.md" ]; then
  rm -f "$QUARTZ/content/05 - GM Resources/Maps/Maps.md"
  mv "$QUARTZ/content/05 - GM Resources/Maps/World Map Published.md" \
     "$QUARTZ/content/05 - GM Resources/Maps/Maps.md"
  echo "  Maps.md → static image version"
fi

# Timeline: replace plugin version with clean prose version
if [ -f "$QUARTZ/content/03 - World/Lore/Timeline Published.md" ]; then
  rm -f "$QUARTZ/content/03 - World/Lore/Timeline.md"
  mv "$QUARTZ/content/03 - World/Lore/Timeline Published.md" \
     "$QUARTZ/content/03 - World/Lore/Timeline.md"
  echo "  Timeline.md → prose version (no plugin blocks)"
fi

# Remove any leftover "Published" files so they don't show as separate pages
find "$QUARTZ/content/" -name "* Published.md" -delete

# Remove plugin setup guides (GM-only)
rm -f "$QUARTZ/content/05 - GM Resources/Timeline and Calendar Setup.md"
rm -f "$QUARTZ/content/05 - GM Resources/Quartz GitHub Pages Setup.md"

echo ""
if [ "$1" = "deploy" ]; then
  echo "=== Deploying to GitHub ==="
  cd "$QUARTZ"
  npx quartz sync
  echo ""
  echo "Done! Site will update in a few minutes at:"
  echo "https://sterlingwatson.github.io/zaire/"
else
  echo "=== Building local preview ==="
  cd "$QUARTZ"
  npx quartz build --serve
fi
