# Update Notes

This file records the main changes represented by the current local workflow package relative to the earlier public packaging snapshot.

It is meant to help with the next public-sync round, not to replace the README.

---

## 2026-08-03 public sync

- Added:
  - `prototype-export-intake`: extracts page structure, annotation text, visual resources, and unresolved conflicts from exported prototype packages before requirement confirmation.
- Packaging notes:
  - README and README.zh-CN add the skill to the current update and skill list.
- Sanitization:
  - The skill describes generic export evidence and does not include real project data.

---

## What changed in the internal workflow line

- the workflow is no longer only `requirement -> demo -> embedded PRD -> project ops`
- it now also includes a validated `pm-react-prototype-execution` layer for runnable prototype baselines
- a formal design-absorption path is now part of the working method instead of staying as ad hoc screenshot imitation
- embedded review shells now use:
  - draggable split
  - right-to-left focus updates
  - requirement-type-driven default pane bias
- the canonical workflow root is now an explicit reusable template project, not a loose starter scaffold
- reusable UI code assets are expected to accumulate in the canonical template first
- workflow skills should carry the method and reuse rule, not duplicate component source code

---

## Practical preconditions before using the workflow well

The workflow works best when these preconditions are met:

1. You have a real project-assets root and explicit init/config in place.
2. You have at least one bounded requirement round instead of a vague long chat.
3. You preserve project-local working memory and baseline pointers.
4. For design-heavy rounds, you collect a small but representative reference set first.

That design-reference set usually means:
- 1 to 3 screenshots of the real product or the closest shipped page
- clear identification of which page is in scope for the current round
- enough reference to distinguish atmosphere problems from component-grammar problems

Without that reference set, design absorption easily turns back into generic beautification.

---

## What was newly learned from the backend realism round

- `DESIGN.md` helps correct atmosphere, but it does not automatically produce native-feeling Chinese B-end backend pages
- backend realism depends heavily on exact component grammar from shipped screenshots, especially:
  - label-left filter rows
  - compact toolbars
  - tree/list/table density
  - row action rhythm
- if a page only becomes "more polished" but still reads like a prototype shell, the enhancement round is not complete

---

## Attribution and selective adoption boundary

Part of this workflow line was strengthened through selective absorption of ideas from `Axhub Make`.

The public package should describe that truthfully:
- this package is not an official Axhub Make distribution
- it does not bundle Axhub Make code or private assets
- it selectively absorbs workflow ideas and operating patterns that were validated in real use

Recommended public wording:
- "This workflow package includes methods refined through real PM workflow practice and selective absorption of ideas from Axhub Make, with the final structure adapted into an independent reusable workflow system."

That keeps the attribution honest without pretending the public package is the original source project.

---

## Public-sync implications

Before the next GitHub sync, check at least these:

- whether `pm-react-prototype-execution` should now be added to the public workflow package
- whether the public package should document design-reference intake as a precondition
- whether the sample project should remain purely neutral or gain a more realistic prototype-side example
- whether the Axhub Make attribution note should live in README, UPDATE-NOTES, or both

---

## 2026-05 public sync additions

- Added `pm-prd-writer` for page-oriented, implementation-readable PRD writing after requirements and page/prototype baselines are already clarified.
- Strengthened shared component registry handling across demo design, design absorption, and React prototype execution.
- Added `docs/component-library/component-registry.md` as a registry-state reference for `active`, `candidate`, `needs-confirmation`, `mapped-active`, `external-template`, `deferred`, and `drop`.
- Updated embedded PRD shell guidance to prefer canonical shell templates and record shell customization back to the template source when reusable.
- Sanitized local project-root references to `<projectsRoot>` in public skill guidance.

## 2026-06-07 skill-only public sync

- Added:
  - `request-triage`: routes incoming requests into fast, standard, or deep workflow lanes before PM work begins.
  - `pm-value-anchor`: clarifies target value, minimum success, evidence, and scope implications before requirement intake.
  - `audience-judgment-framing`: frames PRDs, reviews, embedded PRDs, and handoff artifacts around reader judgment and evidence needs.
  - `pm-devil-advocate`: challenges value, assumptions, scope, evidence, and failure modes before expensive work accumulates.
  - `pm-requirement-reverse-audit`: stress-tests high-risk requirement logic with business-model counterexamples before PRD review.
- Updated:
  - `pm-react-prototype-execution`: added vertical-slice guidance for risky prototype behavior paths and slice-level verification.
- Packaging notes:
  - README and README.zh-CN now group workflow intake, value framing, challenge, audit, production, and asset/memory skills separately.
  - No project assets were included in this sync.
- Sanitization:
  - Local project-root references were rewritten to `<projectsRoot>`.
  - Private project details were excluded.

## 2026-06-08 skill-only public sync

- Updated:
  - `pm-prd-writer`: split the long body into on-demand `references/` files (operation branches, field/linkage/interaction, large-PRD compression, final self-check) so the core skill stays lean while the detailed templates load only when needed.
  - `pm-react-prototype-execution`: moved the registry/reuse rules, full per-step execution detail, and per-page-spec/output expectations into `references/execution-and-reuse-detail.md`.
  - `pm-project-ops`: moved the PM + React fusion operating pattern, continuation discipline, and method-migration rules into `references/pm-react-fusion-ops.md`.
  - `pm-demo-design`: sharpened the description to claim the non-runnable "demo structure / page planning" lane and route runnable React implementation to `pm-react-prototype-execution`.
  - `pm-devil-advocate`: added colloquial challenge triggers and symmetric routing to `pm-requirement-reverse-audit` for high-risk transaction/state/role requirements.
- Packaging notes:
  - README / README.zh-CN skill list and positioning unchanged (no skills added or removed); only existing skills were refined.
  - No project assets were included in this sync.
- Sanitization:
  - Local absolute paths rewritten to `<projectsRoot>` placeholders.
  - Out-of-package routing references (skills not published here) were checked and kept excluded.
  - Private project details were excluded.
