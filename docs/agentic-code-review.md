# Agentic Code Review

Code Review ist zweistufig: ein Agent prüft deterministisch, ich entscheide risikobasiert.

## Zweistufiger Ablauf

1. **Agent** (`code-reviewer`) prüft jeden PR auf Sicherheit, Codequalität, Architektur, Tests
2. **Ich selbst** prüfe nach Risiko: hoch immer, mittel meist, niedrig stichprobenartig

Die Risikoklassen und Pflichten stehen in [`.claude/rules/policies.md`](../.claude/rules/policies.md).

## Policy-as-Code

Regeln, die der Agent maschinell durchsetzt, liegen in [`.claude/rules/policies.md`](../.claude/rules/policies.md). Damit:

- Sind Regeln versioniert und nachvollziehbar
- Gelten in jedem Projekt gleich
- Sind im Code-Review-Output begründbar (Verweis auf Regel)

Was deterministisch entschieden werden kann, gehört in `policies.md`. Was Urteilsvermögen braucht, entscheide ich.

## Risk-Based Human-in-the-Loop

| Risiko | Beispiel | Review |
|---|---|---|
| Hoch | Auth-Flow, Migration mit DROP, Payment-Integration | Agent plus vollständiges eigenes Review, mit Abstand (nicht direkt nach dem Schreiben) |
| Mittel | Neue API-Route, Schema-Erweiterung | Agent plus eigenes Review |
| Niedrig | Kosmetisches Refactoring, Test-Ergänzung | Agent, Stichproben selbst |

Regel: lieber eine Stufe höher einstufen als zu tief. Im Zweifel als hoch behandeln.

## Workflow im Repo

1. PR eröffnen
2. `code-reviewer` läuft (CI-Hook oder manuell via Agent-Aufruf)
3. Bei Hochrisiko: ADR verlinken, Rollback-Plan in PR-Beschreibung
4. Agent-Output selbst prüfen, ergänzt um Urteilsfragen
5. Merge erst nach beiden Stufen

## Wenn Agent und ich widersprechen

Ich entscheide. Aber: Begründung in PR-Diskussion festhalten, damit aus der Diskrepanz eine `policies.md`-Anpassung oder Lektion in `lessons.md` werden kann.

## Verwandt

- [`.claude/rules/policies.md`](../.claude/rules/policies.md)
- [`.claude/agents/code-reviewer.md`](../.claude/agents/code-reviewer.md)
- [`adr/README.md`](adr/README.md)
- [`agent-guardrails.md`](agent-guardrails.md)
