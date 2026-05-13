---
name: pm-design-absorption
description: Turn screenshots, design mockups, and prototype references into stable component, page-skeleton, and rule updates for the PM + React workflow instead of one-off imitation.
---

# PM Design Absorption

Act as a design-absorption skill, not as a generic screenshot summarizer.

## Core job

When the user provides screenshots, mockups, prototype images, or says "照着这个继续做", do four things:

1. classify what kind of reference this is
2. extract reusable structure instead of only visual imitation
3. decide whether the change belongs to component, page skeleton, or rule layer
4. update formal assets so future rounds improve instead of repeating guesswork

## Use this skill when

- the user sends real product screenshots
- the user sends design-phase prototype images
- the user says the current output still does not look like the real product
- a page correction should change the component library, not only one page

## Do not use this skill when

- the task is only requirement clarification
- there is no visual reference and no existing design baseline to compare
- the user only wants a quick verbal explanation

## Read order

Read only the minimum useful set:

1. the new image references
2. shared component registry when available:
   - `<projectsRoot>\_component-library\docs\registry\component-registry.md`
3. current relevant component docs
4. current representative preview pages
5. component evolution log if there is a likely repeated mismatch

Recommended project files:
- `src/docs/design-absorption/design-absorption-workflow.md`
- `src/docs/design-absorption/incoming-reference-template.md`
- `src/docs/design-absorption/component-evolution-log.md`
- `src/docs/components/component-baseline.md`

Recommended shared component-library files:
- `<projectsRoot>\_component-library\README.md`
- `<projectsRoot>\_component-library\docs\registry\component-registry.md`
- `<projectsRoot>\_component-library\docs\absorption\`

## Classification step

Before changing anything, classify the reference:

### Reference truth level
- online reality
- design-stage proposal
- local partial reference

### Change type
- new component
- known component new state
- page skeleton change
- only visual polish

## Extraction rule

Extract in this order:

1. page structure
2. information hierarchy
3. repeated interaction entry points
4. state differences
5. visual detail

Do not start from colors or decoration if the structural pattern is still unclear.

## Update targets

A useful absorption round should update at least two of:
- component code
- component docs
- preview html
- page skeleton docs
- evolution log

If you only edited one preview page, the absorption round is incomplete.

For PM workflow projects under `<projectsRoot>`, if the reference reveals a stable reusable control or shell, update the shared component library first or record why it should remain project-local:
- component code under `<projectsRoot>\_component-library\src\`
- registry under `<projectsRoot>\_component-library\docs\registry\component-registry.md`
- absorption note under `<projectsRoot>\_component-library\docs\absorption\`

## Registry state rule

The registry is a component maturity map, not a parking lot. `planned` may only be a temporary entry and must carry `next_action`.

When a screenshot or prototype reference reveals a possible reusable component:

1. Check whether an `active` component already covers it.
2. If yes, mark or use `mapped-active` and name the existing component.
3. If not covered but the pattern is stable, register it as `candidate`.
4. If the pattern looks reusable but key boundaries are unclear, register it as `needs-confirmation` and list the missing confirmations.
5. If it is only a single weak case, use `deferred` or `wait_for_more_screens` instead of pretending it is ready.
6. If it should not be reused, mark `drop` or remove it from tracking.
7. Only mark `active` after formal component source, README/docs, and a reusable reference exist.

Allowed statuses:
- `planned`: newly discovered possible reusable component; must include `next_action`.
- `candidate`: stable reusable pattern confirmed, but no formal component source yet.
- `needs-confirmation`: likely reusable, but missing interaction boundary, naming, or scope confirmation.
- `mapped-active`: covered by an existing active component; do not create a duplicate.
- `active`: formal component source and docs exist; can be directly reused.
- `external-template`: capability lives in a workflow template or embedded shell, not component-library source.
- `deferred`: intentionally postponed until more scenarios appear.
- `drop`: not worth tracking as reusable.

Allowed `next_action` values:
- `extract_component`: implement component source and README next.
- `wait_for_more_screens`: wait for more references before extracting.
- `merge_with_existing`: map to an existing component.
- `defer`: postpone.
- `drop`: stop tracking.

Absorption output must state which registry entries changed and why.

## Trust labeling

Always keep a clear boundary between:
- confirmed from online screenshot
- inferred from design mockup
- temporary assumption still needing confirmation

Do not silently convert design intention into shipped truth.

## Iteration rule

When the user says:
- "还是不像"
- "这个细节不对"
- "我们平常不是这个页面"

do not just patch the current page.

You must also ask:
- which component definition was wrong
- which page skeleton was wrong
- whether a stable rule should be added

## Current high-priority examples

For this user's current workflow, prioritize absorption for:
- backend resource workspace
- album detail page
- landscape player
- purchase bar continuity
- exercise entry overlay
- playback marker strip

### Backend workspace reminder

When the reference is a real Chinese B-end backend page:
- do not treat `DESIGN.md` as sufficient by itself
- extract exact component grammar when visible, especially:
  - label-left filter rows
  - compact toolbar/button placement
  - tree/list/table density
  - row-level action wording and spacing
- prefer updating reusable backend components before celebrating page-level polish
- if the page only becomes "more polished" but still does not read like a backend workbench, the absorption round is not complete yet

For backend edit forms, check `backend/edit` in the shared component library before patching a page directly. Label-left rows, input counters, selects, radio groups, switches, number inputs, upload fields, hints, and error states should become or reuse shared edit components.

## Change Log

- 2026-04-27: Added shared component library read/write targets so screenshot absorption updates `<projectsRoot>\_component-library` instead of remaining chat-only or page-local.

## Output expectation

Structure work around:
1. what was learned
2. what became a reusable asset
3. what was updated
4. what still needs confirmation

## Practical reminder

The goal is not "copy this screenshot once".

The goal is:
- next time the user sends another screenshot, the system starts from stronger assets
- next time a similar page is built, it is closer by default
