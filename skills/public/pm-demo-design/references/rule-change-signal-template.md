# Rule Change Signal Template

Use this reference when `pm-demo-design` discovers, during demo generation or iteration, that the issue is no longer only a page-expression problem and may affect the requirement baseline.

The purpose of a rule-change signal is to prevent demo work from silently rewriting business logic.

---

## Core idea

Not every demo change is a rule change.

When demo work exposes a mismatch, first classify it correctly:
- is it only presentation?
- is it only better expression of an existing rule?
- or does it actually change the requirement baseline?

A rule-change signal exists to escalate the third case clearly.

---

## Three signal classes

### Class A — Presentation-layer adjustment

Meaning:
- the business logic is unchanged
- the demo only needs better layout, copy, emphasis, hierarchy, or visual arrangement

Typical examples:
- move a button
- adjust copy tone
- change card order for clarity
- make state indication more visible
- change tabs to cards or cards to tabs without changing underlying logic

Default handling:
- stay inside `pm-demo-design`
- do not reopen `pm-requirement-intake`

---

### Class B — Rule-expression supplement

Meaning:
- the underlying rule is still the same
- but the current demo did not fully carry it
- page/state expression needs to be expanded

Typical examples:
- a required state was missing from the demo
- a scenario existed in the requirement, but not in the demo
- a result state lacked proper feedback
- a config-driven variation was not shown, even though the requirement already implied it

Default handling:
- usually still handled inside `pm-demo-design`
- but must be explicitly surfaced so the user knows this was not only cosmetic
- may require a small skeleton refresh upstream if the requirement handoff was too thin

---

### Class C — Rule-logic / scope / trigger change

Meaning:
- the issue discovered during demo work changes the requirement baseline itself
- continuing to iterate the demo as if nothing changed would create false alignment

Typical examples:
- a main rule no longer holds
- priority/conflict handling changes
- a trigger should or should not reuse the main logic
- a scope boundary changes
- a scenario previously excluded now must be included
- an assumed result state is actually wrong under real business conditions

Default handling:
- send a rule-change signal upstream
- usually return to `pm-requirement-intake`
- avoid continuing high-fidelity demo work as if the baseline were still stable

---

## Required signal payload

A useful rule-change signal should include these parts.

### 1) What was discovered
Short statement of the mismatch.

Example:
- "The current pending-state demo implies delayed activation, but the latest scenario review means this case should be parallel-active instead."

### 2) Where it was discovered
Point to the demo context.

Examples:
- page
- module
- state
- interaction path

### 3) What layer it affects
Use one or more:
- page presentation
- state definition
- core rule
- priority/conflict handling
- special-trigger handling
- requirement scope
- config-to-frontend mapping

### 4) Signal class
Choose one:
- presentation-layer adjustment
- rule-expression supplement
- rule-logic / scope / trigger change

### 5) Impact assessment
Explain the practical impact.

Examples:
- can continue demo iteration normally
- can continue, but should mark as expanded rule expression
- should pause this branch and return upstream
- should not freeze current demo as baseline

### 6) Recommended next move
Examples:
- continue in `pm-demo-design`
- send back to `pm-requirement-intake`
- hold current demo as exploratory only
- regenerate downstream handoff after upstream confirmation

---

## Suggested output format

Use a compact structure like this:

```md
## Rule-change signal
- Discovery:
- Found in:
- Affected layer:
- Signal class:
- Impact:
- Recommended next move:
```

You can keep it short, but do not skip the classification and impact.

---

## Escalation rules

### Usually stay in demo skill
- pure layout changes
- visual hierarchy changes
- copy polish
- additional state visibility for already-confirmed rules
- better config expression where config logic itself has not changed

### Usually send upstream
- main-rule changes
- priority changes
- trigger logic changes
- scope changes
- scenario inclusion/exclusion changes
- anything that changes what the PRD would need to say

### Borderline cases
If unsure, ask:
- "Would this change alter the requirement wording, or only its page expression?"

If it alters requirement wording, it is likely upstream-worthy.

---

## Freeze-blocking rule

A Class C signal normally blocks freezing the current demo round as a downstream baseline.

A Class B signal may or may not block freezing, depending on severity.

A Class A signal should not block freezing by itself.

---

## Anti-patterns

Avoid these failures:

### 1) Silent requirement rewrite
The demo changes, but no one states that the business logic changed.

### 2) Over-escalation
Every visual adjustment is treated like a requirement rewrite.

### 3) Under-escalation
A real logic change is treated as harmless page polish.

### 4) Missing impact statement
The signal describes the issue but does not say whether demo work should continue.

### 5) Missing location context
The signal says something changed, but not where it surfaced in the demo.

---

## Practical test

Before sending a signal, ask these three quick questions:

1. If we keep the current requirement text unchanged, would the new demo still be truthful?
2. If we freeze this demo now, would downstream embedded-PRD work misrepresent the logic?
3. Is this changing what the feature means, or only how it looks?

If the first two answers are "no" or the third answer points to meaning rather than appearance, escalate.
