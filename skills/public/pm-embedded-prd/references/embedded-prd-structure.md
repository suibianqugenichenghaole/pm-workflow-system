# Embedded PRD Structure

Use this reference when `pm-embedded-prd` needs to shape a deliverable into a real embedded PRD instead of a raw markdown dump or an unstructured side-by-side page.

The goal is to make the left document and right demo work together as one delivery artifact.

---

## Core idea

An embedded PRD should let a reader do three things without friction:
1. understand the business/document logic
2. inspect the corresponding demo expression
3. move between both sides while preserving context

If the structure does not support those three jobs, the output is only a document with a preview pane, not a true embedded PRD.

---

## Recommended top-level structure

A practical embedded PRD should usually have these top-level parts:

1. delivery header
2. left document pane
3. right demo pane
4. mapping/navigation layer
5. status/version layer

---

## 1) Delivery header

Purpose:
- tell the reader what they are looking at
- identify the current version/baseline
- set expectations about stability

Recommended contents:
- requirement name / feature name
- current version
- current stage (`draft`, `review`, `frozen`, etc.)
- short purpose statement
- brief warning for unfrozen items if relevant

Optional:
- links to version notes
- quick navigation to major sections

---

## 2) Left document pane

This is the explanation layer.
It should be structured for reading, scanning, and linking.

Recommended internal order:

### A. Background / purpose
- why this exists
- what round this delivery is for

### B. Scope and impacted areas
- what pages/modules/scenarios are in scope
- what is excluded from this round

### C. Key rules
- rule descriptions
- conflict/priority handling
- notable assumptions

### D. State logic
- state definitions
- transitions
- notable outcomes

### E. Config-driven effects
- backend configuration that changes frontend expression

### F. Special scenarios
- expiry, refund, rollback, retry, etc. if relevant

### G. Unfrozen items / pending items
- what is still under discussion
- what is not part of the current baseline

Rule:
- each major block should be mappable to page/state/config/demo targets

---

## 3) Right demo pane

This is the expression layer.
It should not merely host a demo; it should support inspection.

Recommended capabilities:
- page switching
- state switching
- focus/highlight on relevant module or region
- stable embedding (iframe, pane, or view container)
- enough visual context to understand why the linked doc block matters

Do not overload the right side with unrelated demo pages.
Only include what supports the current delivery scope.

---

## 4) Mapping / navigation layer

This is the real embedded-PRD layer.
Without it, the page is just split-screen.

Recommended behaviors:

### Left → Right
- clicking a doc block focuses the related page/state/demo area
- page changes happen only when needed
- state changes happen only when needed
- the demo focus is visible

### Right → Left
- interacting with or selecting a demo state/region highlights the matching doc block
- the document pane scrolls or focuses when useful
- unstable items are visibly marked if applicable

### Mapping labels
Support labels like:
- stable
- unfrozen
- doc-only
- demo-validation-only

---

## 5) Status / version layer

This is often overlooked but critical.
The reader should not have to guess:
- what version this is
- whether this is review-ready or merely exploratory
- whether all linked elements belong to the same baseline

Recommended contents:
- version tag
- stage label
- linked baselines used
- current stability note
- last update marker (optional)

---

## Section granularity rules

Use meaningful section granularity.

### Good granularity
- one section for one meaningful rule group
- one section for one meaningful state group
- one section for one meaningful config effect cluster

### Too coarse
- one giant “business logic” block that maps to half the product

### Too fine
- every sentence becomes its own mapped section

Rule of thumb:
- if users cannot tell what a section is really about, it is too coarse
- if navigation becomes noisy and fragmented, it is too fine

---

## Stable vs unstable content placement

Recommended rule:

### Stable content
Place in the normal document flow.

### Unfrozen content
Still place it where it belongs logically, but mark it visibly.
Do not hide it in a random appendix if it matters to understanding.

### Doc-only content
Keep it in the document, but label that no demo expression exists this round.

### Demo-validation-only content
Allow it on the right side, but label that it is not formal delivery wording yet.

---

## Suggested minimal visual hierarchy

A minimal embedded PRD layout should make these distinctions obvious:
- section title vs body text
- rule block vs state block vs config block
- stable vs unstable labels
- active selection vs non-active content
- demo page switch vs demo state switch

This does not require heavy design polish, but it does require deliberate structure.

---

## Typical page composition example

A simple embedded PRD page may look like:

```text
[Header: feature name | version | stage | warning if needed]

[Left pane]
  - Background
  - Scope
  - Rule group A
  - State group A
  - Config group A
  - Special scenarios
  - Unfrozen items

[Right pane]
  - Demo page selector
  - Demo state selector
  - Demo view

[Status strip / footer]
  - linked baseline info
  - entry links / notes
```

This is enough for a useful v1 embedded PRD if the linkage layer is real.

---

## Anti-patterns

Avoid these structure failures:

### 1) Split-screen only
Left text + right iframe, but no real mapping or navigation.

### 2) Page-first only
The structure follows pages only, while rules and states become secondary or invisible.

### 3) Rule dump
The left side becomes a wall of rules with no readable grouping.

### 4) Hidden instability
Unfrozen items are visually indistinguishable from stable items.

### 5) Link overload
Too many tiny links/anchors make the page hard to read.

### 6) Demo overload
Too many demo panes/pages are included, diluting the current review scope.

---

## Minimum viable embedded PRD structure

If starting with the smallest useful shape, require at least:
- a delivery header with version/stage
- a left document pane grouped into meaningful sections
- a right demo pane with page/state switching
- one real mapping layer for left ↔ right navigation
- visible stable/unfrozen/doc-only/demo-validation-only labels

If even this minimum is missing, call the output a review page or linked draft, not a true embedded PRD.
