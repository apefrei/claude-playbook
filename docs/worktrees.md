# Worktrees

Git Worktrees erlauben mehrere ausgecheckte Branches im Filesystem nebeneinander, mit gemeinsamem `.git`. Damit kann eine zweite Claude-Session an einem anderen Branch arbeiten, ohne den Hauptbranch zu blockieren.

Die knappe Regelversion liegt in [`.claude/rules/worktrees.md`](../.claude/rules/worktrees.md). Dieses Dokument erklärt das Mentale Modell und den praktischen Umgang.

## Mentales Modell

Ein Worktree ist ein zweiter Ordner mit ausgechecktem Branch. Er teilt sich `.git` mit dem Hauptrepo, hat aber eigene Working Files.

Abgrenzung:

- Branch-Wechsel im selben Ordner: keine parallele Arbeit, alter Stand wird ersetzt
- Zweiter Klon: doppelter Speicher, getrennte Remotes, kein gemeinsames `.git`
- Worktree: paralleler Stand, gemeinsames `.git`, getrennte Working Files

## Befehle

```bash
git worktree add ../wt-42-stripe-webhook feature/42-stripe-webhook
git worktree list
git worktree remove ../wt-42-stripe-webhook
```

Standort-Konvention: Worktrees als Schwesterordner neben dem Hauptrepo, nicht im Repo selber. Beispiel:

```
~/workspace/
├── projekt-x/                       # Hauptrepo, main
├── wt-42-stripe-webhook/            # Worktree, feature-Branch
└── wt-57-hotfix-login/              # Worktree, hotfix-Branch
```

## Was nicht geteilt wird

Jeder Worktree hat eigene Working Files. Folgendes muss pro Worktree neu erzeugt werden:

- `node_modules` (`npm install`, bei separater API auch in `api/`)
- `vendor` (`composer install`)
- `dist`, `build`, `.vite`, `.next`, `.nuxt`, `.svelte-kit`, `.astro`
- Lokale Datenbank-Files (SQLite)

## Sensitive Files

Git-ignorierte Files wie `.env` werden nicht aus Git geladen. Claude Code kopiert sie über `.worktreeinclude` aus dem Hauptrepo in den neuen Worktree. Welche Files kopiert werden, steht in der `.worktreeinclude` im Repo-Root.

Die Datei verwendet gitignore-Syntax. Doku: [code.claude.com/docs/en/worktrees](https://code.claude.com/docs/en/worktrees).

## Ports und Dev-Server

Parallele Dev-Server auf demselben Port kollidieren. Pro Worktree einen anderen Port:

```bash
# Vite, Nuxt, SvelteKit, Astro
npm run dev -- --port 5174

# Next.js
npm run dev -- -p 3001

# Express (API)
PORT=3001 npm run dev

# Docker Compose: eigener Projektname, Host-Ports per .env überschreiben
docker compose -p projekt-x-wt42 up -d
```

Konvention: Hauptrepo behält Standard-Port (Vite 5173, Next.js und API 3000), Worktrees zählen hoch.

## Datenbanken

Eine geteilte lokale DB für mehrere Worktrees ist riskant: Migrationen kollidieren, Seeds überschreiben sich.

Optionen:

- Schema pro Worktree (Postgres: separates Schema, MySQL: separate Datenbank)
- Docker mit Branch-spezifischem Volume
- SQLite-Files pro Worktree (am einfachsten für kleine Projekte)

Bei Migrationen mit Datenrisiko: nur ein Worktree gleichzeitig migrieren. Siehe [`security-parallel.md`](security-parallel.md).

## Cleanup

Nach Merge:

```bash
git worktree remove ../wt-42-stripe-webhook
git branch -d feature/42-stripe-webhook
```

`git worktree remove` löscht den Branch nicht. Separat entfernen.

## Troubleshooting

**"fatal: ... is already checked out"**
Branch ist bereits in einem anderen Worktree aktiv. Prüfen mit `git worktree list`.

**"contains modified or untracked files"**
Worktree hat ungesicherte Änderungen. Entweder committen, stashen oder mit `--force` entfernen (Datenverlust möglich).

**Hooks laufen nicht**
Husky und ähnliche Tools brauchen oft `npm install` im Worktree, damit Hooks installiert werden.

**Worktree-Ordner manuell gelöscht**
`git worktree prune` räumt verwaiste Einträge auf.

## Claude Code mit mehreren Worktrees

- Eine Claude-Session pro Worktree, nicht eine Session über mehrere
- Permission-Settings (`.claude/settings.json`) sind pro Projekt, nicht pro Worktree
- Persönliche Overrides in `.claude/settings.local.json` werden via `.worktreeinclude` mitkopiert
