# PM Workflow System

[English](./README.md) | [简体中文](./README.zh-CN.md)

A structured PM workflow system for moving from requirement intake to demo iteration, embedded PRD delivery, and project asset/version management.

一个面向产品经理的结构化工作流系统，用于需求收敛、Demo 迭代、嵌入式 PRD 交付和版本化项目资产管理。

This package is the **public/open-source draft** of a workflow that was originally developed in a personal-first setup and then extracted into a reusable form.

It is designed for PMs who want something more operational than "just write a PRD", but less chaotic than scattered prompts, ad hoc folders, and undocumented iteration.

---

## Why this exists

Most PM workflows break down in one of these ways:
- requirement clarification lives only in chat
- demos and PRDs drift apart
- review states are implicit instead of explicit
- version baselines are hard to trace
- project files turn into a flat dumping ground

This system tries to fix that by giving PM work a **structured operating model**:
1. clarify requirements with explicit readiness and rule convergence
2. iterate demos with context and rule-change signaling
3. assemble embedded PRDs that stay linked to demo review
4. store project assets, versions, baselines, and snapshots in a stable structure

---

## What makes this package different

### 1) Four-part PM workflow kernel
The workflow is centered around four core skills with clear boundaries:
- `pm-requirement-intake` — requirement intake, readiness, and rule convergence
- `pm-demo-design` — demo generation, iteration, and freeze-readiness signaling
- `pm-embedded-prd` — linked left-doc/right-demo delivery shell and mapping-oriented output
- `pm-project-ops` — project assets, versions, snapshots, and storage structure

This is not one giant "do everything" prompt. It is a modular workflow with separable responsibilities.

### 2) Command-style skills for repeatable checks
The package also includes narrower command-style skills for recurring tasks:
- `rule-change-signal`
- `freeze-readiness-check`
- `state-audit`
- `embedded-prd-audit`
- `memory-export-summary`

These are meant to make repeated review or audit-style actions easier to trigger and standardize.

### 3) Explicit project structure and version management
This workflow does not assume that project assets should live in random folders or be tracked by memory alone.

It introduces a project-assets model with:
- working areas
- version folders
- snapshots
- indexes
- mappings
- historical artifacts

That makes continuation, review, and freeze baselines easier to manage over time.

### 4) Public package does not assume private memory
The open-source package does **not** bundle a private personal memory operating layer by default.

If you want memory integration, treat it as an optional companion layer rather than the default core package.

### 5) Explicit initialization instead of hidden assumptions
The public version is expected to initialize a project-assets root explicitly rather than silently depending on the author's local environment.

---

## What is included

### Core skills
- `pm-requirement-intake`
- `pm-demo-design`
- `pm-embedded-prd`
- `pm-project-ops`

### Command-style skills
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
- `LICENSE`
- `CONTRIBUTING.md`

---

## Repository structure

```text
skills/public/
  pm-requirement-intake/
  pm-demo-design/
  pm-embedded-prd/
  pm-project-ops/
  rule-change-signal/
  freeze-readiness-check/
  state-audit/
  embedded-prd-audit/
  memory-export-summary/

packaging/
  pm-workflow-init-spec.md

scripts/
  init-pm-workflow.ps1

examples/
  sample-project/

pm-workflow.config.example.json
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

Example:

```json
{
  "projectsRoot": "<your-project-assets-root>",
  "stages": ["draft", "review", "frozen", "historical", "deprecated"],
  "artifactDirs": {
    "rules": "rules",
    "demo": "demo",
    "prd": "prd",
    "snapshots": "snapshots",
    "mappings": "mappings",
    "diffs": "diffs",
    "attachments": "attachments",
    "indexes": "indexes"
  },
  "naming": {
    "versionPrefix": "v",
    "mainEntry": "current",
    "reviewEntry": "review",
    "deliveryEntry": "delivery"
  }
}
```

#### 3) Create or verify the root directory
If your chosen `projectsRoot` does not exist yet, create it.

#### 4) Keep defaults unless you have a strong reason to change them
For most users, the default:
- stage names
- artifact directory names
- naming defaults

should remain stable.

---

## Sample project

If you want to understand the practical project shape after init, start here:
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

Use it to understand how requirement, demo, PRD, mapping, and version metadata fit together in a real folder structure.

---

## Initialization model

The public package expects an explicit init step.

At minimum, initialization should:
1. collect or confirm `projectsRoot`
2. write `pm-workflow.config.json`
3. create the base project-assets root if needed
4. confirm the system is ready for project creation and asset management

This init step is separate from project creation.

- **Init** prepares the global root config.
- **Project creation** prepares one actual project directory and its internal structure.

For the current draft, see:
- `packaging/pm-workflow-init-spec.md`

---

## What this package is good for

This package is especially useful if you want to:
- structure PM work beyond chat-only prompting
- separate requirement intake from demo design and delivery packaging
- keep demo outputs and PRD outputs linked instead of drifting apart
- maintain versioned baselines and snapshots over time
- prepare a reusable PM workflow rather than a one-off personal prompt

---

## Current status

This is a structured open-source draft prepared from a personal-first workflow.

The core workflow is usable, and the public package now includes:
- an initial PowerShell init script
- a neutralized example config
- an initialization spec
- a lightweight sample project skeleton
- a permissive open-source license
- a formal contribution guide

Current public-facing gaps still worth improving:
- a cross-platform init command or installer
- richer example project artifacts
- one end-to-end example showing intake → demo → embedded PRD → freeze baseline
- optional memory integration documentation

---

## Recommended next steps

If you want to make this package easier for others to adopt, the highest-leverage next additions are:
1. a cross-platform init command or script set
2. a richer sample project with more realistic artifacts
3. one end-to-end example showing intake → demo → embedded PRD → freeze baseline
4. clearer install/use guidance for different agent or skill runtimes

---

## License

This repository currently uses the **MIT License**.

See:
- `LICENSE`

---

## Contributing

See:
- `CONTRIBUTING.md`
