---
name: audience-judgment-framing
description: "触发：文档/PPT/PRD需先定读者判断；不触发：需求价值→用pm-value-anchor；需求澄清→用pm-requirement-intake；输出：读者判断+证据"
---

# Audience Judgment Framing

Use this skill before creating or reviewing an artifact that has readers.

The core principle: any artifact with a reader should first define what judgment the reader should form after reading it.

## Core Job

Frame the artifact around:
- who will read it
- what decision, judgment, or confidence they need to form
- what evidence they need
- what they may question
- what the artifact must not over-explain or under-prove

This skill prevents outputs that are internally complete but fail their audience.

## Use When

Use when preparing or reviewing:
- PRD / requirement docs
- prototype annotations
- embedded PRD left-side documents
- review materials
- project summaries
- weekly/monthly reports
- performance summaries
- PPT or presentation narratives
- leadership updates
- cross-team handoff docs

## Do Not Use When

Do not use this skill for:
- purely private notes with no reader
- raw memory capture
- simple file edits or small local changes
- artifacts where the reader and expected judgment are already obvious and low-risk

## Reader Types

Common reader frames:
- leadership: wants value, progress, risk, ownership, and next-step confidence
- development: wants implementable rules, boundaries, states, data expectations, and dependencies
- testing: wants verifiable behavior, edge cases, acceptance criteria, and regression risk
- design: wants layout intent, interaction priority, component reuse, and visual constraints
- operation/content: wants process impact, configuration rules, and action ownership
- user/customer-facing reviewer: wants clarity, benefit, trust, and reduced confusion
- future self / future AI: wants continuation pointers, stable decisions, and unresolved items

## Working Flow

### 1. Identify the artifact

Name the artifact and its situation:
- PRD
- PPT
- review doc
- embedded PRD
- project summary
- handoff
- report

### 2. Identify the primary reader

Choose one primary reader. Secondary readers may exist, but do not let the artifact serve everyone equally.

### 3. Define the expected judgment

Write one sentence:

```text
After reading this, the reader should conclude that {judgment}.
```

Examples:
- "this requirement is clear enough for development"
- "this project has produced meaningful business progress"
- "this prototype is ready for review but not freeze"
- "this AI workflow improves continuity, not only writing speed"

### 4. Identify required evidence

List the evidence needed to support that judgment:
- facts
- metrics
- milestones
- concrete examples
- before/after contrast
- risk handling
- state coverage
- implementation boundaries
- user/data feedback

### 5. Predict reader objections

Ask:
- what would this reader doubt?
- what would they ask next?
- where might they think the output is vague, inflated, or incomplete?
- what proof would make them more confident?

### 6. Shape the artifact

Recommend what the artifact should emphasize, reduce, or restructure.

For example:
- leadership materials should convert work detail into impact and confidence
- PRDs should convert product intent into implementable and testable rules
- embedded PRDs should keep explanation on the left and real prototype on the right
- project summaries should convert scattered work into state, result, risk, and next step

## Output Format

```md
## Audience judgment frame
- Artifact:
- Primary reader:
- Expected judgment:
- Evidence needed:
- Likely objections:
- Emphasis:
- Reduce / avoid:
- Recommended structure:
```

## Relationship With Other Skills

- Use before `pm-prd-writer` when reader confidence matters.
- Use before `pm-embedded-prd` when the left document must guide review judgment.

## Self-Check

Before finishing, check:
- Did I choose one primary reader?
- Did I define the judgment, not only the topic?
- Did I identify evidence instead of relying on polished wording?
- Did I predict likely objections?
- Did I avoid turning every artifact into a leadership report?
