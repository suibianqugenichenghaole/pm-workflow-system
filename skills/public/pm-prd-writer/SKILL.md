---
name: pm-prd-writer
description: Write page-oriented, development-readable Chinese PRD / requirement documents from already discussed product requirements. Use when the user asks to write or rewrite a 需求文档 / PRD, make requirements developer-readable, follow a fixed demand-document format, or organize page structure, interactions, field rules, key logic, and out-of-scope scope without scattering information.
---

# PM PRD Writer

Use this skill to turn clarified product requirements into a compact, structured PRD that frontend, backend, and testing can implement from.

This skill is for writing the requirement document, not for discovering the requirement. If the requirement is still unclear, return to `pm-requirement-intake` first.

## Do Not Use When

- the requirement is still unclear → `pm-requirement-intake`
- the task is embedded/linked delivery → `pm-embedded-prd`
- the task is only project storage/versioning → `pm-project-ops`

## 1. Before Writing

For active PM workflow projects:
1. Read project-local memory first (`current.md`, `decisions.md`, `open-questions.md`).
2. Read the current prototype, page baseline, or screenshot-derived page structure when it exists.
3. Write from the actual current page/prototype. Do not invent page modules, fields, states, or interactions.

Dated change baseline (for active PM workflow PRD updates):
- Read project-local `current.md` and `changelog.md`.
- Extract PRD-impacting requirement changes by date (`YYYY-MM-DD` minimum).
- If the user says "today"/"this round"/"latest", map that to the current local date and include only confirmed changes from that date plus the current conversation.
- Keep a short internal checklist of which dated changes are being applied; do not rewrite a PRD from an old pasted document when project-local memory has newer dated changes.

Separate document work from prototype work:
- If the user asks only for PRD text, do not change the prototype.
- If the PRD introduces UI/behavior missing from the prototype, mention the prototype needs a separate update, but keep that note out of the PRD body unless asked.
- Project-specific decisions belong in project-local memory or project docs, not in this skill.

## 2. Default PRD Structure

```text
# 1. 功能定位
# 2. 业务定义
# 3. 页面结构
## 3.1 页面 / 模块名称
### 3.1.1 展示规则
### 3.1.2 新增 / 编辑 / 删除 / 配置
# 4. 关键逻辑
# 5. 本期不处理
```

Adjust section names to fit the feature, but keep the thinking order: why it exists → what terms mean → how each page/module behaves → cross-module rules → what is out of scope.

When the PRD is embedded into a prototype/left-document panel, do not add a standalone title; start directly from `# 1. 功能定位`.

## 3. Writing Flow

1. Define the product layer: backend config, App/client behavior, shared capability, or cross-layer summary.
2. State feature purpose and business definitions.
3. Build the page/module skeleton from the current prototype or confirmed requirement.
4. Write fields under the module or dialog where they appear.
5. Write actions and operation results.
6. Write state, boundary, and exception rules near the affected module.
7. Write cross-module / cross-layer key logic.
8. Write `本期不处理`.
9. Run the final self-check (§13) and revise before returning.

Use conclusion-first wording. Prefer short `condition -> result` statements, e.g. `超出上限时按钮置灰，hover 提示“已达到模板数量上限（50个）”。`

## 4. Style Rules

- Output PRDs in Markdown. Use numeric headings (`# 1. 功能定位`, `## 3.1 教材列表`).
- Use `-` bullets for parallel items, field descriptions, rule lists, boundary scenarios, key logic; two-space nested indent.
- Use `**text**` only for useful emphasis.
- Do not over-fragment: keep related statements together; do not put every sentence on its own line.
- Write each complete rule once under its owning module/field, then reference it briefly elsewhere. Global state rules (e.g. `启用态不可编辑`) go once in a global rules section.
- State the rule first; add examples only when they reduce ambiguity.
- For multi-step judgment logic, prefer a compact flow tree or decision table over long prose.
- Do not write database tables, API schemas, code fields, or cost estimates unless explicitly asked.
- Do not describe existing shared components in detail unless the requirement changes them.
- Do not use tables by default for small dialogs or short modules; flatten the few fields and rules into bullets.
- Pure explanatory paragraphs may remain normal prose when that reads better.
- For large/repeated PRDs, see `references/large-prd-compression.md` (positioning sentences, global-rule extraction, table-vs-bullet rules, multi-layer document boundaries).

## 5. Page And Module Rules

Write by page and module. Put related dialogs under their owning module; do not create disconnected dialog sections. Page/module structure comes before field detail. Inside field-centric dialogs/settings pages, organize by field, not by lifecycle stage.

A worked page/module example is in `references/field-linkage-interaction.md`.

## 6. Field Rules

For each important field cover four elements when applicable: requiredness (必填/选填), type, constraint (length/range/count/values/format/uniqueness/dependency), default. Put field-level behavior near the field, not in a distant section. For list/card fields, also define overflow, abbreviation, and full-view behavior — specify thresholds, never vague `内容过多时截断展示`.

Field-detail pattern and full examples: `references/field-linkage-interaction.md`.

## 7. Operation Rules

Write important operations with full branches: success, failure, timeout/retry when relevant, boundary result, partial success for batch, state after operation.

Copy-ready templates for add/edit modal, uniqueness validation, single delete, batch delete, realtime switch, copy/clone: `references/operation-branch-templates.md`.

## 8. State And Boundary Rules

Add boundary scenarios only when they affect implementation or review; keep them close to the affected module. Categories: empty data, network exception, extreme cases, invalid state. For state-lock and readonly-reference designs, define lock granularity / exceptions / disabled visuals / sync timing.

Examples and the state-lock/readonly checklists: `references/operation-branch-templates.md`.

## 9. Linkage And Hierarchy Rules

Write linkage both ways: if `A` affects `B`, also state what happens when `B` changes/clears/invalidates. Name cleared fields on switch; state whether hidden values still validate. For hierarchies, define cascade for delete/hide/move/disable/copy/sort. For priority rules, define judgment order, per-layer fallback, field clear/retain, and no-rule-hit behavior; use a flow tree when branches multiply.

Linkage examples and the flow-tree pattern: `references/field-linkage-interaction.md`.

## 10. Interaction Form Rules

Define non-obvious interaction forms explicitly (move, sort, search, multi-select, wizard). Do not hide high-cost interactions behind `支持调整` / `可配置` / `按规则判断`. When a numeric `排序权重` field gains drag sorting, treat drag as a persisted-weight update, not pure UI.

Full interaction + weight/drag-sorting spec: `references/field-linkage-interaction.md`.

## 11. Acceptance Criteria Rules

Not mandatory per module. Add only when a module/operation is complex, high-risk, state-heavy, validation-heavy, or configuration-driven. Prefer Chinese condition-result wording; keep criteria close to the affected module; do not turn the PRD into a test-case document.

Branch list and templates: `references/operation-branch-templates.md`.

## 12. Out Of Scope

`本期不处理` should contain product/business scope boundaries, not writing-process disclaimers.

Good: `本期不处理历史数据批量迁移。` / `本期不处理 App 端新样式，只复用现有入口展示组件。` / `本期不处理跨教材复制入口。`
Avoid: `本期不定义数据库字段。` / `本期不写接口。` (writing boundaries, not product scope) unless the user explicitly asks for a technical boundary section.

## 13. Final Self-Check

Before returning the PRD, check from these roles:
- Frontend: can modules, fields, dialogs, states, interactions be drawn without guessing?
- Backend: are validation, matching order, uniqueness, persistence concrete enough to implement?
- Test: can each field, action, save validation, deletion scope, empty state, and App access rule be verified?

Then run the 15-item rule-coverage checklist in `references/final-self-check.md`.

If any answer is no, revise before returning. Do not knowingly hand back scattered logic, missing modules, invented states, or vague rules.

## 14. Memory And Workflow

- Stable PRD-writing rules belong in this skill.
- Project-specific decisions belong in project-local memory or project docs.
- If requirement logic changes during writing, update project memory only after the user approves or asks to remember it.
- If the PRD becomes part of an embedded PRD or review baseline, let `pm-project-ops` manage storage, versioning, and baseline relationships.

## On-Demand References

Load only the smallest relevant file when the current PRD cannot proceed without it. Do not load by default.
- `references/operation-branch-templates.md`: add/edit/delete/batch/switch/copy branches, state/boundary examples, acceptance criteria detail.
- `references/field-linkage-interaction.md`: field-detail pattern, page/module example, linkage cascades, flow tree, interaction forms, weight/drag sorting.
- `references/large-prd-compression.md`: global-rule extraction, table-vs-bullet rules, multi-layer document boundaries.
- `references/final-self-check.md`: full 15-item rule-coverage checklist for §13.
