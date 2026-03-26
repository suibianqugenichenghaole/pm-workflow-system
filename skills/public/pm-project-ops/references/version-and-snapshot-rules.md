# Version and Snapshot Rules

Use this reference when `pm-project-ops` needs to manage version tags, stage labels, freeze points, and baseline relationships between rule/demo/PRD artifacts.

The goal is to make it impossible to confuse:
- current working state
- review state
- frozen baseline
- historical/deprecated artifacts

---

## Core idea

A version number alone is not enough.

To manage PM workflow assets correctly, you need at least:
- a version tag
- a stage label
- a baseline relationship
- a replacement/deprecation relationship

Without these, a project may have many files that look organized but still fail the most important question: which set is the current truth?

---

## Version tags

Use stable, human-readable version tags such as:
- `v0.1`
- `v0.2`
- `v0.3`
- `v1.0`

Rules:
- prefer monotonic progression
- avoid ambiguous names like `latest`, `final2`, `newest`, `test-final`
- keep the same version tag across related baseline artifacts when they belong to the same effective round

Examples:
- `rule-v0.3`
- `demo-v0.3`
- `prd-v0.3`
- `mapping-v0.3`

---

## Stage labels

Recommended default set:
- `draft`
- `review`
- `frozen`
- `historical`
- `deprecated`

### `draft`
Meaning:
- actively editable
- not yet a stable baseline
- may still change frequently

### `review`
Meaning:
- coherent enough for discussion/review
- should be interpreted as a candidate baseline, not final truth

### `frozen`
Meaning:
- intentionally preserved baseline
- should not be silently overwritten
- may still be superseded later, but remains a stable reference point

### `historical`
Meaning:
- no longer current
- still useful for understanding project evolution or decisions

### `deprecated`
Meaning:
- explicitly superseded
- not recommended as a continuation point

---

## Baseline relationship rules

A useful PM workflow baseline is usually not one file. It is a matched set.

A baseline should ideally connect:
- one rule baseline
- one demo baseline
- one PRD baseline
- one mapping baseline
- one version tag
- one stage label

Example baseline set:
- `rule-v0.3`
- `demo-v0.3`
- `prd-v0.3`
- `mapping-v0.3`
- `stage: review`

This means:
- all four artifacts belong to the same effective round
- they should be reviewed or continued together unless explicitly noted otherwise

---

## Freeze rules

Freeze when:
- the current round is coherent enough that downstream work needs a stable reference
- rule/demo/PRD/mapping alignment is good enough to preserve
- a review package needs to be kept
- an older baseline is about to be superseded and must remain traceable

Do not freeze when:
- artifacts are still wildly drifting
- major rule-change signals are still unresolved
- the current round is only an exploratory scratch state

### Freeze rule of thumb
Freeze only when you would be comfortable saying:
- "this is the current truth for this round"
- or "this is the exact review candidate we used"

---

## Replacement rules

Whenever a newer baseline supersedes an older one, record that relationship explicitly.

At minimum, store:
- current version
- replaced version (if any)
- reason for replacement (optional but useful)

Example:

```json
{
  "version": "v0.4",
  "stage": "review",
  "replaces": "v0.3"
}
```

If a version is no longer recommended for continuation, mark it as:
- `historical`, or
- `deprecated`

Do not rely on timestamps alone to imply replacement.

---

## Snapshot rules

A snapshot is a preserved point-in-time baseline.

A snapshot should answer:
- what version is this?
- what stage was it in?
- which rule/demo/PRD/mapping files belong to it?
- what did it replace?
- is it still current or only historical?

### Minimum snapshot manifest fields

```json
{
  "version": "v0.3",
  "stage": "review",
  "ruleBaseline": "versions/v0.3/rules/rule-baseline.md",
  "demoBaseline": "versions/v0.3/demo/",
  "prdBaseline": "versions/v0.3/prd/embedded-prd.html",
  "mappingBaseline": "versions/v0.3/mappings/linkage.json",
  "replaces": "v0.2",
  "status": "current"
}
```

### Snapshot overwrite rule

Never silently overwrite a frozen snapshot.
If a new round supersedes it, create a new version/snapshot and mark the old one as:
- `historical`, or
- `deprecated`

---

## Working vs baseline distinction

Do not confuse:
- the current working area
- the current effective baseline

### Working area
May contain:
- experiments
- partial rewrites
- not-yet-frozen changes
- intermediate files

### Current effective baseline
Should contain:
- the currently trusted round for continuation/review/delivery
- stable references to rule/demo/PRD/mapping

A project may have a working area newer than the current baseline. That is okay.
What is not okay is failing to label the difference.

---

## Main-entry rule

At any time, there should be one easy answer to:
- what should a person or downstream skill open first?

Recommended current-entry pointers:
- `indexes/current-baseline.json`
- `indexes/continuation-entry.md`

These should identify:
- current main version
- current stage
- current baseline files
- best continuation path

---

## Typical lifecycle example

### Round 1
- `v0.1 draft` → active requirement/demo exploration

### Round 2
- `v0.1 review` → coherent enough for review
- freeze snapshot if needed

### Round 3
- `v0.2 draft` → changes start after review feedback

### Round 4
- `v0.2 frozen` → accepted baseline for current delivery round
- `v0.1` becomes `historical`

This is only an example. The point is to preserve explicit transitions.

---

## Anti-patterns

Avoid these failures:

### 1) Version-only management
There is a version tag, but no stage, no baseline relation, and no replacement chain.

### 2) Snapshot inflation
Everything becomes a snapshot, making none of them meaningful.

### 3) Hidden supersession
A new version exists, but the old version is never marked historical/deprecated.

### 4) Working-baseline confusion
People keep editing the file everyone thinks is already the frozen baseline.

### 5) Cross-artifact desync
Rule/demo/PRD all have the same apparent version number, but are actually from different rounds.

---

## Minimum viable rules

If keeping things simple, at minimum enforce:
- one stable version tag per round
- one stage label per round
- explicit rule/demo/PRD/mapping pairing
- one current main entry
- explicit replacement of previous round
- no silent overwrite of frozen material

If these six things are not true, versioning is not yet trustworthy.
