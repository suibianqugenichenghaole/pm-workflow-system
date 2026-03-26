# Design Context Template

Use this reference when `pm-demo-design` needs the minimum design context required to generate demos that feel like the target product instead of generic AI output.

This is not a decorative questionnaire. It is a practical context template used to reduce wrong-style demos, repeated clarification, and avoidable redesign.

---

## Core idea

A good demo is not only shaped by requirement logic. It is also shaped by:
- platform
- target users
- age/cognitive level
- product tone
- existing design language
- common components and interaction habits
- explicit style references and style bans

Without this context, even logically correct demos can still be wrong for the actual product.

---

## Use strategy

Do not dump the full template every time.
Use it progressively:
1. absorb what is already known from requirement intake and current assets
2. identify the highest-impact missing design context
3. ask only for the missing parts that materially affect this round of demo generation
4. reuse stored project-level design context when available

---

## Template

### 1) Platform and product surface

Minimum fields:
- product surface: app / H5 / mini-program / web / backend / tablet / other
- business side: B-end / C-end / mixed
- primary device context: phone / tablet / desktop / mixed
- usage environment: at home / on the go / classroom / office / store / etc.

Questions this answers:
- how dense should the interface be?
- how large should tap targets and controls feel?
- should the structure feel lightweight, operational, playful, or information-heavy?

---

### 2) User profile

Minimum fields:
- primary user
- secondary user (if meaningful)
- user age range
- reading/comprehension level
- digital fluency level
- patience / urgency / tolerance for complexity

Examples:
- young children → stronger visual guidance, larger affordances, lower density
- parents/teachers → higher information density, stronger explanation and reassurance
- B-end operators → efficiency, dense lists, fast scanning, lower ornamentation

Questions this answers:
- how explicit should guidance be?
- how much text can the page carry?
- how much visual playfulness is appropriate?

---

### 3) Product tone / style direction

Minimum fields:
- desired overall tone: educational / playful / business / efficient / warm / serious / premium / tool-like / lively / etc.
- emotional feel: reassuring / energetic / calm / trustworthy / fun / strict / soft / etc.
- visual energy level: low / medium / high
- style drift allowed or not: conservative / moderate / bold

Questions this answers:
- should the demo feel steady or expressive?
- should it inherit existing tone closely or can it push further?
- should it feel child-friendly, parent-friendly, operator-friendly, or mixed?

---

### 4) Existing design language

Minimum fields:
- existing product already online? yes / no
- if yes, what should remain recognizable?
- navigation pattern: tab bar / top nav / side nav / step flow / mixed
- information density: low / medium / high
- page rhythm: blocky / list-heavy / card-heavy / mixed
- typography tone: playful / neutral / formal / compact / large-friendly

Capture at least:
- what a user should still recognize as "the same product"
- what must not suddenly change in layout logic or navigation behavior

Questions this answers:
- is this a fresh concept demo or an incremental in-product demo?
- how far can the new page drift from the current product language?

---

### 5) Common components and interaction habits

Minimum fields:
- common components used today
- components that must be reused
- components that should be avoided
- standard interaction habits users already learned
- elements that are platform/system conventions vs product conventions

Typical items to capture:
- cards
- tabs
- segmented controls
- popups/dialogs
- bottom sheets
- lists
- empty states
- badges/tags
- filter bars
- step indicators

Questions this answers:
- should the demo invent new interaction patterns or reuse established ones?
- what can be changed safely without making the product feel unfamiliar?

---

### 6) Style references and anti-references

Minimum fields:
- products or pages to reference
- styles to avoid
- previous prototype or screenshot references
- explicit likes/dislikes if the user has them

Useful forms:
- "closer to X than Y"
- "keep current structure, but make it more lively"
- "do not make it look like a dashboard"
- "avoid childishly exaggerated visuals even though the audience is young"

Questions this answers:
- what should the demo move toward?
- what obvious wrong directions should be blocked early?

---

### 7) Rule/display-sensitive design context

This section is critical for PM demos that are driven by business logic.

Capture if relevant:
- which states must be especially visible to users
- which status/result needs stronger explanation
- whether tags, badges, or state labels are business-critical
- whether certain config-driven differences must be visible in the demo
- whether some logic should stay document-only instead of being visualized

Questions this answers:
- what absolutely cannot be hidden behind generic UI treatment?
- what must be visually explicit because it carries business meaning?

---

## Minimum viable context by scenario

### Scenario A: Quick logic-validation demo
Minimum usually needed:
- platform/surface
- primary user + age/cognitive level
- existing design language
- common components

### Scenario B: More product-like demo for discussion or review
Minimum usually needed:
- everything in Scenario A
- product tone/style direction
- style references and anti-references

### Scenario C: Demo intended for showcase / sharing / repo examples
Minimum usually needed:
- everything in Scenario B
- stronger style references
- stronger anti-references
- clarity on how bold the visual expression may be

---

## Project-level context recommendation

If the same product is discussed repeatedly, do not restate this context every time by hand.

Recommended approach:
- store reusable design context at project level
- keep it in a file that downstream demo work can reuse
- only ask for deltas when the current request deviates from the stored context

This is especially useful for:
- long-running app projects
- products with a stable design language
- repeated work on the same user group
- teams that already know the common component vocabulary

---

## Anti-patterns

Avoid these failures:

### 1) Generic-product syndrome
The demo is logically fine but visually feels like a random startup template.

### 2) Age/context mismatch
The product is for children, parents, or operators, but the demo ignores their cognitive or behavioral reality.

### 3) New-product hallucination
The actual task is incremental design in an existing product, but the demo behaves like a brand new product.

### 4) Style-over-logic drift
The demo chases a reference style and loses business-state clarity.

### 5) Design-context over-questioning
The skill asks for every possible style detail before even generating a validation demo.

### 6) Reference without constraint
The demo copies the vibe of a reference product but ignores the real platform, user, and component constraints.

---

## Recommended output usage

When enough design context is gathered, `pm-demo-design` should briefly restate the active design context before generating the next round, for example:
- platform/surface
- primary users and age/cognitive profile
- product tone
- existing design-language constraints
- key style references/anti-references

This helps the user catch mismatches early without rereading the whole template.
