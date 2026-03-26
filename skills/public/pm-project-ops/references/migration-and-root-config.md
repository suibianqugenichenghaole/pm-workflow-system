# Migration and Root Config

Use this reference when `pm-project-ops` needs to explain or decide how project roots, config files, initialization, and cross-environment migration should work.

The goal is to keep PM workflow assets portable across machines, drives, and clients instead of binding the system to one workspace path or one operating system.

---

## Core idea

The PM workflow should treat project storage root as configuration, not as hardcoded logic.

That means:
- skill logic should not assume `C:`
- project assets may live outside the workspace
- the same project root may be used by different clients if they follow the same rules
- migration should mostly be a root-path change, not a full rebuild of the project structure

---

## Three-path distinction

Do not confuse these three concepts.

### 1) Workspace root
Where the OpenClaw workspace, skills, docs, and helper files live.

### 2) Project-assets root
Where PM workflow project folders live.
This is what `projectsRoot` points to.

### 3) Project internal paths
Relative paths inside one specific PM project, such as:
- `versions/v0.3/prd/embedded-prd.html`
- `indexes/current-baseline.json`
- `working/rules/`

Most portability problems happen when these three layers get mixed together.

---

## Root config principle

The canonical root config lives in:
- `pm-workflow.config.json`

At minimum, this config should define:
- `projectsRoot`
- stage names
- artifact directory names
- naming defaults

Current example:

```json
{
  "projectsRoot": "E:\\pm-workflow-projects",
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

`projectsRoot` is the project-asset root.
It is not the same thing as:
- OpenClaw workspace root
- current chat session working directory
- skill installation directory

---

## Why not hardcode `C:`

Do not bake `C:` into workflow assumptions.

Reasons:
- the user may prefer another drive
- project assets may need more space than the system drive
- different machines may use different drive layouts
- later migration to Mac or another environment becomes harder if paths are embedded everywhere

Better rule:
- read `projectsRoot` from config
- keep internal project references relative where practical
- treat absolute root only as the outer mount point

---

## Configuration precedence

Recommended precedence:
1. explicit project-local override, if later supported
2. workspace-level `pm-workflow.config.json`
3. sensible default only as fallback

If config is missing, do not silently treat an arbitrary absolute path as permanent truth.
Either:
- initialize config, or
- ask for the minimum missing value

### Missing-config behavior

#### For private/personal use
A short manual setup may be acceptable.

#### For reusable/public use
Missing config should trigger an explicit initialization path, not hidden assumptions.

---

## Shared-root principle across clients

OpenClaw and a local Codex client can use the same project-assets root **only if** they share:
- the same storage conventions
- the same version/stage rules
- the same artifact directory expectations
- the same project-level structure assumptions
- the same understanding of current main entry / review entry / delivery entry

In other words:
- shared root is possible
- shared root is not magical
- both clients must follow the same operational contract

If one client writes ad hoc structures and the other expects structured versions/snapshots, the shared root will become messy quickly.

### Shared-root checklist

Before sharing one root across clients, verify:
- both clients agree on `projectsRoot`
- both clients agree on stage labels
- both clients agree on artifact directories
- both clients agree on version naming
- both clients agree on current-entry conventions
- both clients can tolerate relative internal references

---

## Relative-path principle

Inside a project, prefer relative references where practical.

Examples:
- link from current baseline manifest to `versions/v0.3/prd/embedded-prd.html`
- point from continuation entry to `working/rules/`
- point from snapshot manifest to version-local assets

Avoid embedding machine-specific absolute paths inside internal project files unless truly necessary.

This keeps migration easier when:
- moving from `E:` to another drive
- copying a whole project folder to another machine
- moving from Windows to Mac

### Good pattern
- absolute path only at the root config layer
- relative paths inside project metadata and manifests

### Bad pattern
- absolute Windows paths scattered through manifests, indexes, and asset references

---

## Windows → Mac migration principle

Migration should ideally preserve:
- project directory structure
- version folders
- stage labels
- artifact naming
- internal relative references
- current/main/review/delivery entry conventions

Migration should only require changing:
- `projectsRoot`
- maybe a few client-specific entry settings

Example:
- Windows: `E:\pm-workflow-projects`
- Mac: `~/pm-workflow-projects`

If the internal project structure is portable, this is a config change, not a project rewrite.

### Migration checklist

When migrating, check:
- `projectsRoot` updated correctly
- project directories copied intact
- internal relative references still valid
- stage/version metadata still readable
- current-baseline and continuation entry still point to the correct files
- no Windows-only absolute paths remain in project metadata

---

## Initialization principle

A personal/private setup may tolerate manual config creation.
A reusable/public version should not rely on that.

### Private / personal version
Allowed:
- create `pm-workflow.config.json` manually
- set `projectsRoot` directly
- create base root folder yourself if needed

### Reusable / public version
Expected:
- include an initialization step
- create `pm-workflow.config.json` if missing
- ask for or set `projectsRoot`
- write default stage names
- write default artifact directory names
- write naming defaults
- optionally create the base project-assets root directory

In short:
- private version can start manually
- public version should support explicit init

---

## Recommended minimum config fields

At minimum:
- `projectsRoot`
- `stages`
- `artifactDirs`
- `naming`

These are enough to avoid most hardcoded path mistakes.

### Optional future extensions
Could later include:
- project-local overrides
- default folder naming patterns
- platform/client compatibility flags
- init behavior options

These are useful later, but not necessary for minimum viability.

---

## Anti-patterns

Avoid these mistakes:
- hardcoding `C:` into skill logic
- assuming workspace root equals project-assets root
- writing absolute Windows-only paths into reusable project metadata
- letting different clients share one root without shared structure rules
- expecting reusable/public users to hand-edit config with no init path
- scattering root decisions across multiple files with no clear source of truth

---

## Relationship to other project-ops references

- Use `project-structure-spec.md` for what the project directory should look like.
- Use `version-and-snapshot-rules.md` for how versions, stages, and freeze relationships should behave.
- Use this file for where the root lives, how it is configured, and how migration/init should work.
