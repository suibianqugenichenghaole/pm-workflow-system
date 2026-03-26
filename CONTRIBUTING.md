# Contributing

Thanks for considering a contribution to PM Workflow System.

This repository is not just a collection of prompts or skill files.
It is trying to define a **structured operating model** for PM workflow:
- requirement intake
- demo iteration
- embedded PRD delivery
- project asset and version management

So the goal of contribution is not only to add more content.
The goal is to keep the system **clearer, more reusable, and less fragile**.

---

## First principle

Before changing anything, try to preserve these boundaries:

- `pm-requirement-intake` owns requirement intake, readiness, and rule convergence
- `pm-demo-design` owns demo generation, iteration, and freeze-readiness signaling
- `pm-embedded-prd` owns linked doc/demo delivery structure and mapping-oriented output
- `pm-project-ops` owns project structure, versions, snapshots, indexes, and storage conventions

If a change blurs these boundaries, explain why.
If it does not need to blur them, do not blur them.

---

## Good contribution targets

Contributions are especially helpful when they improve one of these:

### 1) Workflow clarity
Examples:
- make a skill boundary clearer
- reduce ambiguity in role or ownership
- improve references so they are easier to apply in real work

### 2) Reusability
Examples:
- remove hidden local assumptions
- improve portability across machines or runtimes
- improve installation or initialization experience

### 3) Operational quality
Examples:
- better sample project structure
- stronger version/snapshot examples
- clearer continuation entry or current-baseline conventions
- safer init behavior

### 4) Documentation quality
Examples:
- improve README clarity
- add examples that make the workflow easier to understand
- clarify limitations and non-goals

---

## Changes that need extra care

Please be more careful when changing:

- skill boundaries
- stage labels
- artifact directory names
- version and snapshot rules
- current-entry conventions
- initialization behavior
- example project structure

These are closer to the protocol layer of the system.
Even small edits here can create confusion for downstream users.

---

## Contribution rules

### Rule 1: Keep structure explicit
Do not hide important workflow assumptions in scattered wording.
If a rule matters, write it down in the relevant file.

### Rule 2: Avoid author-local assumptions
Do not introduce:
- machine-specific absolute paths
- private environment knowledge
- local-only workflow assumptions that are not documented

Public contributions should make the package more portable, not less.

### Rule 3: Do not turn the system into a giant catch-all prompt
This repository works because responsibilities are separable.
Adding more content is fine.
Destroying modularity is not.

### Rule 4: Prefer examples that teach structure
A good example should help users understand:
- what to open first
- what is current working state
- what is baseline state
- how versions and snapshots relate

### Rule 5: Preserve baseline semantics
Do not make it harder to answer:
- what is the current truth?
- what is still editable?
- what is frozen?
- what replaced what?

If a change weakens those answers, rethink it.

---

## Recommended contribution flow

A practical contribution flow looks like this:

1. identify the target clearly
   - README
   - init flow
   - one skill
   - one reference file
   - sample project
   - version/snapshot rule

2. explain the problem briefly
   - what is unclear, missing, inconsistent, or fragile?

3. propose the smallest useful change
   - avoid bundling many unrelated edits into one PR if possible

4. show impact clearly
   - what becomes easier, safer, clearer, or more reusable?

5. keep examples and docs in sync
   - if a protocol-level rule changes, update the related docs or samples too

---

## Pull request guidance

A good PR usually includes:
- a short summary of the change
- why the change is needed
- which part of the workflow it affects
- whether it changes behavior, structure, or only wording
- which docs/examples were updated to match

Helpful PR style:
- one concern per PR when practical
- clear before/after framing
- no silent protocol changes

---

## Sample project contribution guidance

If you contribute to `examples/sample-project/`, aim for examples that are:
- small enough to inspect quickly
- realistic enough to teach the workflow
- explicit about current entry points
- explicit about version, stage, and snapshot state

Do not turn the sample into a messy pseudo-real project.
It should teach structure first.

---

## Init and config contribution guidance

If you change init behavior, keep these expectations true:
- `projectsRoot` is explicit
- `pm-workflow.config.json` is the canonical config output
- default stages / dirs / naming remain stable unless intentionally changed
- missing config should not be handled by hidden assumptions

If you add a new init path or script, document:
- how it is invoked
- what it writes
- what it creates
- what it does not do

---

## Documentation contribution guidance

When editing docs:
- prefer concrete wording over slogans
- explain boundaries, not just goals
- keep structure shallow and skimmable
- avoid marketing-heavy filler
- update both English and Chinese docs when the change matters to both

---

## Non-goals for contribution

These are usually not good default contribution directions unless discussed first:
- turning this into a generic all-purpose PM framework
- collapsing all skills into one mega skill
- replacing explicit structure with vague “AI will figure it out” language
- adding hidden dependence on private memory systems
- introducing platform-bound assumptions as if they were universal

---

## License

By contributing to this repository, you agree that your contributions will be licensed under the repository's MIT License.

See:
- `LICENSE`

---

## In short

Good contributions make the workflow:
- clearer
- more portable
- easier to initialize
- easier to continue
- easier to version and review

If a change makes the repository feel more like a usable PM system and less like a pile of disconnected files, it is probably heading in the right direction.
