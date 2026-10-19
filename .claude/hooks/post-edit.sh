#!/bin/bash
# Post-Edit Hook: Formatierung nach jeder Dateiänderung
# Wird automatisch von Claude Code ausgelöst (settings.json → PostToolUse)

FILE="$CLAUDE_FILE_PATHS"

if [ -z "$FILE" ]; then
  exit 0
fi

# Erkennung anhand Dateiendung
case "$FILE" in
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css|*.md)
    # TypeScript / JavaScript Projekte: Prettier (nur wenn im Projekt installiert)
    if [ -f "package.json" ] && [ -x "node_modules/.bin/prettier" ]; then
      ./node_modules/.bin/prettier --write "$FILE" 2>/dev/null
    fi
    ;;
  *.php)
    # PHP: PHP CS Fixer (falls im Projekt installiert)
    if [ -f "vendor/bin/php-cs-fixer" ]; then
      ./vendor/bin/php-cs-fixer fix "$FILE" --quiet 2>/dev/null
    fi
    ;;
esac

exit 0
