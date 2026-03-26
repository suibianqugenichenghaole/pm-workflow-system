# Review vs Delivery Labeling

Use this reference when `pm-embedded-prd` needs to label an artifact honestly as review-oriented or delivery-oriented, and when linked content needs stable status labels such as `stable`, `unfrozen`, `doc-only`, or `demo-validation-only`.

The goal is to stop embedded PRD outputs from overstating certainty, and to keep artifact-level stage labels separate from item-level stability labels.

---

## Core idea

A linked artifact can look polished before it is truly delivery-ready.

So labeling must answer two different questions:
1. what stage is this artifact serving?
2. how stable is each meaningful item inside it?

Do not confuse artifact stage labels with item stability labels.

- artifact stage label answers: **what kind of package is this overall?**
- item stability label answers: **how trustworthy is this specific block, mapping, state, or demo expression?**

A delivery-looking layout does not justify a `delivery` label by itself.
A stable-looking block does not justify a `stable` label by itself.

---

## Labeling model

Think in two layers.

### Layer 1: Artifact stage label
Choose one main label for the artifact as a whole:
- `review`
- `delivery`

### Layer 2: Item stability label
Apply labels to meaningful content units when needed:
- `stable`
- `unfrozen`
- `doc-only`
- `demo-validation-only`

A useful embedded PRD usually needs both layers.

---

## Stage labels

### `review`

Use when the artifact is mainly for:
- discussion
- alignment
- structured review
- preserving a coherent candidate baseline
- exposing weak points before stronger freeze or delivery use

A `review` artifact may contain:
- stable items
- unfrozen items
- doc-only items
- demo-validation-only items

But these must be marked honestly.

### `delivery`

Use when the artifact is mainly for:
- downstream continuation with minimal reinterpretation
- delivery-oriented reference
- stronger baseline trust
- versioned preservation as a reliable current truth
- acting as a practical baseline for later project-ops / continuation work

A `delivery` artifact should contain mostly stable items.
If unstable items still appear, they must be clearly marked and should be exceptional rather than dominant.

---

## Item stability labels

### `stable`
Use when the item is part of the current trusted baseline for this round.

Typical examples:
- confirmed rule block
- confirmed state meaning
- confirmed mapping between doc and demo
- confirmed config effect already accepted into the baseline

### `unfrozen`
Use when the item may appear in the artifact, but is not yet stable enough to be treated as final truth.

Typical examples:
- state still under discussion
- unresolved trigger branch
- candidate mapping still waiting for confirmation
- demo branch that is promising but not yet baseline truth

### `doc-only`
Use when the item matters enough to document, but is not represented in demo this round.

Typical examples:
- backend-only safeguard
- historical compatibility note
- rare fallback rule not visualized this round

### `demo-validation-only`
Use when the item appears in demo for validation, but is not yet formal delivery wording.

Typical examples:
- exploratory interaction variant
- temporary visual treatment for discussion
- state visualization that tests comprehension before rule closure

---

## Practical semantics

Use these meanings consistently.

### `review` does NOT mean
- low quality
- messy draft by default
- nothing is stable yet

It means the artifact is still primarily serving review/alignment rather than stronger downstream delivery trust.

### `delivery` does NOT mean
- visually polished
- 100% complete in every imaginable detail
- nothing unstable exists anywhere

It means the artifact is trustworthy enough to be used as a stronger continuation baseline with limited reinterpretation.

### `stable` does NOT mean
- convenient for now
- unlikely to be challenged because no one looked closely
- visually clean and well written

It means the item is currently part of the trusted baseline for this round.

### `unfrozen` does NOT mean
- bad
- throwaway
- forbidden to show

It means the item is visible but not yet baseline truth.

---

## Allowed combinations

Think of labeling as:
- artifact stage label
- plus item stability label

### Normal combinations
- `review` + `stable`
- `review` + `unfrozen`
- `review` + `doc-only`
- `review` + `demo-validation-only`
- `delivery` + `stable`
- `delivery` + `doc-only` (only when clearly justified)
- `delivery` + limited `unfrozen` items if explicitly marked and not baseline-defining

### Dangerous combinations
- `delivery` with many `unfrozen` items
- `delivery` dominated by `demo-validation-only` content
- `delivery` where unstable items sit in baseline-defining sections
- `stable` label applied to content whose rule basis is still disputed
- `doc-only` label used to hide major missing demo expression without explanation

These are not always impossible, but they usually indicate the artifact is still closer to review than delivery.

### Usually invalid combinations
- `stable` + item explicitly described as exploratory
- `delivery` + artifact whose main logic is still being discovered through demo
- `delivery` + no visible differentiation between stable and unstable content when instability exists

If a combination feels contradictory, prefer the more conservative label.

---

## Artifact-stage decision rules

### When to label the whole artifact as `review`
Use `review` if any of these are true:
- major logic is still under discussion
- multiple unfrozen items are central to the artifact
- demo is still helping discover logic rather than mainly expressing stable logic
- doc/demo linkage is coherent enough for review, but not yet trustworthy as stronger delivery baseline
- reviewers still need to challenge core baseline assumptions
- the current round is better described as review freeze than delivery freeze

### When to label the whole artifact as `delivery`
Use `delivery` only if most of these are true:
- core rules are stable
- key states and outcomes are stable
- doc/demo/mapping belong to the same effective round
- unstable items are limited and visibly marked
- downstream teams can continue from this artifact without heavy reinterpretation
- the current round is close to or compatible with delivery freeze judgment

### Conservative default rule
If the label is debatable, prefer `review` over `delivery`.
It is safer to under-claim than to over-claim.

---

## Item-label decision rules

### Prefer `stable` when
- the requirement baseline is already trusted for this item
- the corresponding demo/doc/mapping expression matches current truth
- the item can survive freeze without caveat

### Prefer `unfrozen` when
- the item is visible for continuity, but still under discussion
- the item may affect baseline meaning if changed later
- the current round would mislead readers if the item looked stable

### Prefer `doc-only` when
- the item is relevant to the requirement/delivery understanding
- but showing it in demo this round is unnecessary, impossible, or out of scope

### Prefer `demo-validation-only` when
- the demo needs to test comprehension, interaction, or shape
- but the expression is not yet formal delivery truth
- readers should not cite the visual expression as final business wording

---

## Label placement rules

Labels should appear where misunderstanding would otherwise happen.

### Artifact level
Place the main stage label near the header:
- `review`
- `delivery`

### Section level
Place labels on sections when a whole block shares one trust state.

Examples:
- an entire section is `unfrozen`
- an entire rule cluster is `doc-only`

### Item level
Place labels on smaller items when mixed trust states exist inside one section.

Examples:
- one mapping is `unfrozen`
- one interaction variant is `demo-validation-only`

### Escalation rule
The more likely a reader is to over-trust an item, the closer the label should be to the item itself.

Do not hide all labels in a legend while leaving the main body visually ambiguous.

---

## Labeling density rules

### Too sparse
- only one header label exists
- unstable blocks look identical to stable ones
- readers must infer trust level from context or footnotes

### Too dense
- every line gets a badge
- labels overwhelm reading rhythm
- the page turns into status noise

### Good density
- artifact-level stage is always visible
- section-level labels are used for coherent unstable groups
- item-level labels are used only where mixed trust states would otherwise mislead

---

## Typical scenarios

### Scenario 1: Review-grade embedded PRD with some stable logic
Recommended pattern:
- artifact = `review`
- confirmed rule blocks = `stable`
- still-debated state branch = `unfrozen`
- exploratory demo interaction = `demo-validation-only`

### Scenario 2: Delivery-oriented artifact with a few caveats
Recommended pattern:
- artifact = `delivery`
- almost all baseline blocks = `stable`
- rare documented-but-not-visualized edge rule = `doc-only`
- one limited unresolved note = `unfrozen` and visually prominent

### Scenario 3: Fake delivery tendency
Warning pattern:
- artifact labeled `delivery`
- major state logic still moving
- several exploratory demo blocks shown without distinction
- mappings look polished but belong to mixed rounds

This should usually be downgraded back toward `review`.

---

## Relationship to freeze and audit

### Relationship to `freeze-readiness-check`
- if the round is only ready for review freeze, labeling should usually stay at `review`
- if delivery freeze is not defensible, do not label the artifact `delivery` just because it looks strong

### Relationship to `embedded-prd-audit`
- audit should check whether labeling is truthful, visible, and aligned with the actual baseline state
- if item-level instability exists but is not labeled, audit should downgrade suitability

### Relationship to `rule-change-signal`
- if an allegedly stable item is actually changing at the rule level, do not relabel it quietly; route it through rule-change handling first

---

## Misleading patterns to avoid

### 1) Review artifact pretending to be delivery
The page looks polished, so everything gets treated like settled baseline.

### 2) Stable-looking unfrozen content
An unfrozen block is styled the same as stable content and becomes misleading.

### 3) Demo-validation content presented like final rule truth
Exploratory interaction or placeholder state appears indistinguishable from confirmed delivery behavior.

### 4) Doc-only items disappearing from labeling logic
Important documented-only items are present, but no one can tell they were intentionally not visualized.

### 5) One label for everything
The whole artifact gets a stage label, but item-level stability distinctions disappear.

### 6) Conservative label drift
Everything is marked `review` forever, so stable parts never become legible as trusted baseline.

---

## Recommended minimum labeling pattern

For a practical v1 embedded PRD, at minimum provide:
- one artifact-level label: `review` or `delivery`
- visible `unfrozen` labels where instability exists
- visible `doc-only` labels where a documented item lacks demo representation
- visible `demo-validation-only` labels where demo exploration is not yet formal truth

If these are missing, readers will over-trust the artifact.

---

## Anti-patterns

Avoid these mistakes:
- using `delivery` as a synonym for “looks finished”
- using `stable` as a synonym for “currently convenient”
- hiding instability in footnotes only
- labeling everything `review` forever and never clarifying what is actually stable
- labeling everything `stable` just to make the artifact feel cleaner
- downgrading everything to `review` because the team is afraid to claim anything stable
