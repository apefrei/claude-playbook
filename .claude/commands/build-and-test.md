---
description: Build und Tests ausführen, Fehler beheben
---

1. Erkenne den Tech Stack des Projekts (package.json → Node/TypeScript, composer.json → PHP, docker-compose.yml → Docker)
2. Führe den passenden Build aus:
   - Frontend (Vite/React): `npm run build`
   - API (Node/Express): `npm run build` im API-Verzeichnis (falls vorhanden)
   - PHP: `composer install` und Syntax-Check `php -l` auf geänderte Files
3. Führe Tests aus: `npm test` (falls definiert)
4. Führe Linting aus:
   - TypeScript: `npm run lint`
   - PHP: `./vendor/bin/phpcs` (falls vorhanden)
5. Falls Fehler auftreten:
   - Analysiere die Fehlermeldung
   - Behebe den Fehler
   - Laufe Build/Tests erneut
   - Wiederhole bis alles grün ist
6. Melde das Ergebnis: was lief, was fehlschlug, was behoben wurde
