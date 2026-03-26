# Embedded Shell Patterns

Use this reference when `pm-embedded-prd` needs practical shell patterns for arranging the left document, right demo, and navigation/status layers into a usable embedded PRD page.

The goal is not to redesign the demo itself. The goal is to provide repeatable shell patterns for presenting linked requirement content clearly.

---

## Core idea

An embedded shell is the container around the requirement content and demo content.
It should help readers:
- orient quickly
- inspect logic and demo together
- navigate between both sides
- understand current stage/stability without guessing

If the shell only creates visual split-screen without helping these jobs, it is weak.

---

## Shell selection principle

Do not choose a shell only by visual preference.
Choose it based on:
- what the reader mainly needs to understand
- how stable the current round is
- how heavy the document side is
- how interaction-heavy the demo side is
- how much visible status/granularity the artifact needs

Shell choice is a review/delivery decision, not only a layout decision.

---

## Pattern 1: Balanced two-pane shell

### Best for
- general review use
- medium complexity requirements
- cases where doc and demo matter roughly equally

### Structure
- top header with artifact label, version, stage, warning if needed
- left pane for doc blocks
- right pane for demo page/state view
- subtle status/navigation strip

### Strengths
- easy to understand
- low cognitive overhead
- good default pattern

### Risks
- can become bland split-screen if linkage is weak
- can under-serve very rule-heavy or very interaction-heavy rounds

### Best linkage style
- medium-granularity linking
- section → page/state/module level focus

### Best status style
- header-level artifact status
- section/item labels only where instability exists

---

## Pattern 2: Document-primary shell

### Best for
- rule-heavy requirements
- cases where explanation is denser than demo expression
- review rounds that still need careful reading of logic

### Structure
- wider left pane
- narrower but still interactive right pane
- strong section anchors on the document side
- targeted demo focus rather than many simultaneous views

### Strengths
- supports serious logic review
- reduces page noise when the requirement is text/rule heavy

### Risks
- if overdone, the demo side becomes passive decoration
- can weaken reverse navigation if the demo loses interaction weight

### Best linkage style
- section-led and state-aware linking
- less page switching, more focused state/module highlighting

### Best status style
- stronger section-level status cues
- explicit unfrozen/doc-only markers in the document flow

---

## Pattern 3: Demo-primary shell

### Best for
- interaction-heavy review
- cases where the demo is the main review object but still needs linked explanation
- showcase-oriented rounds with stable logic baseline

### Structure
- wider right pane
- lighter left pane with focused linked sections
- visible page/state controls on the demo side
- clear reverse navigation back to doc blocks

### Strengths
- supports stronger visual review
- useful when interaction comprehension matters most

### Risks
- can accidentally demote documentation to secondary truth
- dangerous if logic is not already stable enough
- easy to overclaim delivery readiness because the artifact feels polished

### Best linkage style
- page/state/module-driven reverse mapping
- strong right → left navigation is critical

### Best status style
- artifact status must remain highly visible
- unstable/demo-validation items need stronger proximity labeling near the demo side

---

## Pattern 4: Section-led shell

### Best for
- requirements with several major rule/state clusters
- reviews where readers jump section by section rather than reading top to bottom
- artifacts where mapping granularity matters more than visual drama

### Structure
- left side organized into strong section groups
- each section can focus the corresponding demo page/state/module
- navigation emphasizes section switching

### Strengths
- good for structured discussion
- helps keep mapping at meaningful granularity
- works well when one feature spans multiple states or rule clusters

### Risks
- if sections are too coarse, linkage becomes vague
- if sections are too fine, the shell becomes noisy
- may feel heavier than needed for simpler rounds

### Best linkage style
- section-first mapping with precise page/state targets underneath

### Best status style
- section-level labeling is especially important
- stable/unfrozen/doc-only differences should often appear at section level first

---

## Pattern selection matrix

Use this quick matrix.

### If the dominant job is understanding rules
Prefer:
- document-primary shell
- or section-led shell

### If the dominant job is understanding interaction
Prefer:
- balanced two-pane shell
- or demo-primary shell

### If the round is still unstable
Prefer:
- balanced shell
- document-primary shell
- section-led shell

Avoid overusing demo-primary shell when logic is still moving.

### If the round is near delivery
Prefer:
- balanced shell
- section-led shell
- or carefully controlled demo-primary shell only when logic is already stable

### If requirement complexity is low
Prefer:
- balanced shell

### If requirement complexity is medium-high and rule-heavy
Prefer:
- document-primary or section-led shell

---

## Shared shell elements

No matter which pattern is used, keep these shell elements when possible:
- artifact label (`review` / `delivery`)
- version/stage identity
- visibility of `stable` / `unfrozen` / `doc-only` / `demo-validation-only`
- page/state switching where relevant
- visible focus/highlight behavior
- clear current selection state

These are more important than decorative shell polish.

---

## Header pattern

A practical embedded shell header usually needs:
- requirement or feature name
- artifact label
- version
- stage
- short note if major unfrozen items exist

Optional:
- quick links to major sections
- quick links to current baseline / review notes

Avoid overloading the header with too much explanation.

---

## Navigation pattern

Useful shell navigation often includes:
- section anchors on the left
- page/state switcher on the right
- click-to-focus from doc to demo
- click-to-highlight from demo to doc

Good navigation should reduce review friction, not just add more controls.

### Good navigation rule
The more interactive the demo side becomes, the more important reverse navigation becomes.

A demo-heavy shell with weak right → left linkage usually degrades quickly into fake embedding.

---

## Status pattern

Status should be visible but not overwhelming.

Recommended status signals:
- artifact-level `review` / `delivery`
- item-level `stable` / `unfrozen` / `doc-only` / `demo-validation-only`
- current version/stage
- optional warning when the current artifact is not yet delivery-grade

### Status-density rule
- low complexity shell → keep status mostly at artifact + selective section level
- medium/high complexity shell → add section-level status cues deliberately
- unstable review round → prefer more visible instability labeling, not less

---

## Relationship to linkage granularity

Shell choice affects how linkage should feel.

### Balanced shell
Works best with medium linkage granularity.

### Document-primary shell
Can tolerate stronger section/state-driven linking.

### Demo-primary shell
Needs stronger reverse mapping and visible local labels near the interactive region.

### Section-led shell
Needs deliberate section granularity control, otherwise it becomes either vague or noisy.

Do not use shell style to excuse weak mapping discipline.

---

## Typical fake-embedding failure modes by shell

### Balanced shell failure
Looks clean, but is only split-screen with generic page jumps.

### Document-primary shell failure
Turns the demo into passive proof that no one really inspects.

### Demo-primary shell failure
Looks impressive, but documentation loses authority and instability becomes under-labeled.

### Section-led shell failure
Creates many navigable anchors, but the sections are too coarse or too fragmented to be useful.

---

## Pattern selection guidance

Choose shell pattern based on the dominant review job.

### If the dominant job is understanding rules
Prefer document-primary or section-led shell.

### If the dominant job is understanding interaction
Prefer balanced or demo-primary shell.

### If the round is still unstable
Prefer shells that keep documentation and status signals strong.

### If the round is near delivery
Prefer shells that keep linkage and status truthful without overloading the page.

---

## Anti-patterns

Avoid these shell failures:
- split-screen with no real linkage
- shell that looks polished but hides version/stability status
- demo side overloaded with too many pages at once
- doc side overloaded into a rule wall with weak grouping
- shell choice driven only by style preference instead of review task
- demo-primary shell used too early while logic is still unstable

---

## Minimum viable shell

If starting simple, the minimum useful shell should provide:
- one header with artifact/stage identity
- one readable document pane
- one interactive demo pane
- one visible mapping/navigation behavior
- one visible status pattern

If these are missing, the shell is not doing enough to justify an embedded PRD form.
