# ADR 0001: Persönliches Claude Code Playbook für alle eigenen Projekte

- Status: Akzeptiert
- Datum: 2026-10-19
- Autoren: apefrei

## Kontext

Ich arbeite in allen privaten Projekten mit Claude Code. Ohne gemeinsame Grundlage entstehen pro Projekt unterschiedliche Konventionen, Agent-Definitionen und Sicherheitsregeln. Das verursacht:

- Neu-Einarbeitung, wenn ein Projekt länger liegen geblieben ist
- Unterschiedliche Sicherheitsstandards (z.B. Auth-Behandlung, Migration-Prüfung)
- Doppelte Pflege ähnlicher Regeln
- Kein Lerneffekt zwischen Projekten (Lektionen bleiben lokal)

Constraints:

- Bestehende Projekte müssen weiterlaufen, ohne Massenmigration
- Verschiedene Stacks (TypeScript/React, Node-API, Docker, PHP-Altprojekte) müssen abgedeckt sein
- Neue Projekte sollen mit wenig Aufwand startklar sein

## Entscheidung

Ich pflege ein Playbook-Repo (`claude-playbook`), das per GitHub-Template oder Datei-Kopie in jedes Projekt übernommen wird.

## Begründung

- Einheitliche Sicherheits- und Qualitätsstandards über alle Projekte
- Lektionen aus einem Projekt können in andere übernommen werden
- Neue Projekte haben einen klaren Startpunkt
- Versionierung mit Tags erlaubt nachvollziehbare Updates
- Template-Ansatz akzeptiert bewusst leichte Drift zwischen Projekten gegenüber zentralem Submodul

## Verworfene Alternativen

- **Pro Projekt eigene Konventionen**: Maximum Flexibilität, aber kein Lerneffekt und unterschiedliche Sicherheitsniveaus
- **Git-Submodul mit zentralem Repo**: Stärkere Kopplung, aber operativer Overhead pro Update und Friction bei lokalen Anpassungen
- **NPM-Paket mit Konfiguration**: Funktioniert nur für JS-Projekte, schliesst PHP-Projekte aus
- **Nur globale `~/.claude/`-Konfiguration**: Nicht pro Projekt versioniert, geht auf neuen Rechnern und in Cloud-Sessions verloren

## Konsequenzen

Positiv:

- Eine Quelle für Regeln, Agents, Doku
- Versionierte Updates (Semver, CHANGELOG, Tags)
- Neue Projekte starten mit sicheren Defaults
- Lektionen werden über Projekte hinweg geteilt

Negativ:

- Drift zwischen Projekten ist möglich, da Updates manuell übernommen werden
- Pro Projekt muss entschieden werden, welche Regeln zutreffen (z.B. Frontend-Regeln in einem reinen PHP-Projekt ignorieren)

Folgearbeit:

- Strategie für Sync der Updates in bestehende Projekte klären (eigener ADR, sobald entschieden)
- Bestehende Projekte bei nächster grösserer Änderung auf das Playbook anheben
- Lessons-Review einmal pro Quartal, um wiederkehrende Themen ins Playbook zu heben

## Verweise

- [`README.md`](../../README.md)
- [`CONTRIBUTING.md`](../../CONTRIBUTING.md)
- [`CHANGELOG.md`](../../CHANGELOG.md)
