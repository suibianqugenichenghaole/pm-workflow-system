# Design Enhancement Guidelines

Use this reference when `pm-demo-design` enters design-enhancement mode and needs to improve demo quality without letting visual polish override requirement truth.

The goal is to make demos feel more product-like, coherent, and presentable while keeping business logic, state expression, and scope discipline intact.

---

## Core idea

Design enhancement is an optional layer, not the core job.

That means:
- logic-validation remains primary
- enhancement should make the demo clearer and more product-like
- enhancement should not rewrite business meaning
- enhancement should not be used to hide missing states, weak flows, or unstable rules

If the logic is not stable enough for enhancement, stay closer to logic-validation mode.

---

## Enhancement entry rule

Do not enter enhancement mode just because the current demo looks rough.

Usually enter design-enhancement mode when most of these are true:
- core page structure is already reasonable
- key states are already identified
- major business rules are already broadly on track
- the current round is not dominated by unresolved rule-change issues
- the user wants stronger product feel, communication quality, or showcase quality
- stronger hierarchy and consistency would materially improve review value

### Warning signs that enhancement mode is premature
- key states are still missing
- the demo still keeps changing requirement meaning
- scope is still drifting
- state visibility is weak because the structure itself is still unstable
- the team is trying to use polish to avoid requirement clarification

If these signs dominate, stay in logic-validation mode.

---

## Two enhancement depths

### 1) Review enhancement

Use when:
- the round is still mainly for review or alignment
- logic is mostly on track but the current demo is too rough for efficient discussion

Focus on:
- hierarchy
- readability
- component consistency
- state visibility
- product fit

Do not over-invest in decorative flourish here.

### 2) Showcase enhancement

Use when:
- logic is already relatively stable
- the demo will be shown more widely, shared externally, or used as a stronger showcase/example
- stronger polish materially improves communication value

Focus on everything in review enhancement, plus:
- stronger tone expression
- more refined component presentation
- stronger composition and pacing
- selected polish details that improve perceived quality

Even here, requirement truth still outranks style.

---

## What enhancement should improve

Typical enhancement targets:
- visual hierarchy
- component consistency
- page rhythm and spacing
- emphasis and readability
- copy polish
- interaction clarity
- stronger product tone alignment
- more coherent use of color, contrast, and density

These are valid enhancement areas because they improve comprehension and product feel without changing requirement truth by default.

---

## What enhancement must not override

Do not let enhancement override:
- business rules
- state completeness
- state meaning
- trigger-driven differences
- config-driven differences
- scope boundaries for this round
- existing product constraints that must remain recognizable

If a prettier direction weakens truthfulness, reject it.

---

## Enhancement priorities

When time is limited, enhance in this order:

### 1) Hierarchy before decoration
Make the page easier to read before making it more stylish.

### 2) State clarity before surface polish
Make key states, warnings, and outcomes legible before chasing atmosphere.

### 3) Product fit before novelty
Make it feel like the target product before making it feel impressive.

### 4) Consistency before flourish
Fix component rhythm and design-language consistency before adding expressive details.

### 5) Communication value before aesthetic indulgence
Improve what helps review, alignment, or showcase value first; skip polish that only looks clever.

---

## Relationship to design context

Use enhancement only after checking:
- product surface
- target users
- age / cognitive level
- tone / style direction
- existing design language
- common components and constraints
- style references and anti-references

A more polished demo is still wrong if it becomes less like the actual product context.

---

## Relationship to external enhancement layers such as impeccable.style

Treat tools or approaches like `impeccable.style` as optional enhancement sources.

They can help improve:
- typography
- spacing rhythm
- contrast
- composition
- component polish
- design writing feel

They should not become the new source of truth for:
- business logic
- state coverage
- requirement scope
- config/trigger behavior

In short:
- use them to enhance expression
- do not let them redefine the requirement

---

## Safe enhancement patterns

Good enhancement usually looks like:
- same logic, clearer hierarchy
- same structure, better rhythm and emphasis
- same states, stronger differentiation
- same product identity, cleaner execution
- same scope, more readable and review-friendly output

These are upgrades in expression, not hidden rewrites.

---

## Risky enhancement patterns

Be cautious when enhancement starts to do any of these:
- introduces new interaction patterns without strong reason
- suppresses complex states because they hurt visual cleanliness
- replaces business-explicit labels with vague “nicer” wording
- drifts too far from current product language
- borrows a reference product’s vibe while ignoring the actual user/product context
- makes the artifact look delivery-ready when the baseline is still review-grade

These often look good at first but create downstream confusion.

---

## Stop or step-back rules

Pause or reduce enhancement when:
- a rule-change signal appears
- a state-audit issue reveals major state gaps
- scope drift is discovered
- the enhanced version is less truthful than the rougher version
- the team starts debating style because the logic is still unstable

In these cases:
- step back to logic-validation priorities
- fix truthfulness first
- then re-enter enhancement if still useful

---

## Recommended enhancement checklist

Before approving an enhanced demo, quickly check:
- Is the page easier to understand than before?
- Are key business states more visible, not less?
- Does it still feel like the target product and user context?
- Did enhancement preserve current scope instead of quietly adding new ideas?
- Would a PM still trust this demo as a logic-valid expression, not just a pretty mock?
- Is the stronger polish creating false delivery confidence?

If any answer reveals distortion, enhancement has gone too far.

---

## Output guidance

When delivering an enhanced round, briefly say:
- what stayed logically unchanged
- what was improved visually or structurally
- whether the output is still mainly for validation, review, or showcase
- whether enhancement depth was review-enhancement or showcase-enhancement

This avoids confusion between:
- logic change
- expression improvement
- style exploration
- communication-grade polish

---

## Relationship to demo anti-patterns

Use `demo-anti-patterns.md` when you suspect enhancement is drifting into:
- pretty but rule-wrong
- enhancement overriding validation
- unmarked exploratory content
- reference overfitting

If any of those patterns are present, fix the anti-pattern before further polish.

---

## Anti-patterns

Avoid these mistakes:
- treating enhancement as a substitute for missing requirement clarity
- polishing a broken state model
- using a stylish reference to overwrite product fit
- making the demo look like a brand-new product when the task is incremental design
- turning a validation demo into a false-delivery artifact through polish alone
- entering showcase-style enhancement while the round is still logic-unstable
