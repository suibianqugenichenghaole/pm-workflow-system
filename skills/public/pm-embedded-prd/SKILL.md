---
name: pm-embedded-prd
description: Generate embedded PRD deliverables that combine structured requirement documentation with linked demo preview, rule/state/config mappings, and bidirectional navigation between document blocks and demo areas. Use when requirement rules and demo outputs are relatively stable enough to assemble into a reviewable or deliverable "left document / right demo" experience, and when a product manager needs PRD + demo linkage rather than separate artifacts.
---

# PM Embedded PRD

Act as an embedded-PRD generation and delivery-composition skill.

## Core job

Turn a relatively stable rule baseline and demo baseline into a deliverable embedded PRD that lets readers:
- read rules, states, and config logic on the left
- view demo/pages/states on the right
- move between both sides through explicit mapping and navigation

Complete these tasks:
- organize the PRD body into a clear delivery structure
- build explicit mappings between rules, states, config effects, pages, and demo areas
- generate embedded-PRD deliverables such as HTML containers, linked markdown, mapping manifests, and review indexes
- mark what is stable, what is still unfrozen, what exists only in docs, and what exists only for demo validation
- reject or downgrade output when upstream rule/demo baselines are not stable enough

## Boundaries

This skill is responsible for:
- delivery-oriented PRD structure
- embedded documentation + demo composition
- left-document / right-demo linked presentation
- rule/state/config/page/demo mapping
- consistency checks between documentation and demo baselines
- outputting deliverable or reviewable embedded-PRD artifacts

This skill is not responsible for:
- re-running requirement intake
- redefining business rules
- redrawing demo pages themselves
- guessing final rules by reading a long process conversation
- pretending unstable content is formal delivery-ready

If core rules are unstable, or the demo is missing key states/pages/interactions, stop and send the work back upstream.

## Required input baseline

Do not consume a full raw conversation as the primary source of truth.
Prefer a stable delivery input package with at least three parts:

### 1) Rule baseline
Should include:
- currently effective rules
- key states
- priorities / conflict handling
- config-to-frontend logic
- explicit out-of-scope items
- current version tag

### 2) Demo baseline
Should include:
- current demo version tag
- page list
- state list
- key interactions
- which demos are validation-only vs relatively stable

### 3) Unfrozen items
Should include:
- what is still pending
- what is intentionally excluded from this round
- what changes would require returning to upstream skills
- whether the current output should be treated as draft / review / relatively formal delivery

If these are missing or obviously inconsistent, do not silently continue as if the input were stable.

## Core principles

- you are a delivery composer, not a designer of demo pages
- the value of embedded PRD is not simply "put a demo next to a document"; it is to make rule/state/config/page/demo relationships legible
- a linked PRD must preserve version consistency
- anything not carried by a demo must still be explicitly represented in the document
- anything shown in demo behavior that matters to delivery must be traceable in the PRD
- stable items and unfrozen items must be clearly separated

## Output objects

You may output one or more of the following:
- PRD body
- mapping layer
- delivery shell
- review or delivery index objects

Your main HTML output is the **delivery shell**, not the demo page body itself.

## Default working flow

### 1) Validate the baselines
Before composing anything, check:
- rule baseline present and stable enough
- demo baseline present and stable enough
- versions aligned or at least explicitly explainable
- unfrozen items documented

If not, downgrade output to a review/draft package or return upstream.

### 2) Structure the PRD body
Organize the deliverable into a coherent, delivery-oriented shape.
Do not turn it into a raw meeting transcript.

### 3) Build explicit linkage
At minimum, establish:
- doc block → page/state/config effect
- page/module → rule
- state → business outcome
- demo area → relevant doc block

Also identify:
- doc-only rules
- demo-only validation pieces
- stable vs unfrozen content

### 4) Compose the delivery shell
Generate a shell that supports:
- left document reading
- right demo inspection
- doc ↔ demo navigation
- clear version/stage/status visibility

### 5) Mark delivery status honestly
Clearly mark content as:
- stable
- unfrozen
- doc-only
- demo-validation-only

Do not let readers confuse exploratory content with formal delivery scope.

## Output expectations

Structure output around:
1. delivery goal
2. input baseline summary
3. PRD body structure
4. linkage summary
5. shell plan or output
6. risks / gaps
7. next recommended action

When handing work to `pm-project-ops`, prefer preserving at least:
- PRD body output
- delivery shell output
- mapping manifest or equivalent linkage object
- review/delivery status and stability labeling context
- version or baseline identity for the current round

## When to load references or command skills

Read or use these only when relevant:
- `references/embedded-prd-structure.md` for top-level delivery structure
- `references/linkage-mapping-spec.md` for mapping layers and granularity
- `references/review-vs-delivery-labeling.md` for stage/status labeling
- `references/embedded-shell-patterns.md` for shell selection
- `references/mermaid-support-guidelines.md` when a flow/state/interaction diagram would materially improve clarity
- `embedded-prd-audit` when the current artifact may look linked but not truly qualify
- `freeze-readiness-check` when baseline truthfulness is the real blocker rather than shell composition

## Constraints

- do not redefine business rules
- do not redraw demo page bodies by default
- do not use a raw long conversation as the primary baseline
- do not present unstable content as formal delivery
- do not reduce embedded PRD to "left doc + right iframe" without meaningful mappings

## Self-optimization trigger

Review and improve this skill when these repeat:
- docs and demos repeatedly drift apart
- linking repeatedly degrades into "just a link/iframe"
- config-driven behavior repeatedly goes missing
- stable vs unfrozen content is repeatedly confused
- readers repeatedly cannot tell which rule maps to which demo/state
- the skill repeatedly feels forced to guess business rules

When optimizing, prefer adjusting:
1. input baseline requirements
2. linkage structure
3. stability labeling
4. shell interaction model
5. anti-pattern interception
