# Claude Code Grundlagen

Kurzer Überblick zu den wichtigsten Konzepten. Offizielle Doku: [code.claude.com/docs](https://code.claude.com/docs).

## Sessions

Eine Session ist ein laufendes Gespräch mit Claude in einem Projekt. Der Kontext (gelesene Files, Entscheidungen, Korrekturen) bleibt innerhalb der Session erhalten.

- Neue Session: `claude` im Projektverzeichnis
- Kontext leeren: `/clear`
- Session beenden: Ctrl+C oder `/exit`

## Plan-Mode

Bevor Claude Änderungen macht, schreibt sie zuerst einen Plan und wartet auf Freigabe.

- Aktivieren: Shift+Tab oder explizit anfordern ("erst Plan, dann Umsetzung")
- Geeignet für: Tasks mit mehr als zwei Files, Architektur-Änderungen, neue Features
- Nicht nötig für: Quick-Fixes, Typos, einzelne Variablen umbenennen

## Permissions

Permissions steuern, welche Befehle Claude ohne Rückfrage ausführen darf.

- Projekt-Regeln: `.claude/settings.json` (im Repo)
- Lokale Overrides: `.claude/settings.local.json` (git-ignored)
- Globale Einstellungen für alle Projekte: `~/.claude/settings.json`
- Regel hinzufügen: `/permissions` oder Skill `update-config`

Beispiel lokaler Override:

```json
{
  "permissions": {
    "allow": ["Bash(docker *)"]
  }
}
```

## Auto-Accept

Auto-Accept führt Tool-Aufrufe ohne Rückfrage aus. Aktivierbar mit Shift+Tab im Prompt.

Geeignet für Routine (Tests, Build, Linting). Nicht für irreversible Aktionen. Details in [`parallel-development.md`](parallel-development.md).

## Slash-Commands

Vordefinierte Workflows als Markdown in `.claude/commands/`.

| Command | Zweck |
|---|---|
| `/commit-push-pr` | Änderungen committen, pushen, PR erstellen |
| `/review` | Code Review des aktuellen Branches |
| `/build-and-test` | Build und Tests laufen lassen |
| `/setup-statusline` | Statuszeile einrichten (optional) |

Eigene Commands: Markdown-File in `.claude/commands/` ablegen.

## Agents

Spezialisierte Sub-Agents mit eigenem Kontext und Tool-Zugriff. Liegen in `.claude/agents/`.

| Agent | Zweck |
|---|---|
| `code-reviewer` | Gründliches Review mit Sicherheits- und Qualitätsfokus |
| `verify-app` | Build und Tests nach grösseren Änderungen |
| `spec-writer` | Spec aus Issue, Bug-Beschreibung oder Notiz erzeugen |

Aufruf: "Nutze den code-reviewer Agent" oder Claude wählt selbst.

## MCP

MCP (Model Context Protocol) bindet externe Tools an. Konfiguration in `.mcp.json` (Projekt, im Repo) oder über `claude mcp add` (lokal).

Typische Server: GitHub, Datenbanken, Supabase, Browser-Automation.

## Statusline

Zeigt Modell, Effort-Level, Ordner, Git-Branch und den angemeldeten Account, dazu Kontextnutzung,
Kosten, Laufzeit und die Rate-Limits (5 Stunden / 7 Tage) mit Countdown bis zum Reset.
Die Scripts liegen unter `.claude/statusline.sh` (macOS/Linux) und `.claude/statusline.ps1`
(Windows). Beide haben denselben Funktionsumfang.

Opt-in: standardmässig ist keine Statuszeile aktiv. `.claude/settings.json` im Repo enthält
bewusst keinen `statusLine`-Block. Wer sie will, führt `/setup-statusline` aus. Der Command
fragt zuerst den Geltungsbereich: **Projekt** (`.claude/settings.json`, gilt für jeden Clone
des Repos, wird committet) oder **persönlich** (`~/.claude/settings.json`, gilt für alle
Projekte, Repo bleibt unberührt).

## Hooks

Shell-Skripte, die bei Events ausgeführt werden (z.B. `post-edit` für Auto-Formatting). Liegen in `.claude/hooks/` und werden über `.claude/settings.json` registriert.
