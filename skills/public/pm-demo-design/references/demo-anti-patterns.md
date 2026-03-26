# Demo Anti-Patterns

Use this reference when `pm-demo-design` needs to avoid common failure modes in demo generation, iteration, or enhancement.

The goal is to stop demos from looking persuasive while becoming less truthful, less useful for review, or less reusable downstream.

---

## Core idea

A bad demo is not only one that looks ugly.
A bad demo is often one that:
- looks clearer than the underlying logic really is
- hides missing states or weak rule expression
- drifts away from the target product context
- creates false confidence for freeze or delivery

This reference is not only a warning list.
Treat it as a diagnosis guide:
- what kind of anti-pattern is this?
- how serious is it?
- which downstream risk does it create?
- what corrective action should be triggered?

---

## Severity model

Use these three severity levels.

### Level 1 — Quality drift
The demo is still broadly truthful, but review quality or product fit is weakening.

### Level 2 — Validation distortion
The demo begins to mislead review by hiding meaningful states, weak expression, or scope drift.

### Level 3 — Baseline corruption
The demo is no longer just imperfect; it is actively distorting requirement truth, freeze judgment, or downstream baseline trust.

---

## Anti-pattern 1: Happy-path-only demo

### Severity
Usually Level 2. May become Level 3 if core business states are omitted.

### What it looks like
- main success path is shown
- exception, pending, failed, paused, expired, retry, or role-difference states are missing

### Why it is bad
- it makes the requirement look more complete than it is
- downstream PRD and freeze judgment become misleading

### Typical downstream risk
- weak review quality
- false freeze confidence
- missing state mapping later

### Triggered action
Usually trigger `state-audit`.
If the missing state reveals underlying rule uncertainty, escalate to `rule-change-signal`.

### Better move
- show at least the key business states and outcomes
- if not all states are ready, mark the gaps explicitly

---

## Anti-pattern 2: Pretty but rule-wrong

### Severity
Usually Level 3.

### What it looks like
- hierarchy and visuals are strong
- but state meaning, trigger result, or rule expression is wrong

### Why it is bad
- it creates stronger false confidence than a rough but honest demo

### Typical downstream risk
- requirement drift
- false stakeholder alignment
- dangerous freeze pressure

### Triggered action
Usually trigger `rule-change-signal`.
Also usually blocks stronger freeze until corrected.

### Better move
- preserve business truth before surface polish
- if a cleaner visual treatment weakens meaning, reject it

---

## Anti-pattern 3: Generic-product syndrome

### Severity
Usually Level 1.

### What it looks like
- the demo feels like a random startup template
- it ignores the actual platform, audience, and current product language

### Why it is bad
- even correct logic becomes less usable for real product discussion

### Typical downstream risk
- product-fit drift
- wasted review energy on style mismatch

### Triggered action
Usually revisit design context or enhancement guidelines, not rule-change handling.

### Better move
- use design context
- inherit the real product's surface, density, tone, and component habits where needed

---

## Anti-pattern 4: New-product hallucination

### Severity
Usually Level 2.

### What it looks like
- the task is incremental redesign or extension
- but the demo behaves like a brand-new product with different navigation and language

### Why it is bad
- it breaks continuity
- it causes avoidable disagreement unrelated to the actual requirement

### Typical downstream risk
- inflated redesign scope
- stakeholder resistance unrelated to requirement truth

### Triggered action
Usually re-check scope and design context.
If actual round scope was silently expanded, treat it like scope drift.

### Better move
- preserve what must still feel like the same product
- only change what this requirement actually needs changed

---

## Anti-pattern 5: Hidden rule change

### Severity
Level 3.

### What it looks like
- the demo changes in a way that actually changes requirement meaning
- but the change is presented as normal iteration

### Why it is bad
- requirement drift happens without explicit upstream confirmation

### Typical downstream risk
- corrupted baseline
- invalid handoff package
- misleading freeze recommendation

### Triggered action
Always trigger `rule-change-signal`.
Usually refresh upstream handoff before trusting the new branch.

### Better move
- emit a rule-change signal
- do not quietly convert demo iteration into business conclusion

---

## Anti-pattern 6: Scope creep by demoing

### Severity
Usually Level 2. May become Level 3 if the new scope changes baseline meaning.

### What it looks like
- extra pages, extra modules, extra scenarios, or extra interactions appear just because they feel useful

### Why it is bad
- demo output stops matching current round scope
- later handoff and freeze become harder

### Typical downstream risk
- unstable review focus
- invalid handoff package
- wrong delivery expectations

### Triggered action
Usually re-check scope.
If scope meaning changed, escalate through `rule-change-signal`.

### Better move
- keep explicit in-scope / out-of-scope boundaries
- if expansion is needed, surface it as scope change rather than silent growth

---

## Anti-pattern 7: Enhancement overriding validation

### Severity
Usually Level 2.

### What it looks like
- design-enhancement mode starts suppressing complex states or awkward but necessary business cues
- the demo becomes nicer but less useful for logic review

### Why it is bad
- validation quality drops while the artifact feels stronger

### Typical downstream risk
- review distortion
- under-signaled business meaning
- false readiness confidence

### Triggered action
Usually step back to logic-validation expectations.
If state meaning is weakened materially, also trigger `state-audit`.

### Better move
- keep enhancement as expression upgrade only
- do not trade away state clarity or rule truth for polish

---

## Anti-pattern 8: Unmarked exploratory content

### Severity
Usually Level 2. Can become Level 3 near freeze.

### What it looks like
- a demo branch is still exploratory
- but nothing indicates that it is tentative

### Why it is bad
- downstream users may treat it like stable baseline material

### Typical downstream risk
- false baseline trust
- freeze confusion
- embedded-PRD labeling mistakes

### Triggered action
Usually trigger stronger stability marking and freeze re-check.
If already near baseline preservation, use `freeze-readiness-check`.

### Better move
- mark exploratory or unstable branches clearly
- do not let them masquerade as freeze-ready output

---

## Anti-pattern 9: State expression too weak

### Severity
Usually Level 2.

### What it looks like
- states technically exist, but key differences are visually weak or easy to miss
- warnings, transitions, or business outcomes are under-signaled

### Why it is bad
- the demo may look complete while still failing review

### Typical downstream risk
- weak state comprehension
- under-detected validation problems
- misleading review approval

### Triggered action
Usually trigger `state-audit`.
If the issue is only visual prominence, stay in demo work; if the issue exposes real logic confusion, escalate further.

### Better move
- increase differentiation where the state meaning matters
- prioritize business-significant visibility over decorative neatness

---

## Anti-pattern 10: Reference overfitting

### Severity
Usually Level 1. May become Level 2 if product fit breaks materially.

### What it looks like
- the demo copies the vibe of a benchmark/reference too aggressively
- actual constraints, audience, or product identity are ignored

### Why it is bad
- the result may be stylish but strategically wrong

### Typical downstream risk
- style drift
- team debate about aesthetics instead of requirement value

### Triggered action
Usually return to design context and enhancement guidance.
Not usually a rule-change issue.

### Better move
- borrow structure and interaction principles, not surface imitation alone

---

## Diagnostic shortcuts

Use these shortcuts when reviewing a suspicious demo round.

### If the problem is “key states are missing or too weak”
Start with `state-audit`.

### If the problem is “the demo now implies a different rule”
Start with `rule-change-signal`.

### If the problem is “the demo looks stronger than the current baseline deserves”
Start with `freeze-readiness-check`.

### If the problem is “the demo no longer feels like the real product”
Return to design context and design-enhancement guidance.

---

## Quick self-check

Before treating a demo round as solid, ask:
- Does this demo tell the truth about the current logic?
- Are key states and outcomes visible enough?
- Does it still feel like the actual target product/context?
- Did we quietly expand scope?
- Did we accidentally turn exploration into false baseline confidence?
- If this were reviewed or frozen today, what wrong confidence would it create?

If any answer reveals distortion, fix that before stronger freeze/delivery use.
