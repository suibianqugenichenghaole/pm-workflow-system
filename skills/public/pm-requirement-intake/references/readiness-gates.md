# Readiness Gates

Use this reference when `pm-requirement-intake` needs to decide whether a requirement is only ready for a structure draft, already ready for demo work, or stable enough for embedded-PRD delivery.

This file is not a replacement for judgment. It is a gate reference to reduce false confidence and make handoff decisions more consistent.

## Core idea

A requirement is not "ready" just because:
- many cases were discussed
- a page idea already exists
- a demo was already drawn once
- the user can explain the feature fluently

A requirement is only ready for a given stage when the information quality matches that stage.

Use the three gates below.

---

## Gate 1 — Ready for structure draft

Use this gate when the requirement can be organized into a clear structure, but should not yet pretend to support stable demo or embedded-PRD delivery.

### Minimum conditions
- business goal is broadly clear
- current state is broadly clear
- impacted scope is broadly clear
- primary requirement type is identified
- key problem areas are identified
- user roles or affected audiences are at least directionally clear

### Typical outputs allowed
- requirement skeleton
- scope framing
- page/module rough list
- rough flow outline
- known risks and unknowns

### Typical outputs not yet justified
- state-rich demo
- confident rule-driven interaction design
- embedded-PRD delivery shell
- formal PRD wording that sounds final

### Typical signs this gate is appropriate
- user knows the problem, but not the final shape
- requirement logic still has obvious blank areas
- many details would still be assumption-heavy
- there is enough to structure, but not enough to freeze

### Typical blockers beyond this gate
- no stable main rule direction
- important state transitions still unclear
- config/history effects still unknown
- special triggers not even identified

---

## Gate 2 — Ready for demo draft

Use this gate when the requirement is mature enough to justify demo generation for validation, but not yet mature enough to be treated as a final delivery baseline automatically.

### Minimum conditions
- key pages/modules/states are clear enough to represent
- there is at least one restatable main rule direction
- major special scenarios are identified
- config/history impact is initially clear
- scope for the current demo round is clear enough
- unknowns are known and can be explicitly marked

### Typical outputs allowed
- demo draft
- stateful page draft
- clickable validation prototype
- iteration-ready demo code
- design-context-driven demo exploration

### Typical outputs not yet justified
- formal final PRD tone for unstable areas
- embedded-PRD output that implies full delivery readiness
- frozen baseline if major rule-change signals are still open

### Typical signs this gate is appropriate
- there is enough to validate through pages and interactions
- demo work is more likely to reveal missing logic than to fabricate it
- unstable items can be isolated and marked
- user can benefit from seeing the logic embodied in pages

### Typical blockers beyond this gate
- no stable expression of main rules
- major states still missing
- rule priority/conflict handling still floating
- demo would mostly be guesswork disguised as progress

---

## Gate 3 — Ready for embedded-PRD delivery

Use this gate only when the requirement is stable enough that rules, states, and demo baseline can be assembled into a linked delivery artifact without constant reinterpretation.

### Minimum conditions
- goal and scope are closed enough for this round
- core rules are closed enough for delivery wording
- states and outcomes are closed enough for delivery wording
- config/data/history logic is closed enough for delivery wording
- major special triggers and conflict handling are closed enough
- the rule model has converged into a stable restatable model
- current demo baseline is stable enough to freeze for delivery composition
- stable items and unfrozen items can be separated cleanly

### Typical outputs allowed
- embedded PRD HTML shell
- linked PRD + demo package
- rule/state/page/config mapping manifests
- review-ready or delivery-ready linked documentation

### Typical signs this gate is appropriate
- rule logic can be summarized as a stable model, not a case pile
- if someone asks "why does this page behave this way?", the answer exists in the current baseline
- if someone asks "which version is current?", the answer is clear
- demo and PRD can reference the same effective round

### Typical blockers beyond this gate
- rule changes are still surfacing every demo round
- special triggers still force re-interpretation of the baseline
- demo and rules are not aligned by version
- important items are still unresolved but not clearly marked as unfrozen

---

## Rule-model convergence test

Use this test before promoting a requirement toward embedded-PRD delivery.

A rule model is considered converged enough when:
- it can be restated in 2-5 stable principles
- key correction points are already fixed
- new cases usually fit the existing model instead of forcing a new branch each time
- major conflict/priority logic is already explicit

A rule model is not converged enough when:
- every new case adds another special rule
- the current explanation is mostly examples, not a model
- similar scenarios are still answered differently in different rounds
- nobody can say what the actual default rule is

---

## Special-trigger check

Before upgrading readiness, check whether the requirement has identified and classified trigger-driven changes such as:
- expiry
- refund
- cancel/revoke
- config publish
- scheduled recalculation
- re-entry / retry / rollback

The key question is not just "do these triggers exist?" but:
- do they reuse the main logic?
- or do they introduce separate rule branches?

If that answer is still unclear, avoid over-promoting readiness.

---

## Upstream return rules

Use these rules when downstream demo work sends feedback back to `pm-requirement-intake`.

### Usually do NOT require re-opening intake
- layout adjustments
- visual hierarchy changes
- lighter copy tuning
- stronger page expression under already-confirmed rules
- additional state representation that does not change business logic

### Usually DO require re-opening intake
- main rule changes
- priority/conflict handling changes
- special-trigger handling changes
- scope boundary changes
- newly included or removed scenarios that alter the requirement baseline
- changes that convert an old assumption into a formal new rule

---

## Anti-false-readiness checklist

Before declaring a requirement ready for the next stage, quickly ask:

- Are we promoting this because the information is truly stable, or because we are impatient to move on?
- Are we mistaking a finished-looking demo for a finished requirement?
- Are we mistaking many examples for a stable model?
- Are we ignoring config/history/trigger effects because they are annoying?
- If this became a delivery artifact today, what would still likely be challenged tomorrow?

If the honest answer reveals unstable logic, stay at the lower gate and mark the gaps explicitly.
