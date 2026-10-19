# Changelog

Alle nennenswerten Änderungen am Claude Playbook. Format nach [Keep a Changelog](https://keepachangelog.com/de/1.1.0/), Versionsnummern nach [Semantic Versioning](https://semver.org/lang/de/).

## [Unreleased]

## [0.1.0] - 2026-10-19

Initialer Stand als persönliches Playbook für private Projekte.

### Hinzugefügt
- `CLAUDE.md` mit Kern-Regeln, Eskalationsregeln, Sprach- und Regelverstoss-Konventionen
- `.claude/rules/` mit `dev-stack.md`, `security.md`, `code-quality.md`, `accessibility.md`,
  `worktrees.md`, `policies.md`, `diagnose.md`
- `.claude/commands/` mit `/commit-push-pr`, `/review`, `/build-and-test`, `/setup-statusline`
- `.claude/agents/` mit `code-reviewer`, `verify-app`, `spec-writer`
- `.claude/hooks/post-edit.sh` für Auto-Formatting
- `.claude/statusline.sh` (macOS/Linux) und `.claude/statusline.ps1` (Windows), opt-in
- `.worktreeinclude` mit gitignore-Syntax für sensitive Files
- `docs/` mit Einstieg, Grundlagen, Worktrees, paralleler Entwicklung, Agentic Code Review, ADRs,
  Continuous Testing, DevSecOps, Progressive Delivery und Agent Guardrails
- `lessons.md` als laufendes Lern-Dokument

[Unreleased]: https://github.com/apefrei/claude-playbook/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/apefrei/claude-playbook/releases/tag/v0.1.0
