# Requirement Types

Use this reference when `pm-requirement-intake` needs to classify a requirement, decide which dimensions matter most, and avoid treating every requirement as the same kind of problem.

The purpose is not to build a perfect taxonomy. The purpose is to improve question quality, completeness judgment, and downstream handoff.

---

## Core idea

One requirement can belong to multiple types.

Do not force a single label when the requirement clearly combines multiple concerns.

The main practical question is:
- what kinds of logic will this requirement force us to reason about?

That is more useful than asking only:
- what page are we building?

---

## Primary vs secondary types

### Primary type
The type that best explains the hardest part of the requirement.

### Secondary types
Other types that materially affect completeness, but are not the central difficulty.

Example:
- VIP requirement
  - primary: membership / entitlement / eligibility
  - secondary: backend configuration affecting frontend
  - secondary: strategy / rule judgment
  - secondary: payment / purchase / renewal

---

## Type catalogue

### 1) Membership / entitlement / eligibility

Use when the requirement revolves around:
- user qualifications
- entitlement packages
- membership cards/tiers
- activation / delay / suspension / resume
- overlapping or conflicting rights

Typical signals:
- "already has X, now buys Y"
- "who is active now"
- "what happens after expiry"
- "can these coexist"

Typical risk:
- the page may look simple, but the rule system is actually the hard part

---

### 2) Backend configuration affecting frontend

Use when backend-configured values materially change frontend behavior or display.

Typical signals:
- admin sets tags / weights / switches / visibility rules / mappings
- frontend should show different states based on config
- stock users and future users may be affected differently

Typical risk:
- teams document only the page and forget the config-driven cause

---

### 3) Flow redesign / journey optimization

Use when the requirement is mainly about:
- start/end flow
- node transitions
- interruption / re-entry / retry
- multi-entry or multi-branch paths

Typical signals:
- "what happens after step 2"
- "user may quit midway"
- "there are several entry points"

Typical risk:
- only the happy path gets designed

---

### 4) Payment / purchase / renewal

Use when the requirement is mainly about transaction flow.

Typical signals:
- purchase qualification
- repeat purchase rules
- pay / success / failure / cancel / refund
- purchase result changes entitlement or account state

Typical risk:
- transaction state and entitlement state get mixed or left disconnected

---

### 5) Page redesign / page addition / page structure optimization

Use when the main problem is page-level information and interaction expression.

Typical signals:
- add a new page
- redesign an existing page
- rework hierarchy and layout
- optimize readability and action flow

Typical risk:
- teams treat it as only UI polish, while page role and state logic are actually changing

---

### 6) Login / binding / account system

Use when the requirement touches:
- identity
- login methods
- account relationships
- binding/unbinding/rebinding
- permission changes caused by identity changes

Typical risk:
- normal login flow gets all attention, but exceptions and historical-user compatibility break

---

### 7) Data display / metrics / reporting definition

Use when the hard part is not visual layout, but metric meaning and display correctness.

Typical signals:
- metric definition
- calculation/reporting definition
- update frequency
- permission-based visibility
- empty / delayed / abnormal data handling

Typical risk:
- page gets drawn quickly, but nobody agrees on what the number means

---

### 8) Strategy / permission / rule judgment

Use when the core problem is decision logic.

Typical signals:
- multi-condition judgment
- priority/conflict handling
- default rule
- rule hit results
- role/permission gating

Typical risk:
- examples keep growing, but no stable rule model is formed

---

### 9) Batch operation / sync / migration

Use when scale, coverage, rollback, and consistency matter.

Typical signals:
- batch actions
- sync jobs
- migration operations
- partial success/failure
- overwrite rules

Typical risk:
- flow gets described, but operational consequences are ignored

---

### 10) Form / submission / approval

Use when the requirement centers on:
- fields and validation
- role differences
- draft / submit / reject / revoke
- approval state transitions

Typical risk:
- fields are documented, but submission/approval lifecycle is incomplete

---

## How to classify quickly

Ask these quick questions:

1. What is the hardest thing here: rules, flow, page expression, transaction, config, or data meaning?
2. If this requirement fails, what kind of failure is most likely?
   - wrong state?
   - wrong rule?
   - wrong page hierarchy?
   - wrong transaction handling?
   - wrong config effect?
3. What kind of downstream artifact will be hardest to get right: PRD wording, demo states, or versioned delivery structure?

The answers usually reveal the primary type.

---

## Typical multi-label combinations

### Membership + config + strategy
Common in entitlement-heavy PM work.

### Flow + page redesign
Common when a process change also requires UI restructuring.

### Payment + membership
Common when purchase changes user qualification or entitlement state.

### Strategy + config
Common when backend-admin logic changes frontend results.

### Form + approval + permission
Common in B-end or operational workflows.

---

## Classification anti-patterns

Avoid these mistakes:

### 1) Page-only classification
A requirement is labeled as page redesign even though the hard part is rule logic.

### 2) Single-label simplification
A multi-type requirement is forced into one category, causing missing questions later.

### 3) Surface-first classification
The visible page is treated as the main type, while the real business difficulty is ignored.

### 4) Tool-shaped thinking
The team classifies based on the artifact they want to produce rather than the logic they need to solve.

---

## Minimum output recommendation

After classification, `pm-requirement-intake` should at least output:
- primary type
- secondary types
- 1-2 sentence reason for the classification
- which type is most likely to create hidden risk

This is enough to improve question quality and downstream handoff.
