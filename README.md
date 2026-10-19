# Claude Playbook

Meine persönliche Grundlage für Coding-Projekte mit Claude Code.

Das Playbook ist Template für neue Projekte und Referenz für bestehende. Es definiert, wie Claude Code in meinen Projekten arbeitet: Regeln, Agents, Slash-Commands, Permissions und Workflow-Konventionen.

## Warum mit dem Playbook arbeiten

**Konsistenz über Projekte hinweg**
Jedes Projekt startet mit denselben Konventionen. Claude verhält sich überall gleich, egal wie lange ein Projekt liegen geblieben ist.

**Weniger Erklären, weniger Fehler**
Sicherheitsregeln, Tech-Stack-Konventionen und Eskalationsregeln sind dokumentiert. Claude muss nicht raten, ich muss nicht jedes Mal erklären.

**Sichere Defaults**
Keine irreversiblen Aktionen ohne Bestätigung, keine Secrets im Code, klare Warnungen bei sensiblen Bereichen (Auth, Migrationen, Personendaten).

**Parallele Arbeit ohne Chaos**
Konventionen für Worktrees, Sessions, Plan-Mode und Auto-Accept. Mehrere Claude-Sessions gleichzeitig produktiv führen.

**Lerneffekt über Projekte hinweg**
`lessons.md` sammelt Korrekturen aus realen Sessions. Was in einem Projekt schiefging, fliesst ins Playbook zurück und gilt danach überall.

**Moderne Engineering-Praxis eingebaut**
Agentic Code Review mit Policy-as-Code, ADRs für Architekturentscheidungen, Continuous Testing inklusive KI-Evals, DevSecOps mit Secret-Scanning und SBOM, Progressive Delivery mit Feature-Flags, Guardrails für Agent-Workflows.

## Was drin ist

- Tech-Stack-Regeln für alle gängigen JS/TS-Frameworks (Next.js, Vite + React, Vue/Nuxt, Svelte/SvelteKit, Astro, Angular), Node-APIs, PostgreSQL, Docker und PHP für Altprojekte
- Agents für Review, Verifikation und Specs
- Slash-Commands für Build, Review und Commit-Workflows

## Schnellstart

### Voraussetzungen

- [Claude Code installieren](https://code.claude.com/docs): `npm install -g @anthropic-ai/claude-code`

### Neues Projekt

1. Auf GitHub: "Use this template" → "Create a new repository"
2. `git clone git@github.com:apefrei/<projekt>.git`
3. `claude` im Projektverzeichnis starten

Damit "Use this template" erscheint, muss das Repo einmalig unter Settings → General als **Template repository** markiert sein.

### Bestehendes Projekt

```bash
cp -r /pfad/zu/claude-playbook/.claude/ ./.claude/
cp /pfad/zu/claude-playbook/CLAUDE.md ./CLAUDE.md
cp /pfad/zu/claude-playbook/lessons.md ./lessons.md
cp /pfad/zu/claude-playbook/.worktreeinclude ./.worktreeinclude
```

Danach `.claude/rules/dev-stack.md` auf das Projekt zuschneiden: nicht zutreffende Stacks löschen.

## Wegweiser

Ausführliche Anleitungen in [`docs/`](docs/):

- [Einstieg](docs/onboarding.md) — Schrittweiser Einstieg in die Arbeit mit dem Playbook
- [Claude Code Grundlagen](docs/claude-code-basics.md) — Sessions, Plan-Mode, Permissions, MCP
- [Worktrees](docs/worktrees.md) — Parallele Branches im Filesystem
- [Parallele Entwicklung](docs/parallel-development.md) — Workflow, Review-Kadenz, Auto-Accept
- [Sicherheit beim parallelen Arbeiten](docs/security-parallel.md) — Credentials, Migrationen
- [Agentic Code Review](docs/agentic-code-review.md) — Policy-as-Code und Human-in-the-Loop
- [Architecture Decision Records](docs/adr/README.md) — Architekturentscheidungen dokumentieren
- [Continuous Testing](docs/continuous-testing.md) — TDD mit Claude und KI-Evals
- [DevSecOps](docs/devsecops.md) — Secret-Scanning, SBOM, Dependency-Pflege
- [Progressive Delivery](docs/progressive-delivery.md) — CI/CD, Previews, Feature-Flags
- [Agent Guardrails](docs/agent-guardrails.md) — Limits und Observability

Regeln, die Claude direkt liest:

- [`CLAUDE.md`](CLAUDE.md) — Kern-Regeln, gelten in jeder Session
- [`.claude/rules/`](.claude/rules/) — Tech-Stack, Sicherheit, Codequalität, Zugänglichkeit, Worktrees, Diagnose
- [`lessons.md`](lessons.md) — Lektionen aus realen Korrekturen

## Was im Repo liegt

```
├── CLAUDE.md                  # Kern-Regeln, jede Session
├── .worktreeinclude           # Files, die in neue Worktrees kopiert werden
├── .claude/
│   ├── settings.json          # Berechtigungen und Hooks (im Repo)
│   ├── rules/                 # Tech-Stack, Security, Quality, A11y, Worktrees, Policies, Diagnose
│   ├── commands/              # /commit-push-pr, /review, /build-and-test, /setup-statusline
│   ├── agents/                # code-reviewer, verify-app, spec-writer
│   ├── hooks/                 # Auto-Formatting nach Edits
│   ├── statusline.sh          # Statuszeile (macOS/Linux), optional, per /setup-statusline
│   └── statusline.ps1         # Statuszeile (Windows), optional, per /setup-statusline
├── .mcp.json                  # MCP-Server (GitHub, erweiterbar)
├── docs/                      # Ausführliche Anleitungen
├── lessons.md                 # Lektionen aus realen Korrekturen
└── CONTRIBUTING.md            # Wie ich das Playbook pflege
```

## Verfügbare Agents und Commands

| Agent | Zweck |
|---|---|
| `code-reviewer` | Sicherheits- und Qualitätsreview |
| `verify-app` | Build und Tests verifizieren |
| `spec-writer` | Spec aus Issue, Bug oder Notiz erzeugen |

| Command | Zweck |
|---|---|
| `/commit-push-pr` | Committen, pushen, PR erstellen |
| `/review` | Code Review des aktuellen Branches |
| `/build-and-test` | Build und Tests laufen lassen |
| `/setup-statusline` | Statuszeile einrichten (optional) |

## Lokale Anpassung

Overrides pro Rechner oder Projekt in `.claude/settings.local.json` (git-ignored):

```json
{
  "permissions": {
    "allow": ["Bash(docker *)"]
  }
}
```

## Pflege

Siehe [CONTRIBUTING.md](CONTRIBUTING.md). Korrekturen aus realen Sessions gehören in [`lessons.md`](lessons.md).

## Lizenz

MIT
