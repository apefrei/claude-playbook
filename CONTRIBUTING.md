# Playbook pflegen

Wie ich das Playbook erweitere und Verbesserungen aus Projekten zurückführe.

## Erste Schritte

1. Repo klonen
2. `claude` im Projektverzeichnis starten
3. `/help` zeigt verfügbare Commands

## Workflow

1. Feature-Branch von `main` erstellen, Naming `feat/<kurzbeschreibung>` oder `fix/<kurzbeschreibung>`
2. Änderungen committen (siehe Commit-Regeln unten)
3. Branch pushen, PR auf `main` öffnen
4. Agent-Review laufen lassen, bei Hochrisiko-Änderungen den Diff selbst bewusst durchgehen (siehe [`.claude/rules/policies.md`](.claude/rules/policies.md))
5. `CHANGELOG.md` im selben PR ergänzen
6. Bei Release: Tag setzen (siehe Versionierung)

Kleine Korrekturen (Tippfehler, Klarstellungen) dürfen direkt auf `main`.

## Commits

- Sprache: Englisch, Imperativ ("Add validation", "Fix typo"), wie in [`CLAUDE.md`](CLAUDE.md)
- Eine logische Änderung pro Commit
- Bei Hochrisiko-Änderungen: Verweis auf ADR oder Spec im Commit-Body

## Versionierung

Semantic Versioning ([semver.org](https://semver.org/lang/de/)):

- **Major** (`v1.0.0`): inkompatible Änderung an Regeln oder Struktur, Migration in den Projekten nötig
- **Minor** (`v0.3.0`): neue Doku, neue Rules, neue Agents, abwärtskompatibel
- **Patch** (`v0.2.1`): Korrekturen, Tippfehler, Klarstellungen

Tag erst nach Merge auf `main` setzen. Annotated Tag mit Version und kurzer Zusammenfassung. `CHANGELOG.md` enthält die Details.

## Rules erweitern

Wenn eine neue Regel nötig ist:

1. `.md`-Datei in `.claude/rules/` anlegen
2. Frontmatter mit `description` und optional `globs` setzen
3. Regel kurz und konkret formulieren
4. Bei deterministisch prüfbaren Mustern: in [`policies.md`](.claude/rules/policies.md) verlinken

## Doku erweitern

Ausführliche Anleitungen gehören in `docs/`. Knappe, von Claude gelesene Regeln in `.claude/rules/`.

Faustregel: Wenn ein Mensch einen Absatz Text braucht, gehört es nach `docs/`. Wenn Claude eine direkte Regel braucht, in `.claude/rules/`.

## Architecture Decision Records

Bei Hochrisiko-Änderungen oder grundlegenden Konventionsänderungen ist ein ADR Pflicht. Siehe [`docs/adr/README.md`](docs/adr/README.md).

## Lektionen pflegen

Wenn Claude einen Fehler macht und korrigiert wird:

1. Sofort korrigieren, nicht durchlaufen lassen
2. Lektion in [`lessons.md`](lessons.md) festhalten
3. Bei Wiederholung: Regel in `.claude/rules/` schärfen oder Hook ergänzen
4. Lektionen, die nicht projektspezifisch sind, aus dem Projekt ins Playbook zurückführen

## Lokale Einstellungen

Overrides in `.claude/settings.local.json` (git-ignored). Nicht einchecken.

## Wichtige Prinzipien

- **CLAUDE.md schlank halten.** Nur was jede Session braucht.
- **Rules konkret und maschinenlesbar.** Was deterministisch prüfbar ist, in `policies.md`.
- **Hooks für Determinismus.** Was immer passieren muss (Formatting, Secret-Scan), gehört in Hooks.
- **lessons.md pflegen.** Jede dokumentierte Lektion spart in späteren Projekten Zeit.
- **Risk-Based Reviews.** Hochrisiko-Änderungen nie ungesehen mergen (siehe `policies.md`).
