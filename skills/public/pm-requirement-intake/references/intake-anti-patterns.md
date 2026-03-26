# Intake Anti-Patterns

Use this reference when `pm-requirement-intake` needs to avoid common failure modes in requirement intake, readiness judgment, and downstream handoff preparation.

The goal is to stop requirement intake from becoming either shallow collection or bloated pseudo-clarity.

---

## Core idea

A bad intake is not only one that gathers too little.
A bad intake may also gather a lot of discussion while still failing to produce a trustworthy baseline.

---

## Anti-pattern 1: Discussion volume mistaken for clarity

What it looks like:
- many scenarios were discussed
- lots of chat exists
- but no stable rule/model summary is formed

Why it is bad:
- downstream work gets a pile of examples instead of a requirement baseline

Better move:
- compress discussion into stable principles, confirmed items, pending items, and explicit assumptions

---

## Anti-pattern 2: Questionnaire dumping

What it looks like:
- the intake asks too many questions at once
- many questions are low-value for the current round

Why it is bad:
- it slows clarification without increasing real readiness

Better move:
- ask only the highest-leverage missing questions for the current downstream goal

---

## Anti-pattern 3: Page-first misunderstanding

What it looks like:
- the requirement is treated mainly as a page or layout task
- but the real difficulty is rule logic, state logic, trigger logic, or config effects

Why it is bad:
- the intake looks concrete while missing the true business difficulty

Better move:
- classify requirement type early
- identify whether the real difficulty is rules, flow, config, eligibility, payment, data meaning, or page expression

---

## Anti-pattern 4: Missing scope boundaries

What it looks like:
- there is lots of content
- but no clear in-scope / out-of-scope boundary

Why it is bad:
- downstream demo or PRD work silently expands

Better move:
- mark what this round includes, excludes, and defers

---

## Anti-pattern 5: Hidden assumptions presented as confirmed truth

What it looks like:
- temporary assumptions are used to keep discussion moving
- but they are not labeled as assumptions

Why it is bad:
- downstream skills may treat guesses as stable baseline

Better move:
- label assumptions explicitly
- separate confirmed items from working assumptions

---

## Anti-pattern 6: Trigger blindness

What it looks like:
- purchase or main action logic is discussed
- but expiry, refund, rollback, retry, config publish, or scheduled recalculation are not classified

Why it is bad:
- the requirement may look stable until downstream work exposes major holes

Better move:
- identify key triggers early
- judge whether they reuse the main rule model or create separate branches

---

## Anti-pattern 7: State blindness

What it looks like:
- the requirement is described in broad feature terms
- but key states, outcomes, and transitions are not surfaced

Why it is bad:
- B later discovers the requirement is not really ready for demo truthfully

Better move:
- surface core states and outcomes before claiming stronger readiness

---

## Anti-pattern 8: Config/history effects ignored

What it looks like:
- the requirement is described only from the visible page perspective
- config-driven differences or historical-user effects are not checked

Why it is bad:
- downstream artifacts may express only the obvious path, not the true product behavior

Better move:
- explicitly ask whether config, history, stock users, or prior states change current behavior

---

## Anti-pattern 9: Premature readiness promotion

What it looks like:
- the requirement is pushed to demo or delivery stages mainly because people want to move on

Why it is bad:
- later demo/embedded-PRD work inherits unstable logic as if it were stable

Better move:
- use readiness gates honestly
- prefer a lower gate over false confidence

---

## Anti-pattern 10: Weak downstream handoff object

What it looks like:
- intake ends with a polished paragraph or vague summary
- but no structured handoff object exists for B/C/D

Why it is bad:
- downstream skills reconstruct the baseline from chat and drift begins

Better move:
- produce a structured handoff package with confirmed/pending/assumptions/unfrozen distinctions

---

## Quick self-check

Before declaring intake “good enough,” ask:
- Do we have a stable summary, not just lots of examples?
- Did we identify the real difficulty type?
- Are assumptions separated from confirmed truth?
- Are scope and major triggers visible?
- Is the handoff object strong enough for the next downstream skill?

If not, stay in intake a bit longer instead of pretending readiness.
