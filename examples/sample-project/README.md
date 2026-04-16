# Sample Project Skeleton

This sample project shows the **minimum practical shape** of a PM workflow project after initialization.

It is not meant to be a full business case.
It is meant to help you answer these questions quickly:
- what should a project folder look like?
- where do current working artifacts live?
- where do frozen/versioned artifacts live?
- what should I open first when continuing work?

---

## What this sample demonstrates

This sample includes:
- one project root
- one `working/` area
- one `versions/v0.1/` baseline
- one `snapshots/` manifest
- one `indexes/current-baseline.json` entry
- one `indexes/continuation-entry.md` note

It is intentionally small, so the structure is easy to inspect.

---

## Practical precondition reminder

This sample demonstrates project structure, not the whole preparation workflow.

In real use, especially for demo/prototype rounds with stronger design goals, you should usually prepare a small design-reference set first:
- 1 to 3 representative screenshots
- one clearly scoped page or page family
- enough reference to separate atmosphere problems from component-grammar problems

Those references should stay in a bounded project-side area instead of being mixed into global memory or random chat attachments.

---

## Public-package boundary

This sample is intentionally sanitized for public sharing.

That means it does **not** include:
- private business screenshots
- internal project names
- private absolute machine paths
- private pilot-only assets

Use it to learn structure first, then replace the fictional content with your own real project assets locally.

---

## Suggested first files to open

1. `indexes/continuation-entry.md`
2. `indexes/current-baseline.json`
3. `versions/v0.1/meta/version.json`
4. `versions/v0.1/rules/rule-baseline.md`
5. `versions/v0.1/prd/embedded-prd.md`

---

## Sample theme

This sample uses a lightweight fictional PM topic:

**Study Session Check-in Optimization**

The point is not the topic itself.
The point is how requirements, demo, PRD, mappings, and version metadata are organized.
