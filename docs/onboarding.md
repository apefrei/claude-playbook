# Einstieg

Schrittweiser Einstieg in die Arbeit mit Claude Code und dem Playbook. Auch nützlich als Auffrischung nach längerer Pause.

## Schritt 1: Eine Session, ein Task

Ziel: sicher mit einer Session arbeiten.

- [`CLAUDE.md`](../CLAUDE.md) lesen, Grundhaltung und Eskalationsregeln verstehen
- [`claude-code-basics.md`](claude-code-basics.md) lesen
- Erstes Feature in einem regulären Branch umsetzen, ohne Worktree
- Mit Plan-Mode arbeiten, Plan vor Umsetzung bewusst prüfen
- Bei jeder Korrektur: Lektion in [`lessons.md`](../lessons.md) festhalten

## Schritt 2: Zweite Session für Review

Ziel: Review parallel zur Entwicklung.

- Zweite Session öffnen, im selben Repo, ohne Worktree
- Code-Reviewer-Agent nutzen (`code-reviewer`) für eigene Änderungen vor PR
- Review-Kadenz aus [`parallel-development.md`](parallel-development.md) einhalten

## Schritt 3: Worktree für parallelen Branch

Ziel: zweiter Branch parallel.

- [`worktrees.md`](worktrees.md) lesen
- Ersten Worktree anlegen für Hotfix oder Experiment
- Naming und Cleanup nach Regel in [`.claude/rules/worktrees.md`](../.claude/rules/worktrees.md)
- Sicherheitsregeln aus [`security-parallel.md`](security-parallel.md) beachten

## Schritt 4: Drei Sessions parallel

Erst wenn die ersten Schritte sitzen.

- Maximal 2 bis 3 Sessions parallel
- Eine Session pro Worktree
- Plan-Mode in einer Session, während eine andere ausführt

## Wenn etwas unklar ist

- Frage in der Session stellen, Claude antwortet im Kontext
- Bei wiederkehrenden Korrekturen: in `lessons.md` festhalten
- Bei Unsicherheit über eine Regel: Regel im Playbook klarer formulieren statt raten
