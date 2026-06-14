# Specs

Create one directory per feature, fix, or meaningful change:

```text
.ai/specs/<short-feature-name>/
  requirements.md
  design.md
  tasks.md
```

Start from `_template/` when creating a new spec.

## Naming

- Use lowercase kebab-case directory names.
- Keep names short and tied to behavior, such as `library-scan-status` or `model-search-filters`.

## Lifecycle

1. Write requirements.
2. Draft the design.
3. Break work into tasks.
4. Implement against the task list.
5. Update the spec if scope changes.
6. Record verification before closing the work.
