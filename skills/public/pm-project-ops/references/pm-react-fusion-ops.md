# PM + React Fusion Operating Pattern & Method Migration

On-demand detail for `SKILL.md`. Load when the workflow includes runnable React prototype work, or when absorbing methods from another workflow. `SKILL.md` keeps the boundary rules and the "minimum acceptance for workflow fused" gate; this file holds the operational-object detail, the recommended file structure, and the migration rules.

## PM + React fusion operating pattern

When the workflow includes runnable React prototype work, do not stop at "there is a demo file" or "there is a React project". Make the round legible through explicit operational objects.

At minimum, maintain:
- one project-level current pointer file that tells readers what the active trusted round is
- one freeze-readiness judgment file for the current round when review or delivery preservation is being considered
- one preserved review baseline package when a round becomes worth referencing
- one project-local working memory area that carries active-round continuation without bloating global memory
- one explicit embedded-PRD pairing when left-doc/right-prototype review is part of the round

Prefer this minimum structure for PM + React fusion projects:
- `pm/baselines/current-baseline.md`
- `pm/baselines/freeze-readiness-current.md`
- `pm/baselines/review-baseline-vX.Y.md`
- `pm/baselines/review-baseline-vX.Y.json`
- `src/docs/project-memory/current.md`
- `src/docs/project-memory/decisions.md`
- `src/docs/project-memory/open-questions.md`
- `src/docs/project-memory/changelog.md`
- `draft/prd/embedded-prd-review-vX.Y.md`
- `draft/prd/embedded-prd-review-vX.Y.html`
- `draft/mappings/embedded-prd-linkage-vX.Y.json`

If a project does not yet need embedded PRD, keep the baseline and working-memory layers anyway.

## Continuation discipline

For PM + React fusion projects, always make continuation obvious.

The current pointer should answer:
- what the active round is
- whether the project is still in working state or has a preserved review baseline
- which requirement baseline, handoff, React entry, page spec, and embedded PRD belong to this round
- where the next editing round should resume

The preserved review baseline should answer:
- what exactly was frozen
- what it covers
- what it does not cover
- which files represent the stable reference point

Do not let continuation depend on remembering the conversation.

## Migration rule for imported methods

When absorbing ideas from another workflow or external prototyping tool:
- extract reusable method and asset-management rules, not business content from a pilot project
- keep imported reference material outside the formal project root until it is normalized into the template or current project assets
- do not leave critical method steps stranded in temporary folders such as `Downloads`
- once a pilot validates a pattern, write it back into skill/template rules so future projects do not depend on re-reading the pilot
