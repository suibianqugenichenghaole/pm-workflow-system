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
- identify the current effective baseline
- store structured outputs from `pm-requirement-intake`, `pm-demo-design`, and `pm-embedded-prd`
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
- PRD files
- mapping files
- diff/change notes
- screenshots / attachments / links

### 3) Relationship information
- which rule version matches which demo version
- which demo version matches which PRD version
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
1. structured outputs from `pm-requirement-intake`, `pm-demo-design`, and `pm-embedded-prd` should be saved according to this skill's naming and directory rules
2. those skills may declare artifact types, but should not decide final storage paths
3. this skill decides:
   - where an artifact goes
   - how it is named
   - which version directory it belongs to
   - whether it is working, frozen, historical, or the current main entry
4. a chat reply alone does not automatically become a project asset

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
