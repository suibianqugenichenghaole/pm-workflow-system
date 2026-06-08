---
name: pm-value-anchor
description: "触发：需求价值/成功标准/取舍不清；不触发：范围规则不清→用pm-requirement-intake；读者判断→用audience-judgment-framing；输出：价值锚点"
---

# PM Value Anchor

Use this skill before or during requirement intake when the value of a request is not explicit enough.

The goal is to answer: if this work succeeds, what meaningful result should change?

## Core Job

Create a compact value anchor that clarifies:
- who benefits
- what problem changes
- what success looks like
- what minimum version still counts as success
- what evidence could later prove or challenge the decision

This skill prevents the workflow from producing precise rules for a low-value or poorly framed request.

## Use When

Use when:
- a request starts from a proposed solution instead of a clear problem
- success criteria are implicit
- a feature could be scoped many ways
- the request may be too broad for the current stage
- the user asks why a requirement matters or how to prioritize it
- a downstream PRD/demo/prototype risks becoming "complete but not compelling"

## Do Not Use When

Do not force this skill when:
- the request is tiny and low-risk
- the value is already obvious and stable
- the user only needs a quick copy/config adjustment
- there is no product decision to clarify

## Value Anchor Questions

Answer only what is useful for the request.

### 1. Beneficiary
- Who benefits directly?
- Who benefits indirectly?
- Which role feels the pain now?

### 2. Current Problem
- What is hard, slow, confusing, risky, or impossible today?
- What workaround exists?
- What fails if nothing changes?

### 3. Desired Outcome
- What should become easier, clearer, faster, safer, or more valuable?
- What user behavior or business result should change?
- What should reviewers be able to agree on?

### 4. Minimum Success
- If only 30% of the idea can be kept, what must remain?
- Which part proves the core value?
- Which part is polish or later expansion?

### 5. Evidence
- What data, user feedback, review result, usage signal, delivery milestone, or reduction in rework would support success?
- What evidence would show the idea was weak or scoped incorrectly?

## Output Format

```md
## Value anchor
- Target beneficiary:
- Current problem:
- Desired outcome:
- Minimum success version:
- Evidence to watch:
- Scope implication:
- Recommended next step:
```

## Relationship With Other Skills

- Use before `pm-requirement-intake` when success is fuzzy.
- Feed the value anchor into `pm-requirement-intake` as context.
- Use with `request-triage` when workflow depth depends on value and risk.
- Use with `freeze-readiness-check` when deciding whether a baseline is meaningful enough to preserve.

## Self-Check

Before finishing, check:
- Did I distinguish value from implementation detail?
- Did I define minimum success instead of listing every possible feature?
- Did I leave enough evidence hooks for later review?
- Did I avoid turning a small request into a strategy memo?
