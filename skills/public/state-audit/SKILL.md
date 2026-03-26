---
name: state-audit
description: Audit whether a demo, page plan, flow draft, or prototype sufficiently covers the states that matter, and identify likely missing, weak, or misleading states before downstream freeze or delivery. Use when Codex needs to check happy-path bias, missing outcomes, missing exceptional states, or weak state expression in product demo work.
---

# State Audit

Act as a command-style skill for checking whether demo or page work has enough state coverage to be trustworthy.

## Core job

Review a page plan, demo draft, prototype, or flow description and output a compact state audit that:
- lists clearly covered states
- identifies likely missing states
- highlights high-risk state gaps
- distinguishes business-critical gaps from minor polish gaps
- recommends what to add before freeze or downstream delivery

Use this skill to stop product demo work from looking complete while hiding state incompleteness.

## Boundaries

This skill is responsible for:
- auditing state coverage
- spotting likely missing state classes
- prioritizing state gaps
- judging whether missing states are freeze-risk or only quality debt

This skill is not responsible for:
- fully redesigning the demo
- redoing requirement intake from scratch
- deciding final business truth for disputed rules
- replacing dedicated rule-change classification when the issue is really about changed business logic

If a suspected missing state actually points to a changed rule baseline, say so and recommend routing through `rule-change-signal`.

## Inputs

Work from whatever is available, such as:
- page/module description
- current state list
- flow description
- demo screenshots / code / prototype notes
- requirement skeleton or rule summary
- known triggers and outcomes
- claimed freeze intent, if any

Do not require a full spec before auditing. Use the evidence available.

## What counts as a state

Treat a state as a meaningfully different condition that changes what the user sees, can do, or should understand.

State may come from:
- business status
- process step
- eligibility result
- transaction result
- config-driven variation
- loading / empty / error / unavailable condition
- permission or role difference
- historical vs current condition

Do not reduce state only to visual UI modes.

## Working flow

### 1) Identify the audit object

First say what is being audited:
- one page
- one module
- one flow segment
- one multi-page demo round

Then say what level of completeness is expected:
- rough validation coverage
- review-ready coverage
- freeze-ready coverage

### 2) Extract the obvious covered states

List states that are already explicitly represented or clearly implied.

Examples:
- active
- pending
- paused
- expired
- success
- failed
- empty
- permission denied

Do not pretend coverage exists if it is only vaguely hinted.

### 3) Scan for likely missing state classes

Always scan across these classes when relevant:

#### A. Default and basic UI states
- default
- loading
- empty
- error
- disabled
- unavailable

#### B. Business result states
- success
- failed
- pending
- partially completed
- expired
- paused
- cancelled
- refunded

#### C. Transition and timing states
- before action
- during action
- after action
- delayed effect
- waiting / processing
- retry / re-entry

#### D. Role / permission states
- different role visibility
- gated actions
- permission denied
- limited access

#### E. Config / strategy-driven states
- same page behaves differently under different config
- different labels, tags, warnings, or actions due to config or rule results

#### F. Historical / compatibility states
- historical data behavior
- stock-user vs new-user behavior
- legacy path vs current path

### 4) Judge importance of the gaps

Classify each likely gap as:
- critical gap
- important gap
- optional gap

#### Critical gap
Without it, the page/demo misrepresents the product logic or would mislead freeze/delivery.

#### Important gap
Not fatal to understanding, but likely to create review friction, rework, or hidden ambiguity.

#### Optional gap
Nice to have for completeness, but not essential for the current stage.

### 5) Judge whether the gap is a state problem or a rule problem

Ask:
- is the state missing because the demo forgot to express it?
- or is the state missing because the underlying rule is not actually settled?

If the second case is more likely, say it is not only a state gap and recommend `rule-change-signal` or upstream clarification.

### 6) Judge freeze impact

Output one of:
- no meaningful freeze impact
- weak freeze risk
- strong freeze risk

Default heuristics:
- missing critical business states usually create strong freeze risk
- missing basic UI states may create weak or moderate risk depending on stage
- optional states usually do not block freeze by themselves

### 7) Recommend next move

Examples:
- add 2-3 missing core states before next review
- separate exploratory branch from baseline branch
- route suspected rule change through `rule-change-signal`
- acceptable for rough demo, but not for freeze

## Output format

Prefer this compact structure:

```md
## State audit
- Audit object:
- Completeness target:
- Clearly covered states:
- Likely missing states:
- Critical gaps:
- Important gaps:
- Optional gaps:
- Freeze impact:
- Recommended next move:
```

Be concise, but do not omit:
- clearly covered states
- likely missing states
- freeze impact
- next move

## Decision heuristics

Use these tests when unsure.

### Test 1: User-meaning test
Ask:
- If this state is absent, would the user misunderstand what is happening or what they can do?

If yes, treat it as higher priority.

### Test 2: Rule-truthfulness test
Ask:
- Does the current state set still tell the truth about the underlying business logic?

If no, treat the gap as high risk.

### Test 3: Trigger-path test
Ask:
- Have we covered what happens before, during, and after the key trigger or event?

If not, scan for transition states.

### Test 4: Special-case blindness test
Ask:
- Are we only covering the main path while hiding edge but meaningful paths like refund, expiry, retry, pause, or history compatibility?

If yes, increase scrutiny.

## Typical state gap patterns

Watch for these recurring failures:
- happy path exists, but failure/exception path missing
- active state exists, but pending/paused/expired state missing
- purchase success exists, but cancel/refund/retry missing
- current user path exists, but historical-user path missing
- config-default path exists, but alternative config effects missing
- one role is shown, but role-restricted visibility/action states are missing

## Anti-patterns

Avoid these mistakes:
- treating state audit like a pure UI checklist
- listing dozens of theoretical states with no prioritization
- mistaking unresolved rules for mere missing-state presentation
- assuming a polished screen means sufficient state coverage
- blocking freeze over trivial optional states while missing real business-critical ones

## References to load when needed

Read these only when useful:
- `../pm-demo-design/SKILL.md` for demo-generation expectations around pages, modules, states, and interactions
- `../pm-demo-design/references/design-context-template.md` when state expression needs to respect audience/product context
- `../pm-requirement-intake/references/readiness-gates.md` when state completeness affects freeze-stage judgment
- `../rule-change-signal/SKILL.md` when a missing state may actually reflect changed business logic

## Handoff expectations

When the audit finds mainly presentation-level omissions:
- keep the issue inside demo work

When the audit finds missing states that materially distort current logic:
- mark strong freeze risk
- recommend adding them before freeze or delivery

When the audit finds that the "missing state" is actually a rule dispute:
- route it toward `rule-change-signal` or upstream clarification instead of pretending it is only a state-list issue
