---
description: Tech Stacks, Build-Commands und Projektstruktur für Entwicklungsprojekte
globs: "*.ts,*.tsx,*.js,*.jsx,*.mjs,*.cjs,*.vue,*.svelte,*.astro,*.php,package.json,composer.json,Dockerfile,docker-compose*.yml"
---

# Entwicklungs-Stack

Pro Projekt auf den tatsächlich genutzten Stack zuschneiden. Nicht zutreffende Abschnitte löschen.

## Stack erkennen

Bevor du Commands ausführst oder Code schreibst, erkenne Framework und Paketmanager:

| Hinweis im Repo | Framework |
|---|---|
| `next.config.*` | Next.js |
| `vite.config.*` ohne Meta-Framework | Vite (React, Vue, Svelte, Solid) |
| `nuxt.config.*` | Nuxt |
| `svelte.config.*` | SvelteKit |
| `astro.config.*` | Astro |
| `angular.json` | Angular |
| `react-router.config.*` | React Router (Framework Mode, ehemals Remix) |
| `nest-cli.json` | NestJS |
| `express`, `fastify`, `hono` in `package.json` | Node-API |

| Lockfile | Paketmanager |
|---|---|
| `package-lock.json` | npm |
| `pnpm-lock.yaml` | pnpm |
| `yarn.lock` | yarn |
| `bun.lock` / `bun.lockb` | bun |

Immer den Paketmanager des Lockfiles verwenden, nie mischen. Ohne Lockfile: npm.

## Tech Stacks

### Allgemein für alle JS/TS-Projekte
- Sprache: TypeScript (strict)
- Styling: Tailwind CSS
- Linting: ESLint, Prettier
- Tests: vitest (Unit), Playwright (E2E)
- Validierung: zod

### Vite + React (Standard für einfache SPAs und PWAs)
- UI: React
- Data Fetching: TanStack Query
- Routing: React Router
- Tests: React Testing Library

### Next.js (Standard für Fullstack- und SEO-relevante Projekte)
- App Router, Server Components als Default, `"use client"` nur wo nötig
- Server Actions oder Route Handlers für Mutationen
- ORM: Drizzle oder Prisma
- Auth: Auth.js oder Better Auth

### Vue / Nuxt
- Composition API mit `<script setup lang="ts">`
- State: Pinia
- Nuxt: Server Routes unter `server/api/`

### Svelte / SvelteKit
- Svelte 5 mit Runes (`$state`, `$derived`, `$props`)
- SvelteKit: Daten über `load`-Funktionen, Mutationen über Form Actions

### Astro
- Für content-lastige Seiten (Blogs, Landingpages, Doku)
- Statisch by default, Islands nur für interaktive Teile

### Angular
- Standalone Components, Signals
- Angular CLI für Generierung und Build

### Backend / API
- Node.js mit Express, Fastify, Hono oder NestJS
- Datenbank: PostgreSQL (`pg`, Drizzle oder Prisma)
- Auth: bcrypt/argon2 für Passwörter, `jose` oder `jsonwebtoken` für JWT
- Absicherung: helmet (bzw. Framework-Äquivalent), CORS, Rate Limiting

### Infrastruktur
- Lokal und Produktion: Docker / Docker Compose
- CI/CD: GitHub Actions
- Secret-Scanning: gitleaks

### PHP (Altprojekte)
- Plain PHP 8+ in Docker, PSR-12 Standard
- Composer, falls vorhanden

## Build & Test Commands

Die Scripts aus `package.json` verwenden, nicht die Framework-CLI direkt. Mit dem erkannten Paketmanager (`npm run`, `pnpm`, `yarn`, `bun run`):

```bash
<pm> install        # Install dependencies
<pm> run dev        # Development server
<pm> run build      # Production build
<pm> test           # Run tests
<pm> run lint       # Linting
<pm> run format     # Prettier (if defined)
```

Typecheck, falls kein eigenes Script existiert:

| Framework | Typecheck |
|---|---|
| Vite, Next.js, Node | `npx tsc --noEmit` (bei Project References `npx tsc -b`) |
| Nuxt | `npx nuxi typecheck` |
| SvelteKit | `npx svelte-check` |
| Astro | `npx astro check` |
| Vue (Vite) | `npx vue-tsc --noEmit` |
| Angular | `npx ng build` (prüft Typen beim Build) |

### Docker
```bash
docker compose up -d       # Start services
docker compose logs -f     # Follow logs
docker compose down        # Stop services
```

## Verifikation

Prüfe JEDE Änderung bevor du sie als fertig meldest:
1. Build muss durchlaufen
2. Linting und Typecheck müssen bestehen
3. Falls UI-Änderung: beschreibe was du visuell erwartest

## Verbotene Eigenimplementierungen

Baue folgendes NIEMALS selbst. Verwende die genannte Bibliothek oder frage nach:

| Thema | Verwende stattdessen |
|---|---|
| Auth/Login | Auth.js, Better Auth, Supabase Auth, Clerk |
| Passwort-Hashing | bcrypt, argon2 |
| JWT | jose, jsonwebtoken |
| Krypto allgemein | `node:crypto` / Web Crypto, keine eigenen Algorithmen |
| E-Mail | Resend, Postmark |
| Zahlungen | Stripe SDK |
| Datei-Upload | multer, UploadThing, presigned URLs |
| Rate Limiting | express-rate-limit, @upstash/ratelimit, Framework-Middleware |
| Validierung | zod |
| Bot-Schutz | Cloudflare Turnstile, hCaptcha |

## Projektstruktur

Die Konvention des Frameworks hat Vorrang. Ohne Framework-Vorgabe (Vite + separate API):

```
├── src/                  # Frontend
│   ├── components/
│   │   ├── ui/           # Reusable UI components
│   │   └── features/     # Domain-specific components
│   ├── pages/            # Route components
│   ├── hooks/            # Custom hooks / composables
│   ├── lib/              # Utility functions, API client, configuration
│   └── types/            # TypeScript types
├── api/                  # Backend (Express, Fastify, Hono)
│   └── src/
├── db/                   # Schema, migrations, init scripts
├── docker-compose.yml
└── .github/workflows/    # CI/CD
```

Next.js: `src/app/` (Routen), `src/components/`, `src/lib/`, `src/server/` (DB-Queries, Services, nie im Client importieren).
