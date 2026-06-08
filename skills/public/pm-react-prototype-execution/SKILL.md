---
name: pm-react-prototype-execution
description: "触发：ready demo handoff需做可运行React原型；不触发：需求/规则不稳→用pm-requirement-intake；嵌入式组装→用pm-embedded-prd；输出：React原型基线"
---

# PM React Prototype Execution

Act as a React prototype execution skill, not as a requirement-intake skill and not as a final PRD-composition skill.

## Core job

Turn a structured PM-side demo handoff into a runnable, maintainable prototype baseline that can later feed embedded-PRD and project-ops work.

This skill should:
- read a bounded PM handoff instead of reconstructing intent from raw chat
- build or update React prototype pages
- keep page code and page-level `spec.md` aligned
- implement by small verifiable vertical slices when behavior risk is high
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

Upstream `pm-requirement-intake` owns clarification, readiness, and rule-gap identification (do not replace it); upstream `pm-demo-design` hands off the structured round (identity, goal, page list/modules/states, interactions, rule-to-UI mapping, data, out-of-scope, unstable items) that this skill consumes. Downstream `pm-embedded-prd` consumes the prototype baseline as the right-side artifact; downstream `pm-project-ops` manages it as a versioned first-class artifact.

Full per-skill handoff detail: `references/execution-and-reuse-detail.md`.

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

For execution detail, load only when executing a round:
- `references/execution-and-reuse-detail.md`: registry/reuse rules, full per-step execution detail, per-page-spec and output expectations.

When a project template already provides example docs for page spec, state mapping, or config mapping, prefer following those examples instead of inventing a new page-spec shape for the round.

Before creating or changing any PM React prototype page, read the shared component registry first when it exists (`<projectsRoot>/_component-library/docs/registry/component-registry.md`) and treat it as the first reuse source — use project-local components only after checking for a shared one. Reuse token layers over hardcoded visuals, and do not hide reusable backend/App/embedded controls inside a business page when they belong to the shared component layer.

Full registry status handling (`active` / `mapped-active` / `candidate` / `needs-confirmation` / `planned` / `external-template` / `deferred` / `drop`), `planned` `next_action` routing, token-reuse, and backend-block extraction/promotion rules: `references/execution-and-reuse-detail.md`.

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

## Vertical slice principle

For non-trivial prototype work, prefer small vertical slices (one visible behavior path checked end to end) over broad horizontal implementation. Use slices for state-heavy, interaction-heavy, config-driven, cross-surface, or drift-prone pages; build just enough skeleton to make the slice visible, then implement it end to end. Do not build all static layout, style every module, or extract components before one concrete behavior path proves the pattern. When in doubt, pick the slice that carries the most product truth.

Worked examples and the full when-to-use / what-to-avoid lists: `references/execution-and-reuse-detail.md`.

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

Prefer a project with at least `src/{prototypes,components,themes,database,docs/project-memory}` and `pm/{handoffs,baselines}`. Adapt to an established structure but preserve the same separation of concerns. For a new fusion project's starting skeleton, use `references/project-layout-template.md`; the full layout diagram is in `references/execution-and-reuse-detail.md`.

## Execution flow

Follow this order:

1. Confirm current round (round goal, in-scope pages, out-of-scope, known unstable) to prevent silent scope expansion.
2. Check reuse first (registry, shared components, tokens, mock data, related pages) before creating; route `planned` entries by `next_action`.
3. Build page skeletons (`index.tsx`, `spec.md`, `style.css` only when needed); initialize `spec.md` from `references/prototype-page-spec-template.md`; leave state/config coverage notes for state-heavy pages.
4. Choose the first vertical slice when the page is complex; define trigger, modules, before/after states, failure/boundary, data, rule-to-UI mapping, and validation method.
5. Implement only this round's default state, key alternate states, and core interactions; finish a slice before starting the next.
6. Accumulate shared assets carefully — extract components/tokens/mock only when repetition justifies it; never recreate registered controls.
7. Validate the prototype (compiles, loads, no obvious runtime failures); for risky slices, verify the trigger, success state, and failure/boundary state or document the gap.
8. Update project-local memory (`current.md`, `decisions.md`, `open-questions.md`, `changelog.md`) after meaningful progress.

Full per-step detail (sub-checklists, purposes, validation depth, TDD boundary): `references/execution-and-reuse-detail.md`.

## Minimum per-page contract

Each in-scope page should leave the round with:
- a runnable page implementation
- a page-level `spec.md`
- implemented state coverage for this round
- any known gaps explicitly labeled

This prevents future rounds from depending on conversation archaeology.

## Per-page spec & output expectations

Each page-level `spec.md` stays implementation-adjacent (page goal, modules, states implemented this round, interactions, data needs, known gaps; plus state/config-to-UI mapping for complex pages) and must stay aligned when code changes materially. Structure execution output around round identity, implemented pages, vertical slices, state coverage, shared-asset/registry changes, validation result, unresolved items, and next action.

Full spec field list and per-slice output naming: `references/execution-and-reuse-detail.md`.

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

## Change Log

- 2026-04-27: Added mandatory shared component registry lookup for PM workflow React prototype execution, pointing to `<projectsRoot>/_component-library`, to prevent ad-hoc recreation of existing backend/App/embedded components.
- 2026-05-13: Added registry state triage so `planned` entries cannot become long-term backlog without `next_action` routing.
- 2026-05-14: Added vertical-slice execution and prototype verification guardrails so complex prototype work proves one behavior path end to end before broadening.
- 2026-06-07: Split over-budget body into `references/execution-and-reuse-detail.md` (registry/reuse rules, full per-step execution detail, per-page-spec/output expectations) to keep the SKILL body lean. No rules removed; detail moved on-demand.
