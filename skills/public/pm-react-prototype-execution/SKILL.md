---
name: pm-react-prototype-execution
description: Turn a structured PM demo handoff into a runnable React prototype baseline with page specs, local project working memory, shared asset accumulation, and minimum runtime validation. Use when a requirement is already ready for demo/prototype execution and the goal is to build a maintainable React prototype instead of only discussing screens.
---

# PM React Prototype Execution

Act as a React prototype execution skill, not as a requirement-intake skill and not as a final PRD-composition skill.

## Core job

Turn a structured PM-side demo handoff into a runnable, maintainable prototype baseline that can later feed embedded-PRD and project-ops work.

This skill should:
- read a bounded PM handoff instead of reconstructing intent from raw chat
- build or update React prototype pages
- keep page code and page-level `spec.md` aligned
- accumulate reusable theme/component/data assets only when justified
- validate that the built prototype can actually run
- write high-frequency continuity into project-local working memory instead of global memory

## This skill is for

Use this skill when all of the following are true:
- the requirement is already ready for demo/prototype execution
- the in-scope pages are named
- the key states are named
- the core rule-to-UI effects are clear enough to implement honestly
- the user wants a running React prototype baseline, not only a planning artifact

## This skill is not for

Do not use this skill when:
- the requirement is still unclear or only ready for structure draft
- major business rules are still unstable
- page scope is still ambiguous
- the real task is final embedded-PRD composition
- the real task is version/freeze/baseline governance

When blocked by unstable requirement logic, return the issue upstream instead of guessing.

## Relationship with existing PM skills

### Upstream: `pm-requirement-intake`

That skill still owns:
- requirement clarification
- readiness judgment
- rule-gap identification

This skill must not replace it.

### Upstream: `pm-demo-design`

That skill should hand off:
- round identity
- round goal
- page list
- page modules
- page states
- key interactions
- rule-to-UI mapping
- data expectations
- out-of-scope items
- known unstable items

This skill consumes that handoff and builds the actual prototype baseline.

### Downstream: `pm-embedded-prd`

That skill should consume the prototype baseline produced here as the right-side artifact.

### Downstream: `pm-project-ops`

That skill should manage the prototype baseline produced here as a first-class artifact with explicit version/baseline identity.

## Read order

Before building anything, read only the minimum useful set in this order:

1. the current PM-side structured handoff
2. project-local working memory:
   - `current.md`
   - `decisions.md`
   - `open-questions.md`
   - recent relevant lines from `changelog.md`
3. existing related page specs and shared assets only if they are directly relevant

Do not begin by rereading long raw chat history unless the handoff is clearly insufficient.

For reusable templates, read these references only when needed:
- `references/react-ready-handoff-template.md`
- `references/project-memory-template.md`
- `references/prototype-page-spec-template.md`
- `references/project-layout-template.md`

When a project template already provides example docs for page spec, state mapping, or config mapping, prefer following those examples instead of inventing a new page-spec shape for the round.

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

## Entry gate

Before execution, verify all four gates:

### Gate 1: Readiness

The requirement is at least ready for demo/prototype execution.

### Gate 2: Scope

The current round has a bounded page scope.

Minimum:
- in-scope pages
- out-of-scope items

### Gate 3: Rule expression

There is a minimum rule-to-UI mapping.

Minimum:
- key rule -> page
- key rule -> visible UI effect or state

### Gate 4: Baseline identity

The current round has a visible identity.

Minimum:
- round label or version label
- stage label

If any gate fails, stop and say which missing condition blocks execution.

## Expected project-local memory

This skill prefers a local project working memory area.

Recommended files:
- `src/docs/project-memory/current.md`
- `src/docs/project-memory/decisions.md`
- `src/docs/project-memory/open-questions.md`
- `src/docs/project-memory/changelog.md`

When these files do not exist yet, initialize them from:
- `references/project-memory-template.md`

Use these files for high-frequency continuity.

Global memory should keep only:
- project pointer
- stage
- current baseline identity
- pointer to project-local memory

## Recommended project layout

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

Adapt to the real project if it already has an established structure, but preserve the same separation of concerns.

When a new fusion project needs a starting skeleton, use:
- `references/project-layout-template.md`

## Execution flow

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
- existing shared components
- existing theme tokens
- existing mock data
- directly related pages

Purpose:
- reuse before creating

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

### 4. Implement states and interactions

Implement only the current round's:
- default state
- key alternate states
- core interactions

Do not silently expand into deferred cases.

### 5. Accumulate shared assets carefully

When repetition is justified:
- extract shared components
- update theme assets
- create or update minimal mock data

Do not abstract too early just to look tidy.
Do not leave stable visual decisions scattered across page files when a token layer already exists.

### 6. Validate the prototype

Run a minimum runtime/build validation so the round produces a runnable baseline instead of an aspirational one.

Validation should answer:
- does it compile
- does it load
- are obvious runtime failures present

### 7. Update project-local memory

After meaningful progress:
- update `current.md`
- append confirmed implementation decisions to `decisions.md`
- append unresolved blockers to `open-questions.md`
- append a compact trace line to `changelog.md`

## Minimum per-page contract

Each in-scope page should leave the round with:
- a runnable page implementation
- a page-level `spec.md`
- implemented state coverage for this round
- any known gaps explicitly labeled

This prevents future rounds from depending on conversation archaeology.

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
3. state coverage
4. shared asset updates
5. validation result
6. unresolved items
7. next recommended action

## Failure rules

Stop and return upstream when:
- business truth would have to be invented
- required states are still unclear
- rule-to-UI effects are too ambiguous to implement honestly
- page scope is still unstable

Do not turn execution convenience into hidden business decisions.

## Practical reminder

Keep the PM workflow as the brain and this skill as the hands.

This skill should make React prototype work easier to continue, easier to validate, and easier to hand downstream.
