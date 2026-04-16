# Prototype Annotation Pattern

Use this reference when the real deliverable is not a long PRD, but concise rule notes that will be placed beside prototype images, Axure screens, Figma frames, or screenshot callouts.

The goal is not elegance. The goal is that a reviewer can look at one screen and one note block and immediately know the business rule.

---

## When to use this pattern

Use it when the user is:
- pasting rules next to screenshots
- writing Axure/Figma side notes
- preparing review comments for a prototype round
- splitting one requirement across multiple annotated screens

Do not default to a long requirement summary in these cases.

---

## Core output shape

Prefer this structure:

1. Global rules
2. Screen-specific rules
3. Batch/add/save/delete/transfer rules split by interaction
4. One separate block for high-risk update logic

If multiple screenshots are involved, do not dump one giant list. Map each block to the relevant screenshot.

---

## Recommended writing rules

- Write in short numbered sections, such as `1.1`, `1.2`, `2.1`, `2.2`
- Keep one section focused on one screen or one operation
- Prefer direct statements over explanation-heavy prose
- Separate "page structure" from "save logic"
- Separate "global constraints" from "per-type differences"
- If there are multiple object types, use a comparison table or paired bullets
- If a rule only applies to one type, say so explicitly where the page is described

---

## Good section pattern

### 1. Global rules
- use for structure, object model, global constraints, ordering, visibility, deletion gates

### 2. Create / edit page
- use for tabs, visible modules, per-type differences, save behavior

### 3. Related items page
- use for list fields, bulk actions, refresh behavior

### 4. Batch transfer / high-risk actions
- use for scope restrictions, target restrictions, confirmation copy, update effects

### 5. Special update logic
- use for parameter inheritance, overwrite boundaries, retained historical data

---

## Example compression style

Good:
- `1.1 Classification structure`
- `1.2 Type constraints`
- `1.3 Sorting and display rules`
- `2.1 Create standard category`
- `2.2 Create operation category`
- `3.1 Related product list`
- `3.2 Bulk add`
- `4.1 Batch transfer restrictions`
- `4.2 Effects after transfer`

Bad:
- one long "business logic explanation"
- mixed page logic and save logic in the same paragraph
- generic summary with no screen mapping

---

## Anti-patterns

Avoid:
- writing like a PRD chapter when the target is screenshot annotations
- burying important save/transfer/delete logic inside a large paragraph
- repeating the same object-type comparison in many places instead of structuring it clearly once
- giving only conclusions without enough page binding to know where each rule belongs
