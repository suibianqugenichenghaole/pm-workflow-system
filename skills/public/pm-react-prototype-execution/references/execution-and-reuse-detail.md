# Execution Flow, Reuse/Registry & Output Detail

On-demand detail for `SKILL.md`. Load when actually executing a round. `SKILL.md` keeps the gates, the read-order skeleton, the vertical-slice principle, the 8-step execution skeleton, the minimum per-page contract, and failure rules. This file holds: the shared component registry / reuse rules, the full per-step execution detail, and the per-page-spec / output expectations.

## Shared component registry & reuse rules

Before creating or changing any PM React prototype page, read the shared component registry first when it exists:
- `<projectsRoot>/_component-library/docs/registry/component-registry.md`

Treat this shared component registry as the first reuse source for PM workflow projects. Use the project-local components only after checking whether a shared component already exists.

Registry status handling:
- `active`: directly reuse or extend the component.
- `mapped-active`: use the mapped active component; do not create a duplicate component name.
- `candidate`: if the current page needs it, extract formal component source and README before spreading another page-local implementation.
- `needs-confirmation`: do not invent missing boundaries; ask, record the confirmation need, or keep the implementation page-local with a clear note.
- `planned`: temporary only; route it by `next_action` before implementation continues.
- `external-template`: use the referenced workflow/template shell source rather than treating it as component-library source debt.
- `deferred` / `drop`: do not block the current prototype round.

Allowed `next_action` values for `planned`:
- `extract_component`: implement component source, docs, and reusable reference now or in the immediate component pass.
- `wait_for_more_screens`: keep page-local until more references validate the pattern.
- `merge_with_existing`: map to an existing active component.
- `defer`: postpone.
- `drop`: stop tracking.

When the project already has a token layer, read the relevant tokens before styling new pages or components.
Prefer token reuse over scattered hardcoded visual values.

When the round is strengthening a backend workbench from real screenshots:
- do not stop at token tuning
- first check whether the missing realism is actually a reusable component grammar issue
- prefer extracting stable backend building blocks such as:
  - filter bars
  - toolbars
  - tree/list/table containers
  - compact action-row patterns
- keep those reusable assets inside the canonical template project first; promote only the stable method back into skills later

For PM workflow projects under `<projectsRoot>`, prefer promoting stable reusable assets into:
- `<projectsRoot>/_component-library`

Do not hide reusable backend form controls, App display controls, or embedded review shells inside a business page when they belong to the shared component layer.

## Execution flow (full per-step detail)

Follow this order.

### 1. Confirm current round

Restate:
- round goal
- in-scope pages
- out-of-scope items
- known unstable items

Purpose:
- prevent silent scope expansion

### 2. Check reuse first

Inspect only directly relevant:
- shared component registry at `<projectsRoot>/_component-library/docs/registry/component-registry.md`
- existing shared components
- existing theme tokens
- existing mock data
- directly related pages

Purpose:
- reuse before creating
- prevent rebuilding registered controls inside a business page
- route every relevant `planned` registry entry by `next_action` before treating it as implementation guidance

### 3. Build page skeletons

For each in-scope page, create or update:
- `index.tsx`
- `spec.md`
- `style.css` only when needed

When `spec.md` does not exist yet, initialize it from:
- `references/prototype-page-spec-template.md`

Purpose:
- make each page a real tracked artifact

If the page is configuration-driven or state-heavy, also leave enough adjacent documentation for future continuation to answer:
- which states were truly covered this round
- which config or rule items affect visible UI

This can live inside `spec.md` or in nearby mapping docs, but it must exist somewhere obvious.

### 4. Choose the first vertical slice when needed

If the page is simple, continue directly to state and interaction implementation.

If the page is complex, choose the first slice before writing broad code.

For each selected slice, define:
- user trigger
- visible modules touched
- state before the trigger
- state after success
- failure or boundary state when relevant
- data or mock needed
- rule-to-UI mapping being proven
- minimum validation method

Keep the slice small enough to finish and verify in the current round.

### 5. Implement states and interactions

Implement only the current round's:
- default state
- key alternate states
- core interactions

Do not silently expand into deferred cases.

For vertical-slice work, complete the selected slice before moving to a second slice unless the user explicitly asks for broader scaffolding first.

### 6. Accumulate shared assets carefully

When repetition is justified:
- extract shared components
- update theme assets
- create or update minimal mock data

Do not abstract too early just to look tidy.
Do not leave stable visual decisions scattered across page files when a token layer already exists.
Do not recreate controls that already exist in the shared component registry. If a needed control only exists as an inline implementation inside a template or business page, extract it into the shared component library before using it in a new business prototype.

### 7. Validate the prototype

Run a minimum runtime/build validation so the round produces a runnable baseline instead of an aspirational one.

Validation should answer:
- does it compile
- does it load
- are obvious runtime failures present

For complex or risky slices, also run a slice-level verification check:
- can the trigger be performed in the UI or simulated clearly
- does the expected success state appear
- does the key failure/boundary state appear or remain documented as a known gap
- does the page spec mention the state coverage and known gaps

Do not turn this into a full production TDD workflow unless the user asks for real implementation quality. For prototypes, the goal is to prove visible behavior and rule expression, not exhaustive automated tests.

When tests already exist or the project has a lightweight test harness, use them for risky behavior. Otherwise, use runtime validation plus browser/manual verification notes.

### 8. Update project-local memory

After meaningful progress:
- update `current.md`
- append confirmed implementation decisions to `decisions.md`
- append unresolved blockers to `open-questions.md`
- append a compact trace line to `changelog.md`

## Per-page spec expectations

The page-level `spec.md` should stay implementation-adjacent and capture:
- page goal
- main modules
- states implemented in the current round
- key interactions
- data needs
- known gaps

For state-heavy or config-driven pages, also capture or point to:
- state mapping
- config/rule-to-UI mapping

When the project uses backend/app token files, note the main token families the page depends on.

If code changes materially, keep the page spec aligned.

## Output expectations

Structure execution output around:
1. round identity
2. implemented pages
3. vertical slices completed, when relevant
4. state coverage
5. shared asset updates and registry status changes
6. validation result
7. unresolved items
8. next recommended action

For each completed vertical slice, name:
- trigger
- implemented success path
- implemented failure or boundary path, if any
- visible modules touched
- validation performed
- known gaps

## Vertical slice principle (full)

For non-trivial prototype work, prefer small vertical slices over broad horizontal implementation.

A vertical slice means one visible behavior path that can be understood and checked end to end, for example:
- a filter field changes the table result and empty state
- a save action validates fields, shows success/failure, and preserves user input on failure
- a status switch changes available actions and disabled visual behavior
- a selection flow opens a modal, chooses data, writes it back to the page, and clears dependent fields when the upstream choice changes

Use vertical slices when the page is:
- state-heavy
- interaction-heavy
- configuration-driven
- shared across backend/App/embedded review surfaces
- likely to create hidden rule or state drift

Do not use vertical slicing as an excuse to underbuild the page skeleton. First create enough layout structure to make the slice visible, then implement the slice end to end.

Avoid horizontal implementation such as:
- building all static layout before any key behavior works
- styling every module before validating the main interaction
- creating mock data everywhere before deciding which states matter
- extracting components before one concrete behavior path proves the pattern

When in doubt, pick the slice that carries the most product truth.

## Relationship with existing PM skills (full)

Upstream `pm-requirement-intake` owns requirement clarification, readiness judgment, and rule-gap identification; this skill must not replace it.

Upstream `pm-demo-design` hands off round identity, round goal, page list, page modules, page states, key interactions, rule-to-UI mapping, data expectations, out-of-scope items, and known unstable items; this skill consumes that handoff and builds the actual prototype baseline.

Downstream `pm-embedded-prd` consumes the prototype baseline produced here as the right-side artifact.

Downstream `pm-project-ops` manages the prototype baseline produced here as a first-class artifact with explicit version/baseline identity.

## Recommended project layout (full)

This skill works best when the project has at least:

```text
project-root/
  src/
    prototypes/
    components/
    themes/
    database/
    docs/
      project-memory/
  pm/
    handoffs/
    baselines/
```

Adapt to the real project if it already has an established structure, but preserve the same separation of concerns. When a new fusion project needs a starting skeleton, use `references/project-layout-template.md`.
