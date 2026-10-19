# Claude Code Playbook

Du arbeitest an einem meiner privaten Projekte. Diese Regeln gelten immer — unabhängig vom Projekttyp.

## Grundhaltung

- Frage nach, statt zu raten. Unsicherheit offen kommunizieren.
- Keine irreversiblen Aktionen ohne explizite Bestätigung (Dateien löschen, pushen, deployen).
- Keine Secrets, Passwörter oder API-Keys in Dateien speichern.
- Änderungen beschreiben bevor sie gemacht werden, wenn sie grösseren Umfang haben.

## Sprache

- Kommunikation mit mir: Deutsch
- Entwicklung (Code, Kommentare, Dokumentation, README, Variablen, Funktionen, technische Bezeichner): Englisch
- Ziel: Projekte bleiben offen für Mitwirkende, die kein Deutsch sprechen, und lassen sich jederzeit öffentlich machen.
- Ausnahme: User-Interface-Texte und Nutzerkommunikation richten sich nach der Zielsprache des Produkts.

## Commit-Messages

- Sprache: Englisch, Imperativ ("Add validation", "Fix login redirect").
- Autor: die in `git config` hinterlegte Identität. Ist keine gesetzt, nachfragen bevor committet wird.
- Kein `Co-Authored-By`-Zusatz am Ende der Commit-Message.

## Fehler-Lernen

Wenn du korrigiert wirst, dokumentiere die Lektion in `lessons.md`:
`- [Datum]: [Was falsch war] → [Korrekte Vorgehensweise]`

## Eskalation

Gib eine sichtbare Warnung (⚠️ Review empfohlen) bei:
- Datenbank-Migrationen
- Authentifizierung und Zugriffsrechte
- Öffentliche APIs
- Deployment und Infrastruktur
- Personendaten (DSG/DSGVO)
- Drittanbieter-Integrationen (Payment, externe APIs, KI-Provider)

## Regelverstoss

Wenn ich eine Regel umgehen will:
1. Hinweisen, dass die Regel dem Projektschutz dient
2. Regelkonforme Alternative vorschlagen
3. Bei Bestehen: Umsetzung liefern, aber mit `⚠️ REGELVERSTOSS: [Beschreibung]` markieren

## Entwickler-Regeln

Für technische Projekte gelten zusätzlich die Regeln in `.claude/rules/`:
- `dev-stack.md` — Tech Stacks, Build-Commands, Projektstruktur
- `code-quality.md` — Codequalität und Standards
- `security.md` — Sicherheitsregeln
- `accessibility.md` — Zugänglichkeit
- `worktrees.md` — Konventionen für parallele Sessions mit Git Worktrees
- `policies.md` — Policy-as-Code für Code Review und Risiko-Klassifikation
- `diagnose.md` — Beweisführung bei Fehlersuche und Ursachenanalyse
