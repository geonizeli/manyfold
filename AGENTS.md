# Agent Instructions

This fork permits AI-assisted development. Work in this repository should follow a spec-driven workflow so human intent, design choices, and verification steps are explicit before implementation. `CLAUDE.md` points to this file, so these instructions are shared by Codex, Claude, and other coding agents that read either file.

## Scope

- These instructions apply to this fork only.
- Do not assume upstream accepts AI-assisted contributions.
- Do not submit AI-assisted changes upstream unless the upstream project policy, CLA, and funding requirements explicitly allow it at that time.

## Spec-Driven Workflow

Use `.ai/specs/` for feature and change planning.

For each meaningful change, create or update a spec directory:

```text
.ai/specs/<short-feature-name>/
  requirements.md
  design.md
  tasks.md
```

Before editing application code:

1. Capture user-facing goals and constraints in `requirements.md`.
2. Describe the proposed technical approach in `design.md`.
3. Break implementation and verification work into trackable steps in `tasks.md`.

Small mechanical fixes may use a shorter spec, but the intent and verification plan should still be written down.

## Engineering Rules

- Prefer existing Rails, Ruby, TypeScript, Hotwire, and project-local patterns.
- Keep changes scoped to the requested behavior.
- Preserve user changes already present in the worktree.
- Add or update tests when behavior changes.
- Run the smallest useful verification command before reporting completion.
- Document any skipped verification and the reason.

## Communication

- State assumptions clearly.
- Surface tradeoffs before making broad architectural changes.
- Keep generated explanations concise and tied to the spec.
- Update the active spec when implementation diverges from the original plan.

## Commit Messages

- For AI-assisted commits, include the model used in the commit message, for example `Model used: GPT-5 Codex`.

## Default Agent Workflow

1. Read the relevant files and any existing spec.
2. Update the spec before implementation when the change is non-trivial.
3. Implement the smallest coherent change.
4. Run focused verification.
5. Report changed files, verification results, and any remaining risks.
