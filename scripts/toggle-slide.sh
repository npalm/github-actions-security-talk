#!/bin/bash
# Toggle slides hidden/visible in Marp deck
# Usage:
#   ./scripts/toggle-slide.sh list
#   ./scripts/toggle-slide.sh unhide "Slide Name"
#
# Hidden slides are stored in the parked file.
# The dev server auto-rebuilds on save.

DECK="slides-bsidesgrun26.md"
PARKED="slides-bsidesgrun26-parked.md"
ACTION="${1:-list}"
NAME="$2"

if [ "$ACTION" = "list" ]; then
  echo "=== Parked (hidden) slides ==="
  if [ -f "$PARKED" ]; then
    grep "PARKED:" "$PARKED" | sed 's/<!-- PARKED:/  /' | sed 's/ -->//'
  else
    echo "  (none - no parked file found)"
  fi
  echo ""
  echo "=== To restore: ./scripts/toggle-slide.sh unhide \"Name\" ==="
  exit 0
fi

if [ -z "$NAME" ]; then
  echo "Usage: $0 unhide \"Slide Name\""
  echo "       $0 list"
  exit 1
fi

if [ "$ACTION" = "unhide" ]; then
  if ! grep -q "PARKED:${NAME}" "$PARKED" 2>/dev/null; then
    echo "No parked slide matching '${NAME}' found."
    echo "Run: $0 list"
    exit 1
  fi

  echo "Found '${NAME}' in parked file."
  echo "To restore, manually copy the slide content from:"
  echo "  ${PARKED}"
  echo "Search for: <!-- PARKED:${NAME} -->"
  echo "Copy everything between PARKED and END markers back into ${DECK}."

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 unhide|list \"Slide Name\""
  exit 1
fi
