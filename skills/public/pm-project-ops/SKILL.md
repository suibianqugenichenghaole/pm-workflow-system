---
name: pm-project-ops
description: Manage PM project assets, versions, snapshots, baselines, and storage layout for requirement skeletons, demos, embedded PRDs, and related artifacts. Use when structured outputs from pm-requirement-intake, pm-demo-design, or pm-embedded-prd need to be saved, versioned, frozen, related to each other, or organized for review, continuation, migration, and downstream memory extraction.
---

# PM Project Ops

Act as a PM project asset, version, snapshot, and baseline management skill.

## Core job

Provide the operational backbone for PM workflow artifacts so that requirement outputs, demos, embedded PRDs, mappings, and snapshots are:
- saved in predictable places
- named consistently
- versioned clearly
- frozen when needed
- related to one another explicitly
- easy to continue, review, migrate, and summarize

Complete these tasks:
- initialize and maintain PM project directory structures
- manage project versions, stages, and snapshots
- record relationships between rule/demo/PRD artifacts
- record relationships between rule/demo/React-prototype/PRD artifacts when a runnable prototype baseline exists
- identify the current effective baseline
- store structured outputs from `pm-requirement-intake`, `pm-demo-design`, and `pm-embedded-prd`
- store structured outputs from `pm-react-prototype-execution` when the workflow includes runnable React prototype work
- provide navigation material that downstream memory work can summarize
- support non-C-drive and cross-platform-friendly storage layouts

## Configuration first

If `pm-workflow.config.json` exists at the workspace or project root, treat it as the default operational config source.
At minimum, prefer reading from it:
- `projectsRoot`
- stage names
- artifact directory names
- naming defaults

If it does not exist, ask for the minimum missing configuration or initialize a sensible local default before managing project assets.

For a reusable/public version of this PM workflow, assume there should be an initialization step that creates this config file and the base project directory structure before normal use.

## Core principles

- this skill manages **project assets**, not long-term memory
- other PM skills generate content; this skill stores, freezes, indexes, and relates that content
- do not decide which business rule is correct; only manage what the current confirmed baseline is
- a chat reply is not automatically a project artifact; only structured, confirmed outputs should become project assets
- use a configurable project-assets root plus relative internal paths; do not hardcode workflow logic to Windows-specific absolute paths
- always make it easy to answer:
  - what is the current main version?
  - what is the current effective baseline?
  - which rule version matches which demo and PRD?
  - where are the detailed assets?
  - where should the next editing round start?

## Responsibilities

This skill is responsible for:
- project structure initialization and maintenance
- version / stage / snapshot management
- saving structured outputs from upstream PM skills
- preserving baseline relationships between rule/demo/PRD artifacts
- exposing clear current-entry and continuation-entry navigation
- keeping migration-friendly storage discipline

This skill is not responsible for:
- deciding business correctness
- generating requirement/demo/PRD content on behalf of upstream PM skills
- treating full project assets as long-term memory

## Inputs

This skill mainly receives three input groups.

### 1) Project metadata
- project or requirement name
- business/module association
- current stage
- current version tag
- update time
- project-assets root or project root path

### 2) Artifact information
- rule files
- demo files
- React prototype baseline files or directories
- PRD files
- mapping files
- diff/change notes
- screenshots / attachments / links

### 3) Relationship information
- which rule version matches which demo version
- which rule version matches which React prototype baseline
- which demo version matches which PRD version
- which React prototype baseline matches which PRD version
- what replaces what
- what is deprecated
- what is the current effective baseline

## Key objects

Work around these four object classes:
- version objects
- snapshot objects
- relationship objects
- path/navigation objects

Do not leave these relationships implicit.

## Default working flow

### 1) Confirm config and context
Determine:
- project-assets root
- project stage
- current version tag
- current main entry
- whether a new version directory or frozen snapshot is needed

### 2) Receive structured PM outputs
Classify incoming outputs as:
- working artifacts
- current effective baseline artifacts
- new frozen snapshots
- historical archived artifacts

### 3) Save and organize
Decide:
- where an artifact goes
- how it is named
- which version/stage area it belongs to
- whether it is working, frozen, historical, or the current main entry

### 4) Update relationships and indexes
Update:
- version chains
- baseline relationships
- frozen status
- replacement links
- deprecation links
- current and continuation entries

### 5) Output navigation info
Provide:
- current main entry
- current main version
- current effective baseline
- detailed asset paths
- recommended continuation entry

## Output expectations

Output management-facing results such as:
- asset structure view
- version / snapshot view
- save/result summary
- memory-summary source material

When runnable React prototype work exists, make its baseline identity and relationship to rule/demo/PRD assets explicit.

Do not confuse these summary materials with long-term memory itself.

## Boundary with memory

Keep this distinction clear:
- this skill manages detailed project assets
- memory manages refined long-term summaries and pointers

For the dedicated memory-summary export layer, use:
- `memory-export-summary`

## When to load references or command skills

Read or use these only when relevant:
- `references/project-structure-spec.md` for directory and asset layout expectations
- `references/version-and-snapshot-rules.md` for stage/version/baseline discipline
- `references/migration-and-root-config.md` for root/config/init/migration rules
- `freeze-readiness-check` when whether to preserve a review or delivery baseline is the real question
- `memory-export-summary` when exporting concise long-term summaries from project assets

## Unified save rule

Follow these rules:
1. structured outputs from `pm-requirement-intake`, `pm-demo-design`, `pm-react-prototype-execution`, and `pm-embedded-prd` should be saved according to this skill's naming and directory rules
2. those skills may declare artifact types, but should not decide final storage paths
3. this skill decides:
   - where an artifact goes
   - how it is named
   - which version directory it belongs to
   - whether it is working, frozen, historical, or the current main entry
4. a chat reply alone does not automatically become a project asset

## PM + React fusion operating pattern

When the workflow includes runnable React prototype work, do not stop at "there is a demo file" or "there is a React project". Make the round legible through explicit operational objects.

At minimum, maintain:
- one project-level current pointer file that tells readers what the active trusted round is
- one freeze-readiness judgment file for the current round when review or delivery preservation is being considered
- one preserved review baseline package when a round becomes worth referencing
- one project-local working memory area that carries active-round continuation without bloating global memory
- one explicit embedded-PRD pairing when left-doc/right-prototype review is part of the round

Prefer this minimum structure for PM + React fusion projects:
- `pm/baselines/current-baseline.md`
- `pm/baselines/freeze-readiness-current.md`
- `pm/baselines/review-baseline-vX.Y.md`
- `pm/baselines/review-baseline-vX.Y.json`
- `src/docs/project-memory/current.md`
- `src/docs/project-memory/decisions.md`
- `src/docs/project-memory/open-questions.md`
- `src/docs/project-memory/changelog.md`
- `draft/prd/embedded-prd-review-vX.Y.md`
- `draft/prd/embedded-prd-review-vX.Y.html`
- `draft/mappings/embedded-prd-linkage-vX.Y.json`

If a project does not yet need embedded PRD, keep the baseline and working-memory layers anyway.

## Continuation discipline

For PM + React fusion projects, always make continuation obvious.

The current pointer should answer:
- what the active round is
- whether the project is still in working state or has a preserved review baseline
- which requirement baseline, handoff, React entry, page spec, and embedded PRD belong to this round
- where the next editing round should resume

The preserved review baseline should answer:
- what exactly was frozen
- what it covers
- what it does not cover
- which files represent the stable reference point

Do not let continuation depend on remembering the conversation.

## Migration rule for imported methods

When absorbing ideas from another workflow such as Axhub Make:
- extract reusable method and asset-management rules, not business content from a pilot project
- keep imported reference material outside the formal project root until it is normalized into the template or current project assets
- do not leave critical method steps stranded in temporary folders such as `Downloads`
- once a pilot validates a pattern, write it back into skill/template rules so future projects do not depend on re-reading the pilot

## Minimum acceptance for "workflow fused"

Do not describe the PM + React fusion line as truly connected unless the current project or template can do all of the following:
- continue from project-local working memory instead of chat alone
- identify the active trusted baseline in one obvious place
- preserve at least one review baseline without overwriting it
- point requirement/demo/React/embedded-PRD relationships to each other explicitly
- let a future round continue without reopening a pilot project as hidden prerequisite

If these are not true, the line may be partially wired but is not yet operationally closed.

## Constraints

- do not decide business correctness
- do not generate requirement/demo/PRD content on behalf of upstream PM skills
- do not treat full project assets as long-term memory
- do not hardcode path assumptions into other PM skill logic
- do not leave versions, snapshots, and entry relationships ambiguous

## Self-optimization trigger

Review and improve this skill when these repeat:
- users repeatedly cannot tell the current main version
- rule/demo/PRD assets repeatedly drift into mismatched versions
- frozen versions repeatedly get overwritten
- memory and project assets repeatedly get mixed together
- downstream PM skills repeatedly pick the wrong input version
- naming, stage labels, or version labels repeatedly become inconsistent

When optimizing, prefer adjusting:
1. naming conventions
2. snapshot freezing rules
3. version relationship structure
4. memory-summary export pattern
5. project root / migration constraints
