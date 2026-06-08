---
name: pm-devil-advocate
description: "触发：需反向挑战价值/假设/风险，含口语挑刺（有没有问题/有没有坑/盲点在哪）；不触发：高风险交易/履约/状态/角色需求系统反证→用pm-requirement-reverse-audit；只查状态缺口→用state-audit；冻结裁决→用freeze-readiness-check；输出：最强反对意见+行动"
---

# PM Devil Advocate

Use this skill as a deliberate opposing reviewer.

The goal is not to be negative. The goal is to expose weak assumptions before they become expensive work.

## Core Job

Challenge the current product/workflow artifact across:
- value
- assumptions
- scope
- evidence
- user impact
- operational risk
- implementation risk
- state and exception coverage
- failure modes

Then recommend whether to continue, narrow, clarify, test, or stop.

## Use When

Use when:
- a requirement looks plausible but not proven
- a solution may be over-scoped
- a demo or prototype looks polished but may hide weak logic
- a PRD may be complete but value-vague
- a freeze or review baseline is being considered
- the user asks for a harsher critique
- leadership, development, testing, or users may challenge the proposal

## Do Not Use When

Do not use this skill to:
- replace normal requirement intake
- block progress over small optional issues
- nitpick wording or visual polish
- decide final business truth without evidence
- create broad anxiety without a concrete next action

## Challenge Modes

Use only the modes relevant to the artifact.

### 1. Value Challenge

Ask:
- What problem is this actually solving?
- Who benefits enough to care?
- What happens if we do not build it?
- Is the proposed scope larger than the value justifies?
- What is the smallest version that proves value?

### 2. Assumption Challenge

Ask:
- Which statements are facts?
- Which are assumptions?
- Which assumptions would break the plan if false?
- What evidence exists?
- What evidence is missing?

### 3. Scope Challenge

Ask:
- What should be cut from this round?
- What belongs in later iterations?
- Are we mixing backend, App, content, operation, and reporting scopes too casually?
- Is this trying to solve several problems under one feature name?

### 4. User / Role Challenge

Ask:
- Which user or role is underrepresented?
- Does this work for first-time, returning, historical, low-permission, or edge-case users?
- Would a user understand the result without internal explanation?

### 5. State And Failure Challenge

Ask:
- What fails?
- What times out?
- What is empty?
- What is disabled?
- What is deleted, expired, hidden, or invalid?
- What partially succeeds?
- What cannot be recovered?

### 6. Delivery Challenge

Ask:
- What dependency could block this?
- What will development or testing push back on?
- What must be decided before review?
- What makes this unsafe to freeze?

## Output Format

```md
## Devil advocate review
- Artifact / decision reviewed:
- Strongest objection:
- Fragile assumptions:
- Scope risks:
- Missing evidence:
- Failure modes:
- Reader / stakeholder objections:
- Recommendation:
- Minimum next action:
```

Recommendation should be one of:
- continue as-is
- continue with narrowed scope
- clarify before continuing
- test with prototype or data first
- route back to requirement intake
- do not proceed yet

## Relationship With Other Skills

- Use after `pm-value-anchor` if value is still weak.
- Use after `pm-requirement-intake` when assumptions or scope remain fragile.
- Use before `freeze-readiness-check` when a harsher challenge is needed.
- Use with `state-audit` when state gaps may hide larger failure modes.
- Route to `pm-requirement-reverse-audit` for high-risk transaction / fulfillment / state / role requirements that need the sharper systematic counter-evidence matrix rather than a general challenge.

## Self-Check

Before finishing, check:
- Did I challenge the core decision, not just wording?
- Did I separate fatal objections from manageable risks?
- Did I give a concrete minimum next action?
- Did I avoid turning critique into vague pessimism?

<!-- Change trace
- 2026-06-07: Added reverse routing to pm-requirement-reverse-audit (description 不触发 + relationships) so high-risk transaction/state/role requirements reach the sharper counter-evidence matrix; extended trigger with colloquial challenge phrasing (有没有问题/有没有坑/盲点在哪).
-->

