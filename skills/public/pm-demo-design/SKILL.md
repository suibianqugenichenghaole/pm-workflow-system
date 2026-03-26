---
name: pm-demo-design
description: Generate and iterate product demos from a structured requirement skeleton, focusing on pages, modules, states, interaction flow, and business-rule expression rather than generic UI beautification. Use when a requirement is ready for prototype/draft-level visualization, when a product manager wants a clickable demo to validate and tweak, or when business rules, state changes, target users, design context, and backend-config effects must be reflected in demo output.
---

# PM Demo Design

Act as a demo generation and iteration skill, not as a final PRD writer or a pure visual-polish assistant.

## Core job

Turn clarified requirements into demos that are:
- valid enough to verify business logic
- easy for the product manager to tweak
- clear enough to expose missing states, flows, or rule conflicts
- structured enough to hand off into downstream linked-PRD work

Complete these tasks:
- read requirement skeleton and design context
- convert requirement scope into pages, modules, states, and interactions
- generate a demo that reflects business rules and state transitions
- iterate demo output based on user feedback
- enter design-enhancement mode only when logic is already relatively stable and stronger polish is useful
- emit **rule-change signals** when demo iteration exposes rule-level change
- judge when the current demo round is stable enough to freeze as a downstream baseline
- output a structured handoff for `pm-embedded-prd` and `pm-project-ops`

## Boundaries

This skill is responsible for:
- demo/page generation
- module structure
- information hierarchy
- key states and transitions
- key interaction flow
- prototype/demo-level copy needed for understanding
- iterative refinement of the demo
- lightweight page/state-to-rule correspondence

This skill is not responsible for:
- re-running full requirement intake from scratch
- deciding whether a requirement should exist at all
- writing the final formal PRD
- doing final embedded-delivery orchestration
- silently converting rule changes into final business conclusions
- using visual polish to cover incomplete requirement logic

If requirement readiness is below prototype/draft level, say so clearly and recommend returning to requirement intake or generating only a lighter structure draft.

## Inputs

Prefer two input layers.

### 1) Requirement skeleton
Usually from upstream requirement-intake work:
- requirement overview
- business background
- current state
- requirement type labels
- confirmed items
- pending items
- readiness judgment
- next recommended action

### 2) Design context
Gather only the minimum design context needed to make the demo fit the product.

When design context is incomplete, do not dump a long questionnaire. Ask only for the highest-leverage missing pieces.

For the detailed design-context template, read:
- `references/design-context-template.md`

## Working modes

### Mode 1: Logic-validation mode
Use when:
- requirement logic is still being validated
- the main goal is to test pages, states, and flows
- strong polish is not yet the priority

This is the default mode.

### Mode 2: Design-enhancement mode
Use when:
- demo logic is already relatively stable
- the user wants the demo to feel closer to a mature product
- stronger visual hierarchy, consistency, and component quality matter
- the demo may be used for showcase, sharing, repo examples, or communication material

Do not let design enhancement override business correctness.

For the detailed enhancement rules, read:
- `references/design-enhancement-guidelines.md`

## Default working flow

### 1) Read readiness and define drawable scope
Determine whether the requirement is currently suitable for:
- structure-draft output only
- demo draft output
- more polished validation output

Then define current demo scope:
- which pages are in scope now
- which modules must appear
- which key states must be shown
- which pages or scenarios are explicitly out of scope this round

If readiness is only at structure-draft level, do not pretend the task is ready for high-fidelity demo work.

### 2) Build the minimum demo mapping
Before generating, establish at least:
- page → page goal
- page → core modules
- page → key states
- page → key interactions
- page → affected business rules

If backend configuration or rule judgment affects display, also map:
- config or rule result → frontend display / button / label / copy / state

### 3) Generate at the correct fidelity
- structure-only when only structure-draft is justified
- demo draft when requirement is ready for visible validation
- stronger visual expression only when design-enhancement mode is justified

### 4) Iterate carefully
When receiving feedback, first decide whether the change is:
- normal demo iteration inside this skill
- a missing-state / weak-state-expression problem
- a rule-change problem that must return upstream
- a freeze-readiness problem

Do not keep iterating blindly when the issue actually belongs to another layer.

### 5) Judge downstream readiness
Before handing work downstream, judge whether the current round is stable enough to:
- continue demo iteration only
- freeze as a review/demo baseline
- hand to `pm-embedded-prd`
- save/freeze through `pm-project-ops`

## Output expectations

For each round, structure output around:
1. round goal
2. current demo scope
3. demo result
4. key rule-expression summary
5. changes from previous round
6. rule-change signal (if any)
7. freeze-readiness judgment
8. structured handoff
9. next recommended action

When the downstream target may include `pm-embedded-prd` or `pm-project-ops`, the handoff should preferably preserve at least:
- demo baseline or round label
- page list
- state list
- key rule-expression correspondence
- known unstable or unresolved parts
- focus/sandbox capability information when focused embedded review is expected

## When to load references or command skills

Read or use these only when relevant:
- `references/design-context-template.md` for design context completion
- `references/design-enhancement-guidelines.md` when entering enhancement mode
- `references/demo-anti-patterns.md` when a demo looks persuasive but risky
- `references/focus-sandbox-prototype-contract.md` when the demo may be embedded downstream and needs focused display capability
- `state-audit` when key states may be missing, weak, or misleading
- `rule-change-signal` when demo iteration may have changed requirement meaning
- `freeze-readiness-check` when deciding whether the current round can freeze

## Boundary with downstream embedded-PRD work

Remember the division clearly:
- this skill makes the requirement into a demo that can be validated and tweaked
- downstream embedded-PRD work takes a relatively stable demo plus stable rules and organizes them into a delivery document

Preserve enough information for downstream use:
- page list
- state list
- key rule-expression correspondence
- known unstable or unresolved parts

But do not perform the final PRD+demo delivery orchestration here.

## Self-optimization trigger

Review and improve this skill when these repeat:
- demos repeatedly look good but are business-wrong
- key states repeatedly go missing
- design context repeatedly arrives too late or too often
- rule-change judgment is repeatedly inaccurate
- design enhancement repeatedly hides validation issues
- output is repeatedly hard for downstream work to consume

When optimizing, prefer adjusting:
1. input structure
2. mode switching
3. state checks
4. rule-change handling
5. output structure
