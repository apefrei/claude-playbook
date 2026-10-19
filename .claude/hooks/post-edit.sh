#!/bin/bash
# Post-Edit Hook: formatiert die geänderte Datei (settings.json → PostToolUse).
# Claude Code übergibt den Tool-Aufruf als JSON auf stdin.

FILE=$(jq -r '.tool_input.file_path // empty' 2>/dev/null)
[ -n "$FILE" ] && [ -f "$FILE" ] || exit 0
cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0

case "$FILE" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs|*.vue|*.svelte|*.astro|*.json|*.css|*.scss|*.html|*.md)
    # Nur ein im Projekt installiertes Prettier, nie per npx nachladen
    [ -x node_modules/.bin/prettier ] && node_modules/.bin/prettier --write "$FILE" >/dev/null 2>&1
    ;;
  *.php)
    [ -x vendor/bin/php-cs-fixer ] && vendor/bin/php-cs-fixer fix "$FILE" --quiet >/dev/null 2>&1
    ;;
esac

exit 0
