---
name: memory-export-summary
description: Compress a PM workflow project's current state into a concise memory-safe summary with continuation pointers instead of copying full project assets into memory. Use when Codex needs to write durable memory notes, export project status for later continuation, or summarize the current baseline/version/stage without duplicating the full requirement/demo/PRD asset set.
---

# Memory Export Summary

Act as a command-style skill for turning project assets into concise memory-safe continuation notes.

## Core job

Take the current project state and produce a compact summary that:
- captures the durable facts worth remembering
- points to the current baseline and continuation entry
- avoids copying large project assets into memory
- distinguishes stable truth from temporary working detail

Use this skill to make memory useful for navigation and continuity instead of turning it into a duplicate project archive.

## Boundaries

This skill is responsible for:
- summarizing durable project state
- naming the current version/stage/baseline clearly
- pointing to the best continuation paths
- separating stable conclusions from working detail

This skill is not responsible for:
- storing full rules, full demos, or full PRDs in memory
- replacing project-ops asset management
- acting as the primary source of truth for the project
- preserving every draft detail or chat fragment

If the current project state is too unstable to summarize as durable memory, say so and export only the minimal continuation pointer.

## Inputs

Work from whatever current project evidence exists, such as:
- project slug or name
- current version/stage
- current baseline set
- freeze status
- core rule/model conclusion
- current demo/PRD status
- key unresolved items
- continuation entry files or project paths

Prefer project-ops outputs and current baseline files over long chat history.

## Core memory principle

Memory should store:
- what this project currently is
- what round it is in
- what the current trusted baseline is
- what the main durable conclusion is
- where to continue next

Memory should not store:
- the full rule document
- the full demo description
- the full embedded PRD
- every version diff
- raw case piles that already live in project assets

In short:
- memory = summary + pointer
- project assets = full detail

## Working flow

### 1) Identify the current trust level

First judge what kind of state you are exporting:
- working draft only
- review candidate baseline
- frozen delivery baseline
- historical summary

Do not overstate trust. If the project is still shifting, say so.

### 2) Extract only durable facts

Prefer facts such as:
- project identity
- current effective version/stage
- current baseline status
- durable rule/model conclusion
- major current scope
- major open issue if it materially affects continuation
- best continuation entry

Avoid pulling in long explanations unless they are truly needed for later continuity.

### 3) Separate stable from unstable

When necessary, split the export into:
- stable summary
- unresolved / still-moving items
- continuation pointers

If the unstable part is large, keep it very short.

### 4) Point to the real assets

Always include the best continuation references available, such as:
- project root
- current baseline manifest
- current version directory
- continuation-entry file
- embedded PRD path if relevant

The point of memory is to help future work re-enter the project quickly.

### 5) Keep the summary compact

Default target:
- short enough to drop into memory cleanly
- rich enough that future-you knows what is current and where to resume

If a detail already exists in project assets, prefer a pointer over duplication.

## Recommended output format

Prefer this compact structure:

```md
## Project memory summary
- Project:
- Current stage:
- Current version:
- Current baseline:
- Durable conclusion:
- Open issue / caution:
- Continue from:
```

Keep it concise. The most important fields are:
- current stage
- current version
- durable conclusion
- continue from

## Export levels

### Level 1: Minimal pointer export

Use when:
- the project is still unstable
- there is not yet a trustworthy durable conclusion

Output only:
- project identity
- current stage/version if known
- main continuation pointer
- short caution

### Level 2: Working summary export

Use when:
- the round is coherent enough to summarize
- but still not a strong frozen baseline

Output:
- current stage/version
- current main direction
- key unresolved item(s)
- continuation pointer

### Level 3: Baseline summary export

Use when:
- there is a review-grade or frozen baseline worth remembering durably

Output:
- stage/version
- current baseline set
- stable rule/model conclusion
- main scope
- continuation pointer
- one short caution if needed

## Decision heuristics

Use these tests when unsure.

### Test 1: Already-lives-in-assets test
Ask:
- Does this detail already live safely in project files and not need duplication?

If yes, prefer a pointer.

### Test 2: Durable-next-week test
Ask:
- Will this still help next week, or is it just today's draft noise?

If it is draft noise, exclude or compress it heavily.

### Test 3: Re-entry test
Ask:
- If future-you read only this summary, would they know what is current and where to resume?

If no, improve the baseline and continuation lines rather than adding raw detail.

### Test 4: Trustfulness test
Ask:
- Does this summary honestly reflect how stable the current state is?

If no, downgrade the confidence and export level.

## Typical export contents worth keeping

Usually worth keeping:
- current main version/stage
- current trusted baseline identity
- main rule or model conclusion if it has stabilized
- whether the project is at draft/review/frozen stage
- major unresolved blocker if it affects continuation
- best file/path to resume from

Usually not worth copying in full:
- complete rule list
- every page/module/state description
- full linkage map
- large diff lists
- raw review chatter

## Anti-patterns

Avoid these mistakes:
- copying the whole PRD into memory
- copying the whole demo description into memory
- turning memory into a duplicate project filesystem
- exporting unstable exploratory conclusions as durable truth
- forgetting to include the best continuation path

## References to load when needed

Read these only when useful:
- `../pm-project-ops/references/project-structure-spec.md` for likely project entry and asset locations
- `../pm-project-ops/references/version-and-snapshot-rules.md` for stage/version/baseline discipline
- `../freeze-readiness-check/SKILL.md` when current stability is unclear and trust level must be judged before export

## Handoff expectations

When the project is still unstable:
- prefer a minimal or working summary export
- point strongly to the continuation entry

When a baseline is trustworthy:
- export the durable conclusion and baseline identity clearly
- keep the rest short and pointer-based
