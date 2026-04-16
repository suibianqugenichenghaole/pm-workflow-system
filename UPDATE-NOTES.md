# Update Notes

This file records the main changes represented by the current local workflow package relative to the earlier public packaging snapshot.

It is meant to help with the next public-sync round, not to replace the README.

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
