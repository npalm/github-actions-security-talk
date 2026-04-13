#!/bin/bash
# Toggle slides hidden/visible in Marp deck
# Usage:
#   ./scripts/toggle-slide.sh hide "Vetting & Dependency Mirror"
#   ./scripts/toggle-slide.sh unhide "Vetting & Dependency Mirror"
#   ./scripts/toggle-slide.sh list
#
# Hidden slides are wrapped in <!-- HIDDEN:Name ... END:Name -->
# The dev server auto-rebuilds on save.

DECK="slides-bsidesgrun26.md"
ACTION="${1:-list}"
NAME="$2"

if [ "$ACTION" = "list" ]; then
  echo "=== Hidden slides ==="
  grep -n "^<!-- HIDDEN:" "$DECK" | sed 's/<!-- HIDDEN:/  /' | sed 's/$//'
  echo ""
  echo "=== To unhide: ./scripts/toggle-slide.sh unhide \"Name\" ==="
  exit 0
fi

if [ -z "$NAME" ]; then
  echo "Usage: $0 hide|unhide \"Slide Name\""
  echo "       $0 list"
  exit 1
fi

if [ "$ACTION" = "hide" ]; then
  # Find the slide comment and wrap content until next ---
  echo "TODO: Manual hide not yet implemented."
  echo "Ask Copilot to hide a slide by name instead."
  exit 1

elif [ "$ACTION" = "unhide" ]; then
  if ! grep -q "HIDDEN:${NAME}" "$DECK"; then
    echo "No hidden slide matching '${NAME}' found."
    echo "Run: $0 list"
    exit 1
  fi

  # Remove the HIDDEN: opening marker
  sed -i '' "s/^<!-- HIDDEN:${NAME}$/---\n\n<!-- ${NAME} -->/" "$DECK"
  # Remove the END: closing marker
  sed -i '' "/^END:${NAME} -->$/d" "$DECK"
  echo "✅ Unhidden: ${NAME}"
  echo "Dev server will auto-rebuild."

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 hide|unhide|list \"Slide Name\""
  exit 1
fi
