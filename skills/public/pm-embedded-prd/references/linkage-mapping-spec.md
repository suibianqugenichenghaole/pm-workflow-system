# Linkage Mapping Spec

Use this reference when `pm-embedded-prd` needs to turn a rule baseline and demo baseline into a real linked delivery experience instead of a loose document plus iframe.

The goal is to make relationships between documentation and demo explicit, navigable, and reviewable.

---

## Core idea

A true embedded PRD is not:
- a document with a demo link
- a document with a passive iframe
- a page preview sitting next to text with no semantic relationship

A true embedded PRD must encode mappings between:
- document blocks
- pages
- modules
- states
- business rules
- config effects
- demo regions or demo states

If those mappings are missing, the output is at best a side-by-side review page, not an embedded PRD.

---

## Required mapping layers

At minimum, define these mapping layers.

### 1) Document block → Page

Each major document block should know which page it mainly refers to.

Examples:
- "会员中心展示规则" → `member-center`
- "购买前提示逻辑" → `purchase-dialog`
- "支付成功后状态" → `purchase-result`

Purpose:
- clicking a doc block can switch or focus the correct demo page
- readers know where a rule mainly lands

---

### 2) Document block → State

A document block should point not only to a page, but to the relevant state where possible.

Examples:
- "待生效状态" → `member-center:pending`
- "暂停恢复状态" → `member-center:paused`
- "购买后立即生效" → `purchase-result:active`

Purpose:
- the demo can jump to the right state instead of only the right page
- state logic stops being flattened into generic page-level linkage

---

### 3) Document block → Config effect

When backend config changes frontend expression, document blocks should point to config effects as first-class mapping targets.

Examples:
- "标签排序权重影响展示顺序" → `config:tag-sort-weight` → `member-center:tag-order`
- "互斥规则影响购买后状态" → `config:mutual-exclusion` → `purchase-result:pending-or-paused`

Purpose:
- embedded PRD should not only explain pages, but also why pages behave that way under config
- prevents page-only linkage that ignores backend-driven logic

---

### 4) Page / Module → Rule

Each key page or module should know which business rule(s) it is expressing.

Examples:
- `member-center/tag-list` → `rule:display-all-entitlements`
- `purchase-dialog/tip-area` → `rule:pre-purchase-warning`
- `member-center/frozen-badge` → `rule:paused-and-resume`

Purpose:
- clicking the demo can highlight the matching doc block
- reviewers can ask "this widget exists because of which rule?" and get a clear answer

---

### 5) State → Business outcome

A displayed state should always map to a meaningful business outcome.

Examples:
- `pending` → "not active yet, will activate later"
- `paused` → "currently suspended, may resume later"
- `active-parallel` → "currently active together with another entitlement"

Purpose:
- state names do not remain visual labels only
- document wording and visual state meaning stay aligned

---

### 6) Demo region → Document block

Interactive or visible demo regions should map back to one or more document blocks.

Examples:
- clicking the entitlement tag area highlights the documentation block about display rules
- selecting a state tab highlights the corresponding state logic block
- clicking a purchase result card highlights the rule/result explanation block

Purpose:
- the right side is not passive; it becomes an entry point into the doc

---

## Mapping granularity rules

Choose the smallest meaningful mapping unit, but do not force everything to the same level.

### Good granularity
- page-level for broad sections
- module-level for feature rules
- state-level for state logic
- config-effect-level for backend-driven behavior

### Poor granularity
- one whole document maps to one whole demo
- one whole page maps to many unrelated rules without structure
- one rule maps to a full page when only one small module expresses it

Rule of thumb:
- if the reviewer cannot tell what exactly is being highlighted or explained, the mapping is too coarse
- if the mapping is so tiny that every line of text becomes its own target, it is too fragmented

---

## Mapping categories to mark explicitly

Not every item is a perfect bidirectional mapping. Mark these categories clearly.

### 1) Fully linked item
- rule has document explanation
- rule has visible demo expression
- both sides can navigate to each other

### 2) Doc-only item
- rule is important enough to document
- but not represented in demo this round

Examples:
- historical snapshot rules
- backend-only safeguards
- rare fallback logic not visualized this round

### 3) Demo-validation-only item
- shown in demo to validate interaction or logic
- not yet treated as formal delivery wording

Examples:
- exploratory interaction pattern
- placeholder state visualization
- temporary arrangement used for discussion

### 4) Unfrozen linked item
- mapping exists, but the underlying rule or demo state is not yet frozen
- must be visibly marked as unstable

---

## Required identifiers

To keep linkage manageable, use stable identifiers for the main mapping units.

Suggested ID families:
- `doc:` for document blocks
- `page:` for pages
- `module:` for modules
- `state:` for states
- `rule:` for business rules
- `config:` for config effects
- `demo:` for demo page or area targets

Examples:
- `doc:member-center-display-rules`
- `page:member-center`
- `module:member-center/tag-list`
- `state:member-center/pending`
- `rule:display-all-entitlements`
- `config:tag-sort-weight`
- `demo:member-center/tag-list`

The exact naming can vary, but it must be stable within a project version.

---

## Recommended data model

At minimum, a mapping record should be able to express:
- source block
- target page/demo area
- optional state
- optional rule
- optional config effect
- mapping type
- stability label

Example shape:

```json
{
  "docId": "doc:member-center-display-rules",
  "pageId": "page:member-center",
  "moduleId": "module:member-center/tag-list",
  "stateId": "state:member-center/active",
  "ruleId": "rule:display-all-entitlements",
  "configId": "config:tag-sort-weight",
  "mappingType": "full-link",
  "stability": "stable"
}
```

Use lighter records when needed, but do not drop the relationship semantics.

---

## Navigation behavior rules

### Left → Right

When a user clicks a doc block, the system should preferably:
1. switch to the correct demo page if needed
2. switch to the correct state if needed
3. focus or highlight the relevant module/region
4. preserve visual context so the user understands what changed

### Right → Left

When a user clicks a demo region or selects a state, the system should preferably:
1. highlight the corresponding document block
2. scroll the document pane if needed
3. show if the target is stable, unfrozen, or demo-validation-only

### If no exact target exists

Do not fake precision.
Instead:
- fall back to the nearest page or section
- mark it as page-level or doc-only
- make the lack of fine-grained mapping visible

---

## Stability labeling rules

Every meaningful mapping should carry one of these labels:
- `stable`
- `unfrozen`
- `doc-only`
- `demo-validation-only`

This is critical because embedded PRD can otherwise create false confidence.

### Stable
Rule and demo expression are part of the current delivery baseline.

### Unfrozen
Rule or demo expression is still under discussion.

### Doc-only
Rule matters to delivery, but is not shown in demo this round.

### Demo-validation-only
Shown in demo for validation, not yet formalized as delivery wording.

---

## Anti-patterns

Avoid these mapping failures:

### 1) Fake linkage
A doc block merely links to a full page with no state/module precision.

### 2) Page-only linkage
Everything points only to pages; state and config logic disappear.

### 3) Broken reverse mapping
Users can click left to right, but cannot infer right to left.

### 4) Unlabeled instability
Mappings exist, but unstable items look identical to stable ones.

### 5) Config blindness
Backend-driven effects are described in docs but never enter the mapping model.

### 6) Over-fragmentation
Every sentence is mapped separately, making navigation noisy and unusable.

### 7) Under-fragmentation
One huge section maps to one huge page, conveying almost nothing.

---

## Minimum viable embedded PRD mapping

If the team is just starting, the smallest acceptable linked setup is:
- major doc section → page
- major state rule → page + state
- major config effect → config effect note + page/state
- major demo region → doc block reverse highlight
- every mapping visibly labeled as stable/unfrozen/doc-only/demo-validation-only

If you cannot meet even this minimum, the output should be described as a linked review page, not a true embedded PRD.
