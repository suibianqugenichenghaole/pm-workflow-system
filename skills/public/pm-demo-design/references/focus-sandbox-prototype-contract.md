# Focus / Sandbox Prototype Contract

Use this reference when `pm-demo-design` produces demo/prototype output that may later be embedded, focused, or selectively displayed inside `pm-embedded-prd`.

The goal is not to force one frontend implementation. The goal is to define the minimum capability contract that makes focused embedded review possible.

---

## Core idea

A prototype used in embedded PRD should support more than "open the full page".

At minimum, downstream review often needs to:
- open the correct page
- open the correct state
- focus the relevant module or region
- suppress or de-emphasize unrelated content when necessary

This is the purpose of the focus / sandbox contract.

---

## Contract scope

This contract defines what a demo/prototype should be able to support for downstream embedded use.

It does **not** require one fixed implementation such as:
- only URL query parameters
- only hash routing
- only iframe usage
- only single-file HTML

Any implementation is acceptable if it can provide the required focused behavior reliably enough.

---

## Minimum required capabilities

A prototype intended for focused embedded review should support these four capabilities.

### 1) Page targeting
The prototype should support opening or switching to a specific page/view when downstream asks for it.

Examples:
- member center
- purchase dialog
- purchase result

### 2) State targeting
The prototype should support showing a relevant state when downstream asks for it.

Examples:
- pending
- paused
- active
- expired
- failed

### 3) Region/module focus
The prototype should support focusing or highlighting a relevant module/region when downstream asks for it.

Examples:
- entitlement tag list
- state badge area
- pre-purchase warning block
- result card

### 4) Unrelated-content de-emphasis
When helpful, the prototype should be able to reduce distraction from unrelated content.

This can be implemented by:
- hiding unrelated regions
- dimming unrelated regions
- disabling unrelated interaction
- switching to a reduced review view

The exact method is flexible. The capability is the important part.

---

## Focus request shape

Downstream focused display should be able to express a request that roughly includes:
- page target
- optional state target
- optional module/region target
- optional focus mode on/off

Example conceptual request:

```json
{
  "page": "member-center",
  "state": "pending",
  "module": "tag-list",
  "focus": true
}
```

This is a conceptual contract shape, not a mandatory wire format.

---

## Acceptable implementation patterns

Any of these are acceptable if they are stable enough:
- URL hash routing
- URL query parameters
- internal state selector + deep link
- message-based focus control between container and prototype
- embedded page-specific routes

Examples:
- `index.html#member-center`
- `index.html?page=member-center&state=pending&focus=tag-list`
- container sends a focus message to the prototype runtime

Do not overfit the workflow to one implementation unless your environment truly requires it.

---

## Sandbox mode meaning

Use "sandbox" here to mean a focused embedded review mode, not only browser security sandboxing.

A focused sandbox mode should ideally:
- reduce unrelated visual noise
- preserve the meaning of the target state/module
- avoid misleading the reviewer into thinking the whole product is currently visible

Sandbox mode does **not** need to mean a fully separate prototype build.
It can be a controlled focused view of the same prototype.

---

## Good focused-embedding behavior

A good focused prototype behavior usually means:
- doc block points to a concrete page/state/module
- prototype opens the right view without manual searching
- important target area is visually clear
- unrelated content does not dominate attention
- the focused view still remains truthful to the actual demo baseline

---

## Bad focused-embedding behavior

Avoid these failures:
- the prototype always opens at a generic home view
- downstream can target page but not state
- downstream can target state but not region/module
- focus mode hides so much that the view becomes misleading
- focused embedding requires brittle manual clicking every time
- prototype contract is so vague that `pm-embedded-prd` cannot rely on it

---

## Relationship to linkage mapping

This contract supports, but does not replace, linkage mapping.

- linkage mapping defines what should connect to what
- focus/sandbox contract defines whether the prototype can actually show the requested target clearly

A good mapping model with a weak focus contract still creates review friction.

---

## Relationship to embedded shell

This contract supports shell patterns by making the right-side demo more precise.

It is especially useful for:
- balanced shell
- demo-primary shell
- section-led shell with state/module focus

Without it, even a good shell may degrade into broad page-level jumping only.

---

## Minimum done definition

For this workflow, the contract is considered met when a prototype can be relied on to:
- open the intended page/view
- show the intended state when relevant
- focus or highlight the intended module/region when relevant
- provide some focused review mode that reduces irrelevant context

If the prototype cannot do these things, embedded review is still possible, but noticeably weaker.
