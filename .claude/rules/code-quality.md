---
description: Code-Qualitätsregeln für TypeScript und PHP
globs: "*.ts,*.tsx,*.js,*.jsx,*.php"
---

# Code-Qualität

## TypeScript / JavaScript
- Strict mode: keine `any` Types, alle Funktionen typisiert.
- Fehlerbehandlung: try/catch mit sinnvollen Meldungen, keine leeren catch-Blöcke.
- Kein `console.log` im Produktionscode. Im Backend einen Logger verwenden (z.B. pino).
- Komponenten unter 200 Zeilen. Bei Überschreitung aufteilen.
- Kein duplizierter Code. Gemeinsame Logik in Hilfsfunktionen extrahieren.
- Imports: absolute Pfade bevorzugen (z.B. `@/lib/utils`).

## PHP
- PSR-12 Coding Standard einhalten.
- Typisierung: PHP 8+ Type Hints verwenden.
- Keine unterdrückten Fehler (`@`-Operator vermeiden).
- Datenbankzugriff nur über PDO mit Prepared Statements.
