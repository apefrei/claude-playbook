---
description: Sicherheitsprüfungen für Code-Dateien
globs: "*.ts,*.tsx,*.js,*.jsx,*.vue,*.svelte,*.astro,*.php"
---

# Sicherheit

- Keine Secrets (API-Keys, Passwörter, Tokens) im Code. Verwende Umgebungsvariablen.
- Alle Benutzereingaben validieren: zod (TypeScript), `filter_var` / eigene Validierung (PHP).
- SQL: nur parametrisierte Statements oder ORM. Nie String-Konkatenation.
- Kein `dangerouslySetInnerHTML` (React), `v-html` (Vue), `{@html}` (Svelte) oder `set:html` (Astro) ohne DOMPurify.
- Kein `eval()`, `Function()` oder `innerHTML` mit Benutzereingaben.
- HTTP-Antworten: keine sensitiven Daten in Fehlermeldungen.
- API-Routen, Server Actions, Route Handlers und Form Actions: Authentifizierung und Autorisierung prüfen.
- Secrets nur in Server-Code. Nie mit öffentlichem Prefix (`NEXT_PUBLIC_`, `VITE_`, `NUXT_PUBLIC_`, `PUBLIC_`) versehen, die landen im Client-Bundle.
- PHP: kein `$_GET`/`$_POST` direkt verwenden, immer sanitisieren.
- Express: helmet, CORS mit expliziter Origin-Liste, Rate Limiting auf Auth-Routen.
- KI-API-Keys (Anthropic, OpenAI, Gemini) nur serverseitig verwenden, nie im Frontend-Bundle.
- Secret-Scanning (gitleaks) und `npm audit` laufen in CI (`.github/workflows/ci.yml`), Treffer blockieren Merge.
- SBOM für jedes Production-Deployment generieren.

Details in [`docs/devsecops.md`](../../docs/devsecops.md).
