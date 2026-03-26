---
name: rule-change-signal
description: Classify whether an issue discovered during demo generation or iteration is only a presentation adjustment, a rule-expression supplement, or a real rule/scope/trigger change that should return upstream. Use when a product demo, prototype, or page iteration exposes possible business-logic drift and Codex needs to decide whether to stay in demo work, block freezing, or send the issue back to requirement intake.
---

# Rule Change Signal

Act as a command-style skill for deciding whether a demo-discovered issue is still a demo problem or has become a requirement-baseline problem.

## Core job

Take a mismatch discovered during demo generation, page iteration, prototype review, or state walkthrough and output a compact judgment that:
- classifies the issue correctly
- identifies the affected layer
- states whether upstream requirement work must be reopened
- states whether the current demo round can still freeze
- recommends the next move

Use this skill to prevent demo work from silently rewriting requirement logic.

## Boundaries

This skill is responsible for:
- classifying the signal
- locating the layer affected
- deciding whether to stay in demo work or return upstream
- judging whether the issue blocks freeze
- producing a compact, reusable signal output

This skill is not responsible for:
- redoing full requirement intake
- redesigning the whole demo
- writing the full embedded PRD
- resolving the final business decision by itself when the signal is genuinely disputed

If the issue is still ambiguous after classification, say what is uncertain and ask the smallest useful follow-up question.

## Inputs

Usually work from a compact issue description containing as many of these as are available:
- what was found wrong or mismatched
- where it was found (page / module / state / interaction path)
- current demo behavior
- expected behavior or newly suspected behavior
- whether the concern is about rule, state, scope, trigger, config effect, or only expression
- whether the current round was heading toward freeze

Do not demand a perfect template before classifying. Work with incomplete but useful evidence.

## Signal classes

Always classify into one of these three classes.

### 1) Presentation-layer adjustment

Use when:
- business meaning is unchanged
- only layout, emphasis, wording tone, component form, or visual hierarchy changes

Typical cases:
- move or restyle a button
- change copy tone
- swap tabs/cards without changing logic
- make an already-confirmed state more visible

Default handling:
- stay in demo work
- do not reopen requirement intake
- do not block freeze by itself

### 2) Rule-expression supplement

Use when:
- the underlying requirement is still the same
- but the current demo failed to express it completely or clearly

Typical cases:
- a needed state exists in logic but is missing in demo
- a known scenario was omitted from page/state coverage
- config-driven variation should be shown but was not visualized
- current demo understates an already-confirmed result or warning

Default handling:
- usually stay in demo work
- surface it explicitly so it is not mistaken for pure cosmetic polish
- block freeze only if the missing expression is important enough to mislead downstream work

### 3) Rule-logic / scope / trigger change

Use when:
- the discovered issue changes the requirement baseline itself
- continuing demo iteration without upstream correction would create false alignment

Typical cases:
- main rule changes
- priority/conflict handling changes
- trigger reuse vs separate-branch logic changes
- scope boundary changes
- included/excluded scenario set changes
- config meaning changes rather than only its page expression

Default handling:
- send upstream
- usually return to requirement intake
- normally block freeze for the current downstream baseline

## Working flow

### 1) Restate the mismatch briefly
Compress the issue into one plain-language sentence.

Example:
- "The current pending-state demo implies delayed activation, but the latest scenario review suggests this case should actually be parallel-active."

### 2) Locate where it surfaced
Identify the smallest useful location:
- page
- module
- state
- interaction path
- config-driven branch

### 3) Judge the affected layer
Use one or more of:
- page presentation
- state definition
- core rule
- priority/conflict handling
- special-trigger handling
- requirement scope
- config-to-frontend mapping

### 4) Classify the signal
Choose exactly one primary class:
- presentation-layer adjustment
- rule-expression supplement
- rule-logic / scope / trigger change

If the case straddles categories, choose the highest-impact class and explain the ambiguity briefly.

### 5) Judge freeze impact
Output one of:
- does not block freeze
- may block freeze depending on severity
- blocks freeze

Default heuristics:
- Class 1 usually does not block freeze
- Class 2 may block freeze if missing expression would distort review or downstream linkage
- Class 3 usually blocks freeze

### 6) Recommend the next move
Choose the smallest honest next step, such as:
- continue in demo work
- continue in demo work but mark as expanded expression
- reopen requirement intake
- hold current demo as exploratory only
- regenerate downstream handoff after upstream confirmation

## Output format

Prefer this compact structure:

```md
## Rule-change signal
- Discovery:
- Found in:
- Affected layer:
- Signal class:
- Freeze impact:
- Recommended next move:
- Short reason:
```

Keep it concise, but never omit:
- signal class
- freeze impact
- next move

## Decision heuristics

Use these tests when the case is borderline.

### Test 1: Meaning vs appearance
Ask:
- Is this changing what the feature means, or only how it looks?

If it changes meaning, escalate.

### Test 2: Requirement wording test
Ask:
- If the current requirement wording stayed unchanged, would the updated demo still be truthful?

If no, escalate.

### Test 3: Freeze truthfulness test
Ask:
- If this demo froze today, would downstream embedded-PRD or review output misrepresent the current logic?

If yes, treat it as freeze-blocking or potentially freeze-blocking.

### Test 4: Stable-model test
Ask:
- Does this issue fit the current rule model, or does it force the rule model itself to change?

If it forces the model to change, escalate.

## Escalation defaults

### Usually stay in demo work
- visual hierarchy changes
- wording polish
- component swap without logic change
- stronger visibility of already-confirmed states
- richer but still faithful expression of existing config effects

### Usually send upstream
- changed default rule
- changed conflict priority
- changed trigger treatment
- changed scenario inclusion/exclusion
- changed config meaning
- changed formal baseline that PRD wording would need to describe

## Anti-patterns

Avoid these failures:
- silently rewriting requirements through demo iteration
- escalating every visual adjustment like a business crisis
- understating a real logic change as harmless page polish
- describing a mismatch without saying whether freeze should continue
- describing a mismatch without saying where it surfaced

## References to load when needed

Read these only when they are useful:
- `../pm-demo-design/references/rule-change-signal-template.md` for the fuller classification model and examples
- `../pm-requirement-intake/references/readiness-gates.md` when freeze/upstream-readiness judgment is intertwined with the signal

## Handoff expectations

When this skill outputs a Class 3 signal, downstream work should usually:
- avoid presenting the current demo branch as a stable baseline
- route the issue back to `pm-requirement-intake`
- revisit freeze decisions before handing work to `pm-embedded-prd` or `pm-project-ops`
