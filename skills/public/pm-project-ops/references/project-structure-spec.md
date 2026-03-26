# Project Structure Spec

Use this reference when `pm-project-ops` needs to initialize or validate the directory layout of a PM workflow project.

The aim is not to impose ceremony. The aim is to ensure that rule artifacts, demos, embedded PRDs, snapshots, mappings, and review outputs can coexist without ambiguity.

---

## Core idea

A PM workflow project should separate:
- current working artifacts
- frozen baselines
- historical artifacts
- management/index files

If all artifacts are dumped into one folder, version relationships become implicit and fragile.

---

## Root layout

Assume there is a configurable `projectsRoot`, for example:
- `E:\pm-workflow-projects`
- `D:\pm-workflow-projects`
- `~/pm-workflow-projects`

Under that root, each PM project gets its own directory.

Recommended shape:

```text
{projectsRoot}/
  {project-slug}/
    project.json
    indexes/
    working/
    versions/
    snapshots/
    historical/
    attachments/
```

This is a recommended baseline, not the only possible shape. What matters is stability and explicitness.

---

## Top-level folders

### 1) `indexes/`

Purpose:
- navigation entry points
- manifests
- current-baseline pointers
- version summaries

Typical contents:
- `current-baseline.json`
- `version-index.md`
- `snapshot-manifest.json`
- `continuation-entry.md`

### 2) `working/`

Purpose:
- the active working area for the current round before freezing

Typical contents:
- current requirement skeleton
- current working demo files
- current working embedded-PRD draft
- current mapping files
- current change notes

Rule:
- files here are allowed to change
- files here are not automatically frozen baselines

### 3) `versions/`

Purpose:
- structured version-by-version asset grouping

Recommended shape:

```text
versions/
  v0.1/
  v0.2/
  v0.3/
```

Inside each version directory, keep a stable asset layout.

### 4) `snapshots/`

Purpose:
- frozen baseline copies or manifests
- exact delivery-ready or review-ready freeze points

Rule:
- if something is called a snapshot, it should not be silently overwritten

### 5) `historical/`

Purpose:
- deprecated or superseded artifacts that are still worth keeping for traceability

Rule:
- avoid mixing deprecated artifacts into current working areas

### 6) `attachments/`

Purpose:
- screenshots
- source exports
- reference images
- supporting files that are not primary structured artifacts

---

## Version directory layout

Inside each `versions/vX.Y/`, use a stable structure like:

```text
versions/
  v0.3/
    rules/
    demo/
    prd/
    mappings/
    diffs/
    meta/
```

### `rules/`
Store:
- requirement skeleton snapshots
- rule baselines
- readiness summaries
- confirmed/pending summaries

### `demo/`
Store:
- demo page files
- state demos
- interaction-specific demo fragments
- iteration notes if they belong to this version

### `prd/`
Store:
- embedded-prd.html
- embedded-prd.md
- review-index.html
- other delivery-oriented PRD views

### `mappings/`
Store:
- rule ↔ page ↔ state ↔ config ↔ demo mapping manifests
- linkage metadata

### `diffs/`
Store:
- version-to-version change notes
- deltas from previous baseline

### `meta/`
Store:
- version metadata
- stage labels
- freeze notes
- replacement/deprecation relations

---

## Working area layout

A practical `working/` shape may mirror the version shape lightly:

```text
working/
  rules/
  demo/
  prd/
  mappings/
  notes/
```

Use this for current iteration.

When a round becomes important enough, freeze it into:
- a version directory
- and optionally a snapshot manifest

---

## Snapshot rules

A snapshot should represent a coherent baseline, not a random subset of files.

A meaningful snapshot should ideally identify:
- rule baseline version
- demo baseline version
- PRD baseline version
- mapping baseline version
- current stage (`draft`, `review`, `frozen`, etc.)
- timestamp
- replacement relationship, if any

Recommended minimal snapshot manifest fields:

```json
{
  "version": "v0.3",
  "stage": "review",
  "ruleBaseline": "versions/v0.3/rules/rule-baseline.md",
  "demoBaseline": "versions/v0.3/demo/",
  "prdBaseline": "versions/v0.3/prd/embedded-prd.html",
  "mappingBaseline": "versions/v0.3/mappings/linkage.json",
  "replaces": "v0.2"
}
```

---

## Current main entry rules

At project level, there should always be an easy answer to:
- what should I open first?

Recommended current-entry pointers:
- `indexes/current-baseline.json`
- `indexes/continuation-entry.md`

These should point to:
- current main version
- current working/delivery state
- best files to open next

Do not force users or downstream skills to rediscover entry points manually.

---

## Stage conventions

Use a small, stable set of stage labels. Current recommended set:
- `draft`
- `review`
- `frozen`
- `historical`
- `deprecated`

Meaning:
- `draft`: active working state
- `review`: coherent enough for review, but not final-frozen
- `frozen`: intentionally preserved baseline
- `historical`: old but still informative
- `deprecated`: replaced and not recommended for reuse

Avoid inventing too many custom labels per project.

---

## Naming rules

### Project folder
Use a clear project slug, preferably stable and human-readable.

### Version folder
Use stable version naming such as:
- `v0.1`
- `v0.2`
- `v1.0`

### Main files
Prefer descriptive names over vague names.

Good:
- `rule-baseline.md`
- `demo-overview.md`
- `embedded-prd.html`
- `linkage.json`
- `version-notes.md`

Avoid:
- `new.md`
- `final-final.html`
- `latest2.json`
- `temp-demo.html`

---

## Migration-friendly rules

To keep migration easy:
- do not hardcode absolute Windows paths inside project artifacts unless necessary
- prefer relative references between files inside the same project
- keep the entire project self-contained under one project directory where practical
- let the root path change without forcing internal structure changes

This matters when moving from:
- C drive to another drive
- Windows to Mac
- one client environment to another

---

## Anti-patterns

Avoid these structure failures:

### 1) Flat dumping
All files live in one folder; version relationships exist only in people's heads.

### 2) Mixed current and historical files
Deprecated artifacts sit next to current working files with no labeling.

### 3) Snapshot without coherence
A snapshot exists, but it does not clearly say which rule/demo/PRD/mapping set it belongs to.

### 4) Entry-point ambiguity
There are many files, but no clear "open this first" path.

### 5) Platform-bound organization
The project only makes sense with one machine's absolute path assumptions.

### 6) Stage inflation
Too many custom stage labels make the workflow harder to follow instead of clearer.

---

## Minimum viable structure

If starting small, the minimum acceptable project structure is:

```text
{project-slug}/
  indexes/
    current-baseline.json
  working/
    rules/
    demo/
    prd/
  versions/
    v0.1/
      rules/
      demo/
      prd/
      mappings/
      meta/
```

This is enough to:
- continue work
- freeze a version
- find the current baseline
- avoid major confusion

Anything less than this should be treated as an ad hoc temporary workspace, not a stable PM project structure.
