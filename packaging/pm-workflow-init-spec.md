# PM Workflow Init Spec

Use this document to define what the **public / reusable** version of the PM workflow system must initialize before normal use.

The goal is to turn the current personal-first workflow into something that can be installed and started by another user without relying on hidden local knowledge.

---

## Core idea

The public version must not assume that the user already knows:
- where project assets should live
- what config file to create
- which stage names the workflow expects
- which artifact directories the workflow expects
- how project roots differ from workspace roots

So the public version needs an explicit init step.

---

## Current draft init entry

Current draft init entry:
- `scripts/init-pm-workflow.ps1`

Current draft behavior:
1. reads `pm-workflow.config.example.json`
2. asks for or accepts `projectsRoot`
3. writes `pm-workflow.config.json`
4. creates the base `projectsRoot` if needed
5. prints a short ready summary

This is a first practical init path for the public package.
It is not yet a cross-platform final installer.

---

## Init responsibilities

The init process should do four jobs:
1. collect or confirm minimum config
2. write a canonical config file
3. create the base project-assets root if needed
4. confirm the system is ready for project creation and artifact management

Init should not create a fake project by default.
It should prepare the environment so real projects can be initialized cleanly later.

---

## Minimum init inputs

At minimum, init should collect or confirm:
- `projectsRoot`
- stage names
- artifact directory names
- naming defaults

### Recommended default values

```json
{
  "projectsRoot": "<user-chosen-path>",
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

In the current draft, only `projectsRoot` should normally require explicit user choice.
The other values should remain stable defaults unless the user intentionally changes them.

---

## Init outputs

Successful init should produce:
- a valid `pm-workflow.config.json`
- a created or verified `projectsRoot` directory
- a short success summary showing:
  - chosen `projectsRoot`
  - active stages
  - active artifact directories
  - active naming defaults

Optional but useful:
- a one-line reminder of the next step, such as creating the first project

---

## Canonical config location

Default canonical location:
- workspace-level `pm-workflow.config.json`

Future versions may support project-local override, but public init should first establish the workspace-level config clearly.

---

## Current script usage

### Interactive mode

```powershell
pwsh ./scripts/init-pm-workflow.ps1
```

or on Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-pm-workflow.ps1
```

### Non-interactive mode

```powershell
pwsh ./scripts/init-pm-workflow.ps1 -ProjectsRoot "D:\pm-workflow-projects" -Force
```

### Optional flags

- `-ProjectsRoot` → set the target project-assets root directly
- `-Force` → overwrite existing `pm-workflow.config.json` without interactive keep/update prompt
- `-NoCreateRoot` → write config only, skip creating the root directory

---

## Init behavior rules

### Rule 1: Ask only for minimum setup
Do not turn init into a long interview.

### Rule 2: Prefer explicit path choice
Let the user choose `projectsRoot` instead of silently hardcoding `C:` or workspace-local storage.

### Rule 3: Keep defaults stable
Default stage names, artifact directory names, and naming defaults should be stable across installs unless the user intentionally changes them.

### Rule 4: Create missing root safely
If `projectsRoot` does not exist, init may create it.

### Rule 5: Do not silently overwrite existing config
If config already exists, init should:
- show current values
- offer update/keep behavior
- avoid hidden replacement

---

## Failure handling

Init should fail clearly when:
- `projectsRoot` is invalid or inaccessible
- config cannot be written
- chosen path conflicts with an obviously wrong target
- example config is missing

When failing, it should say:
- what failed
- what was not written
- what the user should fix next

Do not pretend init succeeded when the root/config state is incomplete.

---

## Private vs public distinction

### Private / personal version
Allowed:
- manual config creation
- local one-off setup
- environment-specific assumptions known by the owner

### Public / reusable version
Required:
- explicit init entry
- explicit config creation/update behavior
- stable defaults
- no hidden dependence on the author's local path assumptions

---

## Relationship to project creation

Init is not the same as project creation.

### Init prepares:
- root config
- global defaults
- base project-assets root

### Later project creation should prepare:
- one project directory
- project metadata
- project-level structure
- project entry files

Keep these as separate concepts.

---

## Minimum done definition

P0 is considered covered when the public version has a defined init path that can reliably:
- create or update `pm-workflow.config.json`
- establish `projectsRoot`
- preserve the default stage/dir/naming contract
- leave the system ready for project-level operations

Without this, packaging is still documentation-only, not true reusable setup.
