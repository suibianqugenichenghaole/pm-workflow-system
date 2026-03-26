# Handoff Template

Use this reference when `pm-requirement-intake` needs to hand structured output downstream to `pm-demo-design`, `pm-embedded-prd`, or `pm-project-ops`.

The goal is not to produce a long report. The goal is to pass a stable, explicit handoff object so downstream work does not reconstruct the requirement from scattered chat history, and does not silently promote assumptions into truth.

---

## Core principles

A good handoff should be:
- structured enough for downstream reuse
- explicit about what is confirmed vs still open
- explicit about what is stable vs unfrozen
- explicit about what is assumption vs conclusion
- scoped to the next downstream action
- short enough to remain workable

A handoff should not:
- dump the full raw conversation
- hide unresolved logic inside polished wording
- pretend unstable assumptions are already confirmed
- force downstream skills to rediscover the baseline
- use one generic package for all downstream targets without specialization

---

## Handoff object model

Think of a handoff as four layers, not one flat note.

### 1) Identity layer
What this requirement is.

### 2) Requirement-baseline layer
What is currently believed to be true.

### 3) Stability layer
What is stable, what is pending, what is explicitly unfrozen.

### 4) Downstream-target layer
What the next skill specifically needs from this requirement round.

If these layers are mixed together, downstream work becomes fragile.

---

## Common handoff fields

Use these fields as the shared base across all downstream handoffs.

### Identity and context
- requirement name
- requirement summary
- business background
- current-state summary
- requirement type labels
- current round goal
- downstream target

### Requirement-baseline layer
- confirmed items
- pending items
- explicit assumptions
- explicit non-goals for this round
- known risks
- evidence basis if important (for example: policy decision / current logic / scenario review / prior baseline)
- readiness judgment
- next recommended action

### Rule/model layer
- current rule baseline summary
- key conflict/priority rules
- special-trigger handling status
- config/history impact summary
- parts of the rule model already converged
- parts of the rule model still unstable

### Scope layer
- in-scope pages/modules/scenarios
- out-of-scope pages/modules/scenarios
- recommended current round scope
- scope that downstream must not silently expand

### Stability layer
- stable / confirmed baseline
- unfrozen items
- items that must not be treated as final truth yet
- what is safe to reuse downstream right now
- what requires refresh if changed

---

## Field semantics

Downstream confusion often comes from weak status words. Use these meanings consistently.

### Confirmed items
Items that are currently agreed enough to be treated as active requirement baseline for this round.

### Pending items
Items known to matter, but not yet closed.

### Assumptions
Temporary working beliefs that support current progress, but are not yet promoted to stable baseline.

### Unfrozen items
Items that may already appear in demo or delivery discussion, but must remain visibly unstable.

### Non-goals
Things intentionally excluded from this round, to stop downstream scope drift.

### Stable baseline
The currently trusted part of the requirement package that downstream may build on without re-asking the whole requirement.

---

## Handoff readiness rule

Do not produce a heavy downstream handoff just because discussion volume is high.

A handoff is ready only when:
- the downstream target is known
- the current round goal is known
- stable vs unstable parts are separated clearly enough
- the next skill can work from this package without reconstructing the requirement from raw chat

If these conditions are not met, either:
- produce a lighter handoff package, or
- stay in requirement-intake work a little longer

---

## A → B handoff

Use this when handing from `pm-requirement-intake` to `pm-demo-design`.

### Purpose
Give B enough structure to generate or iterate a truthful demo without redoing requirement intake.

### Suitable timing
Use when the requirement is ready for:
- structure draft, or
- demo draft, or
- logic-validation demo work

Do not wait for perfect delivery closure before handing to B.
B is allowed to help expose missing states, flows, and weak expression.

### Minimum package
- requirement overview
- business background
- requirement type labels
- confirmed items
- pending items
- current readiness judgment
- recommended demo scope
- design-context gaps still needing补充
- rule/model summary that affects pages/states/interactions
- special states or trigger-driven scenarios that must be shown
- explicit assumptions B may temporarily work with
- explicit non-goals for this demo round

### What B may safely do
- visualize confirmed logic
- expand page/state expression under unchanged rules
- expose weak spots in state/flow coverage
- return rule-change signals when demo work reveals baseline problems

### What B must not silently do
- convert assumptions into formal rule conclusions
- expand scope just because a page idea feels useful
- freeze exploratory demo branches as stable baseline without surfacing instability

### Recommended shape

```md
## Handoff to pm-demo-design
- Requirement:
- Requirement summary:
- Business background:
- Requirement types:
- Current round goal:
- Confirmed items:
- Pending items:
- Assumptions:
- Non-goals for this round:
- Readiness judgment:
- Recommended demo scope:
- Rule/model summary:
- Must-show states/scenarios:
- Design-context gaps:
- Unfrozen items:
- Return-to-intake triggers:
- Recommended next move:
```

---

## A → C handoff

Use this when handing from `pm-requirement-intake` toward `pm-embedded-prd`.

### Purpose
Give C a stable enough requirement-side package so it can assemble embedded-PRD delivery from a known baseline instead of raw conversation archaeology.

### Suitable timing
Use when the requirement is moving toward embedded-PRD review or delivery composition.
This handoff expects stronger stability than A → B.

### Minimum package
- requirement overview
- current round goal
- stable rule baseline summary
- confirmed state/outcome summary
- config/history logic summary
- special-trigger handling summary
- explicit in-scope delivery sections
- explicit unfrozen items
- current delivery/readiness judgment
- what C must label as unstable if it appears

### Critical rule
Do not hand off to C as if delivery-ready when the package is still mostly exploratory.
C should consume:
- stable baseline
- explicit unfrozen list
- known scope boundary
- stable enough state/outcome baseline to support truthful linkage

### What C may safely do
- organize stable rule/state/config material into left-doc/right-demo delivery shell
- attach explicit unstable labels where needed
- compose mapping/navigation around current stable baseline

### What C must not silently do
- infer final business truth from raw long chat history
- use unstable demo ideas as if they were stable delivery baseline
- erase the difference between stable items and discussion items

### Recommended shape

```md
## Handoff to pm-embedded-prd
- Requirement:
- Requirement summary:
- Current round goal:
- Stable rule baseline:
- Stable state/outcome baseline:
- Config/history summary:
- Special-trigger summary:
- In-scope delivery sections:
- Non-goals for delivery this round:
- Unfrozen items:
- Readiness for embedded-PRD delivery:
- Notes on what must not be presented as final:
- Recommended next move:
```

---

## A → D handoff

Use this when handing structured outputs to `pm-project-ops` for saving, versioning, freezing, or indexing.

### Purpose
Tell D what kind of artifact is being produced and what status it has, so D does not have to guess whether something is draft, review-ready, freeze-candidate, frozen, or historical.

### Suitable timing
Use whenever the current requirement-side output should stop living only in chat and start existing as a managed asset.
This may happen before full freeze.

### Minimum package
- project or requirement identity
- current version/stage if known
- artifact type(s) being handed off
- current baseline status
- whether this is working material, review material, freeze candidate, or frozen baseline
- relationships to prior version if known
- continuation entry recommendation if known
- whether downstream artifacts should share the same effective version tag

### Typical artifact types
- rule baseline / requirement skeleton
- demo baseline
- embedded PRD draft/baseline
- mapping manifest
- diff notes
- freeze candidate package

### What D may safely do
- save and organize the artifact
- assign or preserve version/stage context
- record baseline relations
- create continuation-friendly entry points

### What D must not silently do
- promote working material into frozen truth without explicit freeze basis
- collapse distinct rounds into one unclear baseline
- treat chat-only assumptions as asset-grade truth

### Recommended shape

```md
## Handoff to pm-project-ops
- Project / requirement:
- Requirement summary:
- Current version:
- Current stage:
- Artifact types:
- Baseline status:
- Freeze intent:
- Stable baseline included:
- Unfrozen items included:
- Replaces / relates to:
- Continue from:
- Notes for indexing or snapshotting:
```

---

## Refresh and invalidation triggers

A downstream handoff is not permanent truth. Treat it like a package with explicit invalidation triggers.

### Usually still valid
- layout optimization
- copy polish
- design enhancement under unchanged rules
- richer expression of already-confirmed states
- stronger visual linkage under unchanged baseline

### Usually requires partial refresh
- newly surfaced state that fits the existing rule model
- clarified config effect already implied upstream
- clearer trigger expression under unchanged trigger rule

### Usually requires full refresh
- main rule changes
- priority/conflict changes
- special-trigger handling changes
- scope boundary changes
- newly included or excluded scenarios
- changes that alter what downstream artifacts would need to say
- change from exploratory branch to freeze candidate branch

### Refresh owner rule
Default owner of refresh is still `pm-requirement-intake`, unless the issue is clearly only downstream expression.
If downstream work reveals a Class C rule-change signal, refresh upstream before trusting the old handoff package.

---

## Minimal universal template

Use this when you want one compact handoff object before specializing it downstream.

```md
## Requirement handoff package
- Requirement:
- Requirement summary:
- Background:
- Requirement types:
- Current round goal:
- Downstream target:
- Confirmed items:
- Pending items:
- Assumptions:
- Non-goals:
- Rule/model summary:
- Scope (in / out):
- Readiness judgment:
- Stable baseline:
- Unfrozen items:
- Recommended next move:
- Refresh triggers:
```

---

## Example compression pattern

When the requirement is complex, compress by priority instead of dumping detail.

### Good compression
- 3-7 confirmed items
- 2-5 pending items
- 2-5 rule/model bullets
- explicit scope boundary
- explicit unfrozen list

### Bad compression
- one giant polished paragraph
- full meeting transcript style dump
- many details with no stable/unstable distinction

---

## Anti-patterns

Avoid these handoff failures:
- handing downstream a polished paragraph instead of a structured object
- mixing confirmed conclusions with open guesses
- omitting assumptions and letting them masquerade as confirmed truth
- omitting unfrozen items and letting downstream assume everything is settled
- forcing downstream skills to reconstruct the baseline from long chat history
- using one identical handoff shape for B, C, and D even though their jobs differ
- refreshing downstream artifacts without refreshing the handoff package after upstream rule change
