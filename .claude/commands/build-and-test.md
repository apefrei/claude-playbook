---
description: Build und Tests ausführen, Fehler beheben
---

1. Erkenne Framework und Paketmanager nach `.claude/rules/dev-stack.md` (Config-Files, Lockfile), dazu composer.json → PHP, docker-compose.yml → Docker
2. Führe den Build über das `build`-Script aus `package.json` aus, mit dem Paketmanager des Lockfiles (`npm run build`, `pnpm build`, `yarn build`, `bun run build`)
   - Separate API (z.B. `api/`): dort ebenfalls bauen
   - PHP: `composer install` und Syntax-Check `php -l` auf geänderte Files
3. Führe Tests aus (`test`-Script, falls definiert)
4. Führe Linting und Typecheck aus:
   - JS/TS: `lint`-Script, Typecheck je nach Framework (siehe Tabelle in `dev-stack.md`)
   - PHP: `./vendor/bin/phpcs` (falls vorhanden)
5. Falls Fehler auftreten:
   - Analysiere die Fehlermeldung
   - Behebe den Fehler
   - Laufe Build/Tests erneut
   - Wiederhole bis alles grün ist
6. Melde das Ergebnis: was lief, was fehlschlug, was behoben wurde
