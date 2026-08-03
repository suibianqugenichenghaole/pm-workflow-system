---
name: prototype-export-intake
description: "Extract structured page, annotation, and visual evidence from an exported prototype package before requirements are finalized. Use when the source is prototype-export data rather than a clean PRD; do not use for ordinary screenshot absorption or requirement writing."
---

# Prototype Export Intake

Use this skill when the source is an exported prototype package rather than a clean PRD.

The goal is to extract evidence before treating a prototype, export folder, or rendered image as confirmed business truth.

## Source hierarchy

Keep these sources distinct:

- the user's visible project or page tree
- export filesystem structure
- serialized export data
- prototype canvas structure
- annotation or rule text
- image resources
- later user confirmations

An export folder or internal group is not proof of a business module. Explicit annotations and later confirmed corrections are stronger than visual appearance alone.

## Required flow

1. Read the visible page tree or request it when absent.
2. Inspect the export shape without treating folders as the product structure.
3. Search raw and decoded export data for page names, rule terms, annotations, and linked resources.
4. Extract three evidence buckets for each target page: canvas structure, rule or annotation text, and image resources.
5. Reconcile evidence into: confirmed, visible-only, conflicted or likely stale, and unknown.
6. Present a compact requirement slice for confirmation.
7. Only after confirmation, write to the project requirement layer and project-local memory.

## Export-data checks

Export formats often split evidence across serialized data, compressed blocks, and outer raw text. Search all available representations. Do not stop at a rendered preview or decoded payload if raw annotation text may exist elsewhere.

For formats that store pages, annotations, and pasted images separately, map evidence back to the target page using stable page, canvas, parent, or resource identifiers where available.

## Output format

```md
## Page evidence
- Page:
- Export page or canvas blocks:
- Rule or annotation blocks:
- Visual resources:

## Confirmed from source
- ...

## Visible only or likely stale
- ...

## Cross-module hooks
- ...

## Needs confirmation
- ...
```

## Boundaries

- Use `pm-design-absorption` for ordinary screenshots or design references.
- Use `pm-requirement-intake` to converge scope and rules after evidence is extracted.
- Treat canvas structure as designed UI evidence, not final implementation behavior.
- Treat explicit annotations and confirmed user corrections as stronger than image-only inference.
- Record cross-module effects as open hooks rather than pretending one page closes the whole business flow.
