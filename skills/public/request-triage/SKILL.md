---
name: request-triage
description: "触发：新请求需判断处理深度；不触发：已进入澄清→用pm-requirement-intake；价值不清→用pm-value-anchor；输出：流程层级+下一步"
---

# Request Triage

Use this skill to choose the right workflow depth before product work begins.

The goal is to prevent two failures:
- over-processing small requests with a heavy workflow
- under-processing high-risk requests that need deeper intake, audit, prototype, or delivery handling

## Core Job

Classify the request into one lane:

- `fast-lane`: small, low-risk, clear change
- `standard-lane`: normal product requirement that needs structured intake and a clear handoff
- `deep-lane`: high-risk, cross-surface, rule-heavy, state-heavy, or strategically important requirement

Then recommend the minimum useful next skills.

## Use When

Use when:
- a new request arrives and workflow depth is unclear
- the user asks whether a requirement needs full workflow
- a request looks small but may hide rule/state risk
- there are many concurrent requests and prioritization of process depth matters

## Do Not Use When

Do not use this skill to:
- decide final business correctness
- write the PRD
- design the demo
- replace `pm-requirement-intake` for unclear requirements
- force every request into a formal process

## Triage Inputs

Look for:
- change type: copy, config, UI, flow, rule, data, permission, payment, cross-layer behavior
- affected surfaces: backend, App, embedded PRD, data import/export, user-facing display
- user/business impact
- risk if wrong
- number of roles involved
- state and exception complexity
- dependency on existing assets, components, or project baselines
- whether the request is reversible
- whether it needs review, delivery freeze, or only a quick adjustment

## Lane Rules

### Fast Lane

Use `fast-lane` when most are true:
- scope is small and clear
- no new business rule
- no meaningful state model change
- low user/business risk
- low dependency on other systems
- rollback is easy
- a short note or direct edit is enough

Typical examples:
- wording change
- copy adjustment
- simple display ordering
- minor field label clarification
- small prototype visual correction

Recommended next move:
- answer directly or make the small change
- optionally record a short changelog line
- do not create a full project workflow unless the change repeats

### Standard Lane

Use `standard-lane` when:
- the request changes page behavior, flow, field rules, or user-facing interaction
- scope is bounded but needs structured clarification
- state and exception coverage matters but is not extreme
- PRD or demo output may be needed

Recommended next skills:
- `pm-requirement-intake`
- `pm-demo-design` when page/demo expression is needed
- `pm-prd-writer` when implementation-readable PRD is needed
- `state-audit` before freeze or handoff
- `pm-project-ops` if artifacts should be saved

### Deep Lane

Use `deep-lane` when any high-risk condition is present:
- cross-surface behavior, such as backend config plus App display
- payment, entitlement, access control, membership, course/content availability, or data migration
- many states, roles, exceptions, or historical compatibility concerns
- unclear success definition or business value
- high coordination cost across product, design, development, testing, operation, or content teams
- likely need for runnable prototype, embedded PRD, or review baseline
- failure would mislead users, create financial risk, or cause significant rework

Recommended next skills:
- `pm-value-anchor`
- `pm-requirement-intake`
- `rule-change-signal` when scope/rule drift appears
- `state-audit`
- `freeze-readiness-check`
- `pm-demo-design`
- `pm-prd-writer`
- `pm-react-prototype-execution` when runnable behavior matters
- `pm-embedded-prd` when review-grade linked delivery is needed
- `pm-project-ops`

## Working Flow

1. Restate the request in one sentence.
2. Identify risk signals and simplification signals.
3. Choose one lane.
4. Explain the reason briefly.
5. Recommend the minimum next skill path.
6. Name what should not be done yet.

## Output Format

```md
## Request triage
- Request:
- Lane:
- Why:
- Risk signals:
- Simplification signals:
- Recommended next path:
- Do not do yet:
```

Keep it short. The output should help the user decide how much process the request deserves.

## Self-Check

Before finishing, check:
- Did I avoid making the workflow heavier than the request deserves?
- Did I catch hidden risk signals?
- Did I recommend only the next useful skills, not the whole system?
- Did I clearly say what not to do yet?
