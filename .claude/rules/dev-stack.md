---
description: Tech Stacks, Build-Commands und Projektstruktur für Entwicklungsprojekte
globs: "*.ts,*.tsx,*.js,*.jsx,*.php,package.json,composer.json,Dockerfile,docker-compose*.yml"
---

# Entwicklungs-Stack

Pro Projekt auf den tatsächlich genutzten Stack zuschneiden. Nicht zutreffende Abschnitte löschen.

## Tech Stacks

### Frontend (Standard für neue Projekte)
- Build: Vite mit TypeScript (strict)
- UI: React
- Styling: Tailwind CSS
- Data Fetching: TanStack Query
- Routing: React Router
- Paketmanager: npm
- Linting: ESLint, Prettier
- Tests: vitest, React Testing Library
- Validierung: zod

### Backend / API
- Runtime: Node.js mit Express
- Datenbank: PostgreSQL (`pg` oder ein Query Builder)
- Auth: bcrypt für Passwörter, `jose` oder `jsonwebtoken` für JWT
- Absicherung: helmet, cors, express-rate-limit

### Infrastruktur
- Lokal und Produktion: Docker / Docker Compose
- CI/CD: GitHub Actions
- Secret-Scanning: gitleaks

### PHP (Altprojekte)
- Plain PHP 8+ in Docker, PSR-12 Standard
- Composer, falls vorhanden

## Build & Test Commands

### Frontend
```bash
npm install         # Install dependencies
npm run dev         # Development server
npm run build       # Production build (tsc + vite build)
npm test            # Run tests
npm run lint        # Linting
npm run format      # Prettier
```

### API
```bash
cd api
npm install         # Install dependencies
npm run dev         # Development server (if defined)
npm test            # Run tests
```

### Docker
```bash
docker compose up -d       # Start services
docker compose logs -f     # Follow logs
docker compose down        # Stop services
```

## Verifikation

Prüfe JEDE Änderung bevor du sie als fertig meldest:
1. Build muss durchlaufen
2. Linting muss bestehen
3. Falls UI-Änderung: beschreibe was du visuell erwartest

## Verbotene Eigenimplementierungen

Baue folgendes NIEMALS selbst. Verwende die genannte Bibliothek oder frage nach:

| Thema | Verwende stattdessen |
|---|---|
| Passwort-Hashing | bcrypt, argon2 |
| JWT | jose, jsonwebtoken |
| Krypto allgemein | `node:crypto`, keine eigenen Algorithmen |
| E-Mail | Resend, Postmark |
| Zahlungen | Stripe SDK |
| Datei-Upload | multer, presigned URLs |
| Rate Limiting | express-rate-limit |
| Validierung | zod |
| Bot-Schutz | Cloudflare Turnstile, hCaptcha |

## Projektstruktur (Frontend + API)

```
├── src/                  # Frontend (Vite + React)
│   ├── components/
│   │   ├── ui/           # Reusable UI components
│   │   └── features/     # Domain-specific components
│   ├── pages/            # Route components
│   ├── hooks/            # Custom React hooks
│   ├── lib/              # Utility functions, API client, configuration
│   └── types/            # TypeScript types
├── api/                  # Backend (Express)
│   └── src/
├── db/                   # Schema, migrations, init scripts
├── docker-compose.yml
└── .github/workflows/    # CI/CD
```
