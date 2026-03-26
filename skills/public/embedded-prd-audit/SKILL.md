---
name: embedded-prd-audit
description: Audit whether a linked PRD / embedded PRD output is a real document-demo delivery artifact with truthful structure, mapping, and stability labeling instead of a fake split-screen or weak side-by-side review page. Use when Codex needs to review embedded-PRD quality, linkage completeness, navigation truthfulness, or readiness for review/delivery.
---

# Embedded PRD Audit

Act as a command-style skill for checking whether an embedded PRD is structurally and semantically real.

## Core job

Review an embedded-PRD output, linked PRD page, or left-doc/right-demo delivery assembly and output a compact audit that:
- judges whether it qualifies as a real embedded PRD
- identifies missing structure layers
- identifies missing or weak mapping layers
- flags misleading stability/version issues
- recommends the next repair move before review or delivery

Use this skill to stop split-screen presentations from being mislabeled as embedded PRDs.

## Boundaries

This skill is responsible for:
- auditing structure truthfulness
- auditing linkage/mapping truthfulness
- checking stability labeling and version honesty
- judging whether the artifact is review-grade or delivery-grade

This skill is not responsible for:
- rebuilding the entire embedded PRD by itself
- regenerating the underlying demo
- settling unresolved business rules upstream
- doing project-ops version actions directly

If the artifact fails because its baseline is unstable rather than because the embedded structure is bad, say so clearly and point back to freeze/readiness work.

## Inputs

Work from whatever current artifact evidence exists, such as:
- embedded-prd HTML / markdown / spec
- left-pane document structure
- right-pane demo structure
- mapping manifest or linkage notes
- version/stage labels
- stability labels for stable/unfrozen/doc-only/demo-validation-only items

Do not require every implementation detail before auditing. Audit the truthfulness of what is present.

## What qualifies as a real embedded PRD

A real embedded PRD should support three jobs together:
- explain the business/document logic
- show the corresponding demo expression
- let the user move between both sides meaningfully

If the artifact only places a document next to a demo with weak or fake linkage, do not call it a true embedded PRD.

## Working flow

### 1) Judge the artifact type honestly

Choose the most honest description:
- not an embedded PRD
- linked review page only
- partial embedded PRD
- review-grade embedded PRD
- delivery-grade embedded PRD

Do not over-credit the artifact just because it has two panes.

### 2) Audit structure layers

Check for these major layers:
- delivery header
- left document pane
- right demo pane
- mapping/navigation layer
- status/version layer

For each layer, judge whether it is:
- present and meaningful
- present but weak
- missing

### 3) Audit document structure quality

Check whether the left pane is organized into meaningful groups such as:
- background / purpose
- scope
- key rules
- state logic
- config-driven effects
- special scenarios
- unfrozen items

Flag problems like:
- giant rule dump
- page-first-only organization
- unstable items hidden or scattered
- document sections too coarse or too fragmented

### 4) Audit demo-side quality

Check whether the right pane supports inspection instead of just passive viewing.

Look for:
- page switching where relevant
- state switching where relevant
- visible focus/highlight behavior
- enough context to understand what the linked doc block refers to
- scope discipline instead of demo overload

### 5) Audit linkage/mapping truthfulness

Check whether meaningful mappings exist across the key layers:
- document block → page
- document block → state
- document block → config effect when relevant
- page/module → rule
- state → business outcome
- demo region → document block

Judge whether mapping is:
- truthful and useful
- too coarse
- too fragmented
- mostly absent
- fake precision

### 6) Audit stability and version honesty

Check whether the artifact clearly tells the truth about:
- version tag
- stage label
- stable vs unfrozen items
- doc-only items
- demo-validation-only items
- whether doc/demo/mapping belong to the same effective round

If instability exists but is not visibly labeled, treat that as a serious problem.

### 7) Judge review/delivery suitability

Output one of:
- not suitable for embedded-PRD review
- suitable only as linked review page
- suitable for review-grade embedded PRD
- suitable for delivery-grade embedded PRD

This judgment should reflect both structure and truthfulness.

## Output format

Prefer this compact structure:

```md
## Embedded PRD audit
- Artifact type:
- Structure layers:
- Document structure issues:
- Demo-side issues:
- Mapping quality:
- Stability/version honesty:
- Review/delivery suitability:
- Critical issues:
- Important issues:
- Recommended next move:
```

Keep it compact, but do not omit:
- artifact type
- mapping quality
- suitability judgment
- recommended next move

## Decision heuristics

Use these tests when the case is borderline.

### Test 1: Split-screen test
Ask:
- If I remove the links/highlights/mappings, does this artifact lose its core value?

If no, it may just be split-screen, not a real embedded PRD.

### Test 2: Why-behaves-this-way test
Ask:
- Can a reviewer move from a visible page/module/state to the rule that explains why it behaves that way?

If no, linkage is too weak.

### Test 3: Same-round test
Ask:
- Are the document, demo, and mapping clearly from the same effective round?

If no, do not approve stronger suitability.

### Test 4: Instability-honesty test
Ask:
- Would a reviewer mistake exploratory or unfrozen content for stable delivery truth?

If yes, downgrade suitability.

## Typical failure patterns

Watch for these recurring problems:
- left doc + right iframe with no meaningful navigation
- page-only linkage with no state/config layer
- lots of links but no reverse mapping from demo to doc
- version tag exists, but linked contents are not from the same round
- unstable sections look identical to stable sections
- everything is mapped at one giant section level, so nothing is actually inspectable
- every tiny sentence is mapped, making the page noisy and unusable

## Anti-patterns

Avoid these mistakes:
- calling any side-by-side page an embedded PRD
- equating demo availability with linkage quality
- praising dense anchors while ignoring semantic weakness
- treating doc-only or demo-validation-only items as hidden details rather than explicitly labeled categories
- approving delivery-grade quality when the artifact is only review-grade at best

## References to load when needed

Read these only when useful:
- `../pm-embedded-prd/references/embedded-prd-structure.md` for the intended top-level structure
- `../pm-embedded-prd/references/linkage-mapping-spec.md` for mapping layers, granularity, and labeling expectations
- `../freeze-readiness-check/SKILL.md` when the failure is mainly a freeze/baseline truthfulness problem rather than a structure problem

## Handoff expectations

When the artifact is not a true embedded PRD:
- say the most honest lower label, such as linked review page or partial embedded PRD
- point to the missing structure or linkage layer first

When the artifact is review-grade but not delivery-grade:
- say what still prevents stronger approval
- emphasize stability/version labeling or same-round coherence if those are the issue
