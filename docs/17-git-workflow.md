# Git Workflow

How to contribute to PrinceTheme like a pro.

## Branching Strategy
We use a simple Feature Branch workflow.
- **`main`**: The stable, production-ready code.
- **`feature/*`**: New features (e.g., `feature/new-icons`).
- **`fix/*`**: Bug fixes (e.g., `fix/alignment-issue`).

## Commit Messages
We follow Conventional Commits:
- `feat: add support for NixOS icon`
- `fix: correct typo in theme.txt`
- `docs: update installation guide`
- `style: clean up whitespace`

## Pull Requests (PRs)
1.  Push your branch.
2.  Open a PR on GitHub.
3.  Fill out the template.
4.  Wait for review.

## Releasing
When tagging a new release (e.g., `v1.0.0`):
1.  Update `version` in metadata (if any).
2.  Tag the commit in Git.
3.  Draft a Release on GitHub.
