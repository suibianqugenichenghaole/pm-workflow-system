# PM Workflow System

[English](./README.md) | [简体中文](./README.zh-CN.md)

A PM workflow and prototype-delivery system for moving from requirement intake to demo iteration, runnable React prototypes, embedded PRD review, and project asset/version management.

It is designed for PMs who want something more operational than "just write a PRD", but also want something more concrete than prompt-only workflow theory.

The biggest recent shift is that this system now supports a much more complete prototype-delivery path:
- absorb screenshots and mockups into reusable page grammar instead of one-off imitation
- write page-oriented PRDs from clarified requirements and current prototype baselines
- turn structured handoff into runnable React prototype baselines
- assemble embedded PRD review shells that stay linked to runnable demos
- keep reusable UI assets in a canonical template instead of losing them in one project

If you only want abstract process guidance, this package is heavier than necessary.
If you want a repeatable path from requirement -> demo -> runnable prototype -> review-grade PRD, this is the point.

---

## Why this exists

Most PM workflows break down in one of these ways:
- requirement clarification lives only in chat
- demos and PRDs drift apart
- review states are implicit instead of explicit
- version baselines are hard to trace
- prototype work becomes one-off screenshots with no continuation path
- project files turn into a flat dumping ground

This system tries to fix that by giving PM work a structured operating model:
1. clarify requirements with explicit readiness and rule convergence
2. iterate demos with context and rule-change signaling
3. absorb design references into reusable component and page grammar
4. write page-oriented PRDs from clarified requirements and current prototype baselines
5. turn stable handoff into runnable React prototype baselines
6. assemble embedded PRDs that stay linked to demo review
7. store project assets, versions, baselines, and snapshots in a stable structure

## What's new

- Added `prototype-export-intake` for extracting page structure, annotations, visual resources, and unresolved conflicts from exported prototype packages before requirements are finalized.

---

## Release history

- **2026-06-08 — Public workflow skills refresh**: added request-framing and challenge skills, refined PRD and runnable-prototype references, and clarified project-operations boundaries.
- **2026-05-13 — Workflow skills and component-registry refresh**: strengthened reusable component-registry guidance and the public workflow package structure.
- **2026-04-16 — Documentation and public-package reframing**: refreshed the public documentation, sanitized examples, and clarified the end-to-end prototype-delivery positioning.
- **2026-03-26 — Initial public release**: established the public PM workflow package, bilingual README entry, and initial packaging boundary.

---

## What makes this package different

### 1) It covers the full PM delivery chain
This system is built for the path from first requirement intake to reviewable PRD delivery.

That path includes:
- requirement clarification and readiness judgment
- demo/page structure iteration
- design-reference absorption
- runnable prototype execution
- embedded PRD assembly
- project baseline and artifact management

### 2) PM + prototype workflow kernel
The workflow is centered around clear skill groups with separable responsibilities.

Workflow intake and value framing:
- `request-triage` - choose fast, standard, or deep workflow depth before over-processing or under-processing a request
- `pm-value-anchor` - clarify target value, minimum success, evidence, and tradeoffs before requirement intake
- `audience-judgment-framing` - define the reader, expected judgment, and evidence needs for PRDs, reviews, and handoff artifacts

Core production skills:
- `pm-requirement-intake` - requirement intake, readiness, and rule convergence
- `prototype-export-intake` - extracts structured evidence from exported prototype packages before requirement confirmation
- `pm-demo-design` - demo generation, iteration, and freeze-readiness signaling
- `pm-prd-writer` - page-oriented, implementation-readable PRD writing from clarified requirements
- `pm-design-absorption` - absorb screenshots and mockups into reusable components and page grammar
- `pm-react-prototype-execution` - turn structured handoff into a runnable React prototype baseline
- `pm-embedded-prd` - linked left-doc/right-demo delivery shell and mapping-oriented output
- `pm-project-ops` - project assets, versions, snapshots, and storage structure

This is not one giant "do everything" prompt. It is a modular workflow with separable responsibilities.

### 3) Challenge and audit skills for repeatable checks
The package also includes narrower challenge and command-style skills for recurring tasks:
- `pm-devil-advocate`
- `pm-requirement-reverse-audit`
- `rule-change-signal`
- `freeze-readiness-check`
- `state-audit`
- `embedded-prd-audit`
- `memory-export-summary`

These make challenge, review, audit, and memory-safe continuation actions easier to trigger and standardize.

### 4) Explicit project structure and version management
This workflow does not assume that project assets should live in random folders or be tracked by memory alone.

It introduces a project-assets model with:
- working areas
- version folders
- snapshots
- indexes
- mappings
- historical artifacts

That makes continuation, review, and freeze baselines easier to manage over time.

### 5) It does not assume private memory
This package does not bundle a private personal memory operating layer by default.

Memory integration is intentionally treated as an optional companion layer rather than part of the default core package.

### 6) Explicit initialization instead of hidden assumptions
The system is expected to initialize a project-assets root explicitly rather than silently depending on the author's local environment.

---

## What is included

### Core skills
- `request-triage`
- `pm-value-anchor`
- `audience-judgment-framing`
- `pm-requirement-intake`
- `pm-demo-design`
- `pm-prd-writer`
- `pm-design-absorption`
- `pm-react-prototype-execution`
- `pm-embedded-prd`
- `pm-project-ops`

### Command-style skills
- `pm-devil-advocate`
- `pm-requirement-reverse-audit`
- `rule-change-signal`
- `freeze-readiness-check`
- `state-audit`
- `embedded-prd-audit`
- `memory-export-summary`

### Configuration, packaging, and examples
- `pm-workflow.config.example.json`
- `packaging/pm-workflow-init-spec.md`
- `scripts/init-pm-workflow.ps1`
- `examples/sample-project/`
- `UPDATE-NOTES.md`
- `LICENSE`
- `CONTRIBUTING.md`

---

## Repository structure

```text
skills/public/
  request-triage/
  pm-value-anchor/
  audience-judgment-framing/
  pm-requirement-intake/
  prototype-export-intake/
  pm-demo-design/
  pm-prd-writer/
  pm-design-absorption/
  pm-react-prototype-execution/
  pm-embedded-prd/
  pm-project-ops/
  pm-devil-advocate/
  pm-requirement-reverse-audit/
  rule-change-signal/
  freeze-readiness-check/
  state-audit/
  embedded-prd-audit/
  memory-export-summary/

docs/
  component-library/
    component-registry.md

packaging/
  pm-workflow-init-spec.md

scripts/
  init-pm-workflow.ps1

examples/
  sample-project/

pm-workflow.config.example.json
UPDATE-NOTES.md
LICENSE
CONTRIBUTING.md
```

---

## Quick start

### Option A: use the init script

#### Interactive mode

```powershell
pwsh ./scripts/init-pm-workflow.ps1
```

or on Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-pm-workflow.ps1
```

#### Non-interactive mode

```powershell
pwsh ./scripts/init-pm-workflow.ps1 -ProjectsRoot "D:\pm-workflow-projects" -Force
```

### Option B: manual setup

#### 1) Copy the example config
Create a real config file from the example:
- copy `pm-workflow.config.example.json`
- save it as `pm-workflow.config.json`

#### 2) Set your `projectsRoot`
Choose where your PM workflow project assets should live.

#### 3) Create or verify the root directory
If your chosen `projectsRoot` does not exist yet, create it.

#### 4) Keep defaults unless you have a strong reason to change them
For most users, the default stage names, artifact directory names, and naming defaults should remain stable.

---

## Sample project

For a practical example of project structure after init, start here:
- `examples/sample-project/README.md`
- `examples/sample-project/study-session-checkin/`

This sample project is intentionally lightweight.
It demonstrates:
- one project root
- one current baseline entry
- one continuation entry
- one `working/` area
- one `versions/v0.1/` baseline
- one snapshot manifest
- one lightweight design-intake placeholder

It is closer to a project-structure example than a full business case.

---

## Practical preconditions

This package works better when you prepare some context before asking for a design-heavy round.

Especially for prototype or visual absorption work, prepare:
- 1 to 3 representative screenshots or mockups
- a clear page family or module scope
- enough rule context to explain why the page exists

If you skip that, the system can still generate output, but it will drift more easily toward generic "nice-looking demo" territory.

---

## Package boundary

This repository intentionally excludes:
- private project screenshots
- pilot-only business documents
- private absolute paths
- internal-only template code assets

It keeps the method layer, structure layer, and safe example material.

---

## Current status

This is now a usable PM + prototype-delivery system.

It already includes:
- init script and config example
- seven core PM/prototype skills
- command-style review helpers
- a lightweight sample-project skeleton
- packaging notes and update notes

There is still room to improve, especially around:
- broader cross-platform initialization
- richer sample deliverables
- more end-to-end public examples
- optional memory integration guidance
