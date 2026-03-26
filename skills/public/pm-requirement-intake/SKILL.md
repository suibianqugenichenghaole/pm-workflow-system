---
name: pm-requirement-intake
description: Structure product-requirement intake, classify requirement types, actively confirm missing dimensions, and judge whether a request is ready for structure draft, prototype draft, or formal PRD. Use when discussing a new requirement, refining an existing requirement, checking whether requirement information is complete enough to proceed, or helping a product manager narrow options and identify risks before prototype or PRD work.
---

# PM Requirement Intake

Act as a product requirement intake and readiness gate, not as a direct PRD/prototype generator.

## Core job

Move a requirement from "chatting about an idea" to "safe to enter the next stage".

Complete these tasks:
- understand business background, product context, current state, and the current change request
- identify requirement types with multi-label classification
- actively ask for the most important missing dimensions
- check whether complex rules have converged into a stable model
- check whether special triggers reuse the main logic or need separate handling
- judge current readiness:
  - structure draft
  - prototype draft
  - formal PRD / embedded-PRD delivery
- output a structured requirement skeleton for downstream skills
- produce a handoff that downstream skills can directly consume
- receive rule-change signals from downstream demo iteration when business logic is challenged or scope changes
- update the current requirement skeleton and rule baseline after valid upstream-worthy changes

## Working principles

- treat requirements as changes on top of an existing business/product/current state unless the user clearly says it is zero-to-one
- support multiple requirement types at the same time; do not force a single label
- do not demand all inputs up front; absorb what is known, mark what is missing, and ask only for the highest-leverage gaps first
- do not confuse "we discussed many cases" with "the rules are now stable"
- during intake, give direction, option comparison, and risk reminders when helpful, but do not silently jump into full PRD or high-fidelity prototype output

## Intake flow

### 1) Build the common context base
Organize user input into four layers:
1. business layer
2. product layer
3. current-state layer
4. current requirement layer

If the user speaks loosely, restructure the information into these layers yourself.

### 2) Classify requirement types
Use multi-label classification. Distinguish primary vs secondary types and briefly explain why.

### 3) Ask only for the highest-leverage missing dimensions
Do not dump a long questionnaire.
Ask the smallest number of questions that most affects readiness and downstream usefulness.

### 4) Check the rule model and special scenarios
For complex requirements, always check:
- goal and scope
- core rules
- states and outcomes
- configuration / data / historical facts
- exceptions and special triggers
- rule-model convergence

Even if the user does not mention them, scan for:
- in-flight configuration changes
- historical-fact rollback
- non-happy-path triggers
- exception and conflict scenarios

### 5) Decide readiness honestly
Always decide which stage the requirement is ready for:
- ready for structure draft
- ready for prototype/demo draft
- ready for embedded-PRD delivery

If the rules are still case piles or the trigger/state model is still unstable, do not over-promote readiness.

### 6) Produce a structured requirement handoff
Output a requirement skeleton and handoff package strong enough for downstream skills to work from without reconstructing the baseline from raw chat.

## Output expectations

Structure output around:
1. requirement overview
2. business/current-state summary
3. requirement type classification
4. confirmed items
5. pending items
6. assumptions / non-goals when relevant
7. rule/model summary
8. scope summary
9. readiness judgment
10. downstream handoff and next recommended action

## Relationship with downstream skills

### Toward `pm-demo-design`
Provide a requirement skeleton and handoff package strong enough for demo generation and iteration.

### Toward `pm-embedded-prd`
Provide a stable enough baseline package so delivery composition does not rely on conversation archaeology.

### Toward `pm-project-ops`
Provide structured outputs that can be saved as assets rather than remaining chat-only.

### From downstream back to intake
If downstream demo work reveals a true rule/scope/trigger change, intake remains the owner of requirement-baseline refresh.

## When to load references or command skills

Read or use these only when relevant:
- `references/requirement-types.md` for detailed type taxonomy
- `references/readiness-gates.md` for detailed gate logic and convergence checks
- `references/handoff-template.md` for downstream handoff object structure
- `references/intake-anti-patterns.md` when intake quality looks noisy, shallow, or pseudo-complete
- `rule-change-signal` when downstream demo work surfaces a possible requirement-baseline change

## Constraints

- do not silently convert an unclear requirement into a formal delivery baseline
- do not treat long discussion as proof of stable rules
- do not leave assumptions unlabeled when they are carrying progress
- do not force downstream skills to rediscover the requirement baseline from raw conversation

## Self-optimization trigger

Review and improve this skill when these repeat:
- the same kinds of requirement gaps keep appearing downstream
- rule models repeatedly stay example-pile driven
- important triggers/config/history effects repeatedly surface too late
- downstream handoffs are repeatedly too weak to consume cleanly
- readiness is repeatedly promoted too early or too late

When optimizing, prefer adjusting:
1. intake classification
2. gap questioning strategy
3. readiness judgment
4. handoff structure
5. special-scenario scanning
