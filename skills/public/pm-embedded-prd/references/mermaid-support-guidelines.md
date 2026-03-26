# Mermaid Support Guidelines

Use this reference when the PM workflow needs Mermaid diagrams as a formal supporting output for requirement understanding, flow explanation, embedded PRD delivery, or review communication.

The goal is to make Mermaid a supported capability in the system without turning it into a mandatory artifact for every requirement.

---

## Core idea

Mermaid should be used when a diagram materially improves understanding.

Do not generate Mermaid just because the tool exists.
Do generate Mermaid when text alone makes important flow, state, or branch logic harder to understand.

So Mermaid is:
- a supported output capability
- not a universal mandatory step

---

## Where Mermaid fits in this system

Mermaid can support different stages for different reasons.

### In `pm-requirement-intake`
Use Mermaid when the main problem is understanding:
- journey structure
- role/branch differences
- trigger paths
- exception branches

### In `pm-demo-design`
Use Mermaid when a visual flow helps demo planning for:
- page transitions
- state transitions
- key interaction flow

### In `pm-embedded-prd`
Use Mermaid when the delivery/review artifact benefits from making:
- logic flow
- state flow
- branch structure
- exception handling
more inspectable inside the PRD body.

### In `pm-project-ops`
Project ops does not create Mermaid for its own sake, but may store diagram outputs as structured project assets when they are part of the artifact set.

---

## When Mermaid is worth generating

Usually worth generating when one or more of these are true:
- the requirement has meaningful branch logic
- multiple roles or paths need comparison
- exception handling matters to understanding
- state transitions are hard to follow in plain text
- the PM needs a compact review aid for discussion with others
- embedded PRD would benefit from a visible logic/flow block

Usually not worth generating when:
- the requirement is very small and linear
- the text explanation is already simpler than any diagram would be
- the diagram would only restate a trivial one-path process

---

## Recommended Mermaid diagram types

### 1) `flowchart`
Best for:
- business flows
- branch logic
- exception paths
- operational step logic

### 2) `sequenceDiagram`
Best for:
- actor/system interactions
- step-by-step request/response relationships
- role/system communication logic

### 3) `stateDiagram-v2`
Best for:
- state transitions
- status changes
- lifecycle logic

Do not overuse exotic types unless they truly improve clarity.

---

## Preferred use by scenario

### Scenario A: Journey and branch explanation
Prefer:
- `flowchart`

### Scenario B: State lifecycle explanation
Prefer:
- `stateDiagram-v2`

### Scenario C: Multi-actor interaction explanation
Prefer:
- `sequenceDiagram`

### Scenario D: Embedded PRD logic block
Prefer:
- whichever diagram type most directly reduces ambiguity in that feature section

---

## What Mermaid should clarify

A good Mermaid output should make one of these clearer:
- what path leads to what result
- which branch is triggered under which condition
- which state transitions are allowed
- which actor/system does what in what order
- where exception/fallback behavior enters the flow

If the diagram does not improve one of these, it is probably unnecessary.

---

## What Mermaid should not become

Do not let Mermaid become:
- mandatory decoration in every PRD
- a substitute for clear text explanation
- a bloated dump of every micro-detail
- a second source of truth that conflicts with the requirement baseline

Text still owns the precise requirement statement.
The diagram supports understanding; it does not replace rule truth.

---

## Diagram quality rules

A Mermaid diagram should be:
- small enough to read
- scoped to one clear logic unit
- aligned with current baseline wording
- explicit about important branches or states
- free of meaningless stylistic complexity

### Good scope
- one feature flow
- one state lifecycle
- one role/system interaction slice

### Bad scope
- the whole product in one giant chart
- many unrelated branches glued together
- a chart so dense that the text explanation would have been easier

---

## Placement guidance

### In requirement intake outputs
Use Mermaid selectively as a clarification aid, not as a default first output.

### In demo-stage outputs
Use Mermaid to explain structure and transitions when demo discussion benefits from it.

### In embedded PRD outputs
Mermaid can appear inside relevant feature sections as:
- logic flow block
- state flow block
- interaction flow block

Do not force every feature section to include Mermaid.
Use it where it materially improves review or delivery readability.

---

## Relationship to other workflow parts

### Relationship to demo output
Mermaid can explain flow and state logic, but it does not replace the demo.

### Relationship to embedded PRD
Mermaid is a supporting explanation block inside the PRD shell, not the shell itself.

### Relationship to versioning
If Mermaid is included as part of a baseline artifact set, it should align with the same effective version/stage as the surrounding rule/demo/PRD material.

---

## Anti-patterns

Avoid these mistakes:
- generating Mermaid for every requirement by default
- using Mermaid to avoid writing clear rule text
- drawing giant unreadable diagrams
- letting the diagram drift away from the current rule baseline
- treating Mermaid presence as proof that the requirement is mature

---

## Minimum done definition

For this workflow, Mermaid support is considered covered when the system can:
- deliberately choose Mermaid when it adds clarity
- generate appropriate flow/state/sequence diagrams when useful
- place Mermaid inside requirement or embedded-PRD outputs without making it a universal requirement
- keep Mermaid aligned with the current rule/demo baseline
