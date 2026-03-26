---
name: freeze-readiness-check
description: Judge whether the current requirement/demo/PRD work is stable enough to freeze as a review or delivery baseline, and identify what blocks freezing when it is not ready. Use when a product workflow round may be turned into a versioned snapshot, when Codex needs to decide whether to keep iterating or preserve the current baseline, or when downstream embedded-PRD/project-ops work depends on a trustworthy freeze decision.
---

# Freeze Readiness Check

Act as a command-style skill for deciding whether a current PM workflow round is ready to freeze.

## Core job

Evaluate the current round across requirement stability, demo stability, linked-delivery stability, and versioning coherence, then output:
- whether freeze is recommended
- what kind of freeze is justified, if any
- what the main blockers are
- what should happen next

Use this skill to stop teams from freezing too early because a demo looks finished or a document feels long enough.

## Boundaries

This skill is responsible for:
- judging freeze readiness
- identifying blockers and risk level
- distinguishing review-candidate freeze from stronger delivery freeze
- telling upstream/downstream what should happen next

This skill is not responsible for:
- rebuilding the requirement from scratch
- rewriting the demo or PRD itself
- performing version management actions directly
- deciding final business truth when major requirement disputes are still open

If the input is too incomplete to judge honestly, say that clearly and ask for the smallest missing piece.

## Inputs

Work from whatever current-round evidence exists, such as:
- requirement skeleton or rule baseline
- demo status
- embedded-PRD or linked-delivery status
- unresolved items / unfrozen items
- recent rule-change signals
- intended freeze target (`review` or stronger delivery/frozen baseline)
- version/snapshot context if available

Do not require every artifact to exist before starting judgment. Judge based on the claimed freeze target.

## Freeze targets

Always judge readiness relative to one of these targets.

### 1) Review freeze

Use when the goal is:
- preserve a coherent review candidate
- keep a stable discussion baseline
- avoid losing the exact round under review

This target tolerates some unfrozen items, as long as they are clearly marked and do not destroy coherence.

### 2) Delivery freeze

Use when the goal is:
- treat the round as a trustworthy downstream baseline
- hand work into embedded PRD / project ops / later continuation with minimal reinterpretation

This target requires stronger rule closure, stronger state closure, and stronger cross-artifact alignment.

## Working flow

### 1) Identify the claimed freeze target

If the target is not stated, infer the most likely one:
- if the round is mainly for review/discussion → review freeze
- if the round is meant to act as a trusted continuation baseline → delivery freeze

State the inferred target if you had to infer it.

### 2) Check requirement stability

Ask whether the requirement side is stable enough for the target.

Check:
- goal and scope closure
- main rule stability
- conflict/priority stability
- special-trigger stability
- config/history logic clarity
- whether the rule model is converged or still example-pile driven

Typical outcomes:
- ready
- borderline
- blocked

### 3) Check demo stability

Ask whether the demo side is stable enough for the target.

Check:
- key pages/modules/states are covered
- missing states are minor vs major
- current demo truthfully expresses current rules
- exploratory branches are separated from baseline branches
- recent changes are presentation-level vs rule-level

Typical outcomes:
- ready
- borderline
- blocked

### 4) Check linked-delivery stability

If embedded PRD / linked-delivery work is in scope, ask:
- can stable vs unfrozen items be separated cleanly?
- do doc and demo belong to the same effective round?
- do current mappings still tell the truth?
- would a reviewer/downstream consumer be misled by the current assembly?

For review freeze, partial linked-delivery incompleteness may be acceptable.
For delivery freeze, misleading linkage is a strong blocker.

### 5) Check versioning coherence

Ask:
- is there a clear version/stage identity for this round?
- is the current baseline distinguishable from working experiments?
- if this freezes now, can later work tell what it replaced and what it contains?

This does not require final project-ops execution yet, but the round should be coherent enough to preserve.

### 6) Judge blockers

Classify blockers as:
- hard blocker
- soft blocker
- watch item

#### Hard blocker
Freeze would create false truth or mislead downstream work.

#### Soft blocker
Freeze is possible, but there is still obvious quality debt or ambiguity worth fixing first.

#### Watch item
Not a reason to stop freeze, but should be carried forward visibly.

### 7) Output freeze recommendation

Choose one:
- not ready to freeze
- ready for review freeze only
- ready for freeze with explicit caveats
- ready for delivery freeze

Do not flatten these into only yes/no.

## Output format

Prefer this compact structure:

```md
## Freeze readiness
- Freeze target:
- Recommendation:
- Requirement stability:
- Demo stability:
- Linked-delivery stability:
- Versioning coherence:
- Hard blockers:
- Soft blockers:
- Watch items:
- Recommended next move:
```

Keep it compact, but do not omit:
- target
- recommendation
- blockers
- next move

## Decision heuristics

Use these tests when the judgment is borderline.

### Test 1: Truthfulness test
Ask:
- If this froze today, would people treat unstable logic as stable truth?

If yes, do not freeze at that level.

### Test 2: Misleading-baseline test
Ask:
- Would downstream embedded-PRD, project-ops, or later continuation inherit a misleading baseline?

If yes, do not approve delivery freeze.

### Test 3: Current-round coherence test
Ask:
- Do rule/demo/PRD/mapping assets still describe the same effective round?

If no, block stronger freeze.

### Test 4: Unfrozen-item separability test
Ask:
- Can unsettled items be cleanly marked and kept from contaminating stable baseline claims?

If no, avoid freeze or downgrade to a weaker freeze target.

## Typical recommendations

### Ready for review freeze only
Use when:
- the round is coherent enough to preserve and discuss
- some items remain unfrozen
- no major deception is created as long as instability is labeled

### Ready for freeze with explicit caveats
Use when:
- most of the round is stable
- a few non-core blockers remain
- preservation is still useful and the caveats can be carried clearly

### Ready for delivery freeze
Use when:
- rule model is stable
- key states and outcomes are stable
- demo truthfully expresses the current baseline
- linked-delivery assembly is truthful
- versioning handoff can be performed without ambiguity

### Not ready to freeze
Use when:
- major rule-change signals remain unresolved
- key states are missing
- demo is still exploratory in core areas
- doc/demo/mapping no longer align
- baseline truth would be overstated by freezing now

## Anti-patterns

Avoid these failures:
- freezing because the UI looks polished
- freezing because people are tired of discussing
- confusing review freeze with delivery freeze
- freezing a mixed bundle of stable and unstable work with no labels
- treating a working branch as if it were already the current baseline
- ignoring unresolved Class 3 rule-change signals

## References to load when needed

Read these only when useful:
- `../pm-requirement-intake/references/readiness-gates.md` for upstream readiness logic and rule-model convergence thinking
- `../pm-project-ops/references/version-and-snapshot-rules.md` for stage labels, baseline sets, and freeze/snapshot discipline
- `../pm-demo-design/references/rule-change-signal-template.md` when unresolved rule-change signals are part of the block

## Handoff expectations

When freeze is recommended:
- say what level of freeze is justified
- say what caveats must stay visible
- make clear whether downstream project-ops should preserve a review baseline or a stronger delivery baseline

When freeze is blocked:
- say whether the next move belongs mainly in requirement intake, demo design, embedded PRD cleanup, or versioning cleanup
