---
name: pm-prd-writer
description: Write page-oriented, development-readable Chinese PRD / requirement documents from already discussed product requirements. Use when the user asks to write or rewrite a 需求文档 / PRD, make requirements developer-readable, follow a fixed demand-document format, or organize page structure, interactions, field rules, key logic, and out-of-scope scope without scattering information.
---

# PM PRD Writer

Use this skill to turn clarified product requirements into a compact, structured PRD that frontend, backend, and testing can implement from.

This skill is for writing the requirement document, not for discovering the requirement from scratch. If the requirement itself is still unclear, return to requirement intake before writing the PRD.

## 1. Before Writing

For active PM workflow projects:

1. Read project-local memory first.
2. Read the current prototype, page baseline, or screenshot-derived page structure when it exists.
3. Read relevant project decisions and open questions.
4. Write from the actual current page/prototype. Do not invent page modules, fields, states, or interactions.

Separate document work from prototype work:

- If the user asks only for PRD text, do not change the prototype.
- If the PRD introduces UI or behavior missing from the prototype, mention that the prototype needs a separate update, but do not insert that note into the PRD body unless the user asks for it.
- Project-specific decisions belong in project-local memory or project docs, not in this skill.

## 2. Default PRD Structure

Use this order unless the user gives a specific format:

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

Adjust section names to fit the feature, but keep the thinking order:

- why this exists
- what terms mean
- how each page/module behaves
- what cross-module rules must hold
- what is explicitly out of scope

When the PRD will be embedded into a prototype or left-document panel, do not add a standalone title like `# 公用教材管理 PRD`; start directly from `# 1. 功能定位`.

## 3. Writing Flow

Write in this sequence:

1. Define the product layer: backend configuration, App/client behavior, shared capability, or cross-layer summary.
2. State the feature purpose and business definitions.
3. Build the page/module skeleton from the current prototype or confirmed requirement.
4. Write fields under the module or dialog where they appear.
5. Write actions and operation results.
6. Write state, boundary, and exception rules near the affected module.
7. Write cross-module or cross-layer key logic.
8. Write `本期不处理`.
9. Run the final self-check and revise before returning.

Use conclusion-first wording. Prefer short `condition -> result` statements, for example:

```text
超出上限时按钮置灰，hover 提示“已达到模板数量上限（50个）”。
```

## 4. Style Rules

- Output PRDs in Markdown format by default.
- Use numeric headings, such as `# 1. 功能定位`, `## 3.1 教材列表`, `### 3.1.1 顶部筛选`.
- Use unordered `-` bullets for parallel items, field descriptions, rule lists, boundary scenarios, and key logic.
- Use two-space indentation for nested bullets.
- Use `**text**` only for useful emphasis.
- Do not use tables by default; flatten fields and rules into bullets.
- Do not over-fragment. Keep related statements together instead of putting every sentence on a separate line.
- Pure explanatory paragraphs may remain normal prose when that reads better.
- Do not write database tables, API schemas, code fields, or technical cost estimates unless the user explicitly asks.
- Do not describe existing shared components in detail unless the requirement changes them. Refer to them as existing components, for example `关联链接：使用已有关联链接选择弹窗。`

## 5. Page And Module Rules

Write by page and module.

- If a module has related dialogs, put those dialogs under the module.
- Do not create disconnected dialog sections when the dialog belongs to a list, tree, card, tab, or settings module.
- Page/module structure comes before field detail.
- Inside field-centric dialogs and settings pages, organize by field rather than lifecycle stage.

Example:

```text
## 3.1 左侧：单元与课时树

展示规则：展示教材下的单元与课时层级，支持展开/收起；点击课时后，右侧展示该课时配置内容。

新增/编辑单元：
- 单元名称：必填，文本，最多 64 字，无默认值。
- 是否隐藏：单选，默认显示。
- 排序权重：数字，默认 0，数值越大越靠前。
- 保存成功后左侧单元树刷新。
- 保存失败时弹窗保持打开，已填数据不丢失。

删除单元：二次确认；删除后该单元下课时、板块、入口一并删除，且无法恢复。
```

## 6. Field Rules

For each important field, cover four elements whenever applicable:

- Requiredness: 必填 / 选填.
- Type: 文本、数字、单选、多选、开关、图片、选择器、日期等.
- Constraint: length, range, count, selectable values, format, uniqueness, or dependency.
- Default: default value or `无默认值`.

Write field detail in this pattern:

```text
字段名：必填，类型，默认值；核心限制。
- Secondary display, linkage, validation, save, or exception rules.
- Put field-level behavior near the field, not in a distant section.
```

Example:

```text
入口标题：必填，文本，最多 64 字，无默认值。

封面：选填，图片，从素材中心选择，无默认值；不创建素材关联关系。

关联链接：必填，选择器，使用已有关联链接选择弹窗，无默认值。
- 选择后展示关联内容名称。
- 修改入口类型后，已选择的关联链接自动清空。

定位项：选填，选择器，来源于已选择关联内容对象，无默认值。
- 仅当关联链接类型支持定位项时可选择。
- 不选择定位项时，入口关联内容全量；选择定位项时，入口只关联该定位项范围。
- 保存时校验同教材同内容同定位项只能被一个入口引用。
```

For fields displayed in lists or cards, also define display behavior:

- Overflow: max characters, max items, or line count.
- Abbreviation: ellipsis, comma-separated text, line break, or tag wrap.
- Full view: hover tooltip, click to expand, detail modal, or no full view.

Do not write vague display rules such as `内容过多时截断展示`; specify the threshold and full-view behavior.

## 7. Operation Rules

Write important operations with full branches:

- success
- failure
- timeout or retry behavior when relevant
- boundary result
- partial success for batch operations
- state after operation

### Add / Edit Modal

```text
- 新增弹窗标题：新增{对象}。
- 编辑弹窗标题：编辑{对象}。
- 编辑时所有字段回显当前{对象}配置。
- 保存成功：关闭弹窗，刷新列表 / 详情。
- 保存失败：Toast 提示“保存失败，请重试”，弹窗保持打开，已填数据不丢失。
- 保存超时：Toast 提示“保存超时，请重试”，弹窗保持打开，已填数据不丢失。
```

### Uniqueness Validation

```text
- {字段名}与已有{对象}重复：字段下方提示“{字段名}已存在”，禁止保存。
```

### Single Delete

```text
- 单条删除无引用：弹出确认框“确认删除该{对象}？删除后无法恢复。”用户确认后删除。
- 单条删除存在引用：不弹删除确认框，Toast 提示“该{对象}已被{引用方}引用，无法删除”。
- 删除成功：Toast 提示“删除成功”，刷新列表。
- 删除失败：Toast 提示“删除失败，请重试”，列表保持不变。
```

### Batch Delete

```text
- 未选择任何{对象}：批量删除按钮置灰不可点击。
- 全部无引用：弹出确认框“确认删除选中的 X 个{对象}？删除后无法恢复。”用户确认后批量删除。
- 部分有引用：弹出确认框“X 个{对象}可删除，Y 个已被{引用方}引用不可删除。是否继续删除可删除{对象}？”用户确认后只删除无引用{对象}。
- 全部有引用：不弹删除确认框，Toast 提示“所选{对象}均已被{引用方}引用，无法删除”。
- 批量删除成功：Toast 提示“删除成功”，刷新列表。
- 批量删除部分失败：Toast 提示“部分{对象}删除失败，请重试”，刷新列表并保留失败项。
- 批量删除全部失败：Toast 提示“删除失败，请重试”，列表保持不变。
```

### Realtime Switch

```text
- 开关实时生效，不需要额外保存。
- 切换成功：Toast 提示“更新成功”。
- 切换失败：开关回滚到原状态，并 Toast 提示“更新失败，请重试”。
```

### Copy / Clone

For copy or clone actions, define:

- Naming: default copied name and overflow handling.
- Copied fields: business fields, status, sorting, and child structures copied from source.
- Non-copied fields: ID, references, creation time, usage counts, audit records, or source-specific links.
- Initial status: enabled, disabled, or copied from source.
- List position: inserted first, inserted last, or placed by sorting rule; if sorting ties, define tie-breaker.

## 8. State And Boundary Rules

Add boundary scenarios only when they affect implementation or review. Keep them close to the affected module when possible.

Cover these categories when relevant:

- Empty data: first entry, no content, no search result, no selectable options.
- Network exception: load failure, save failure, timeout, retry result.
- Extreme cases: quantity limit, overlong content, too many references, concurrent operation, scroll or layout overflow.
- Invalid state: referenced object deleted, data expired, current object modified or deleted by someone else.

Example:

```text
当前学科无模板：左侧展示空态 +「添加模板」入口，右侧不展示内容。
模板数量达上限 50 个：添加按钮置灰，hover 提示“已达到模板数量上限（50个）”。
保存失败：Toast 提示“保存失败，请重试”，弹窗保持打开，已填数据不丢失。
```

For state-lock designs such as `enabled / disabled controls editability`, define:

- lock granularity
- exception controls
- exception reasons
- disabled visual behavior for each interaction type
- whether data can still be viewed, copied, exported, sorted, or referenced

For readonly referenced fields, define:

- update timing
- whether source changes sync in realtime or by snapshot
- behavior when source data is deleted or invalid
- whether users can manually refresh or reselect

## 9. Linkage And Hierarchy Rules

Write linkage in both directions.

- If `A` affects `B`, also state what happens when `B` changes, is cleared, or becomes invalid.
- If a field switch clears other fields, name the cleared fields.
- If a field switch keeps values, explain whether hidden values still participate in validation or output.

For hierarchical structures, define cascade behavior for:

- delete
- hide/show
- move
- disable/enable
- copy
- sort

Example:

```text
关键逻辑：
- 层级关系：教材 > 单元 > 课时 > 板块 > 入口。
- 删除影响范围：删除上级会带走下级。
- 排序规则：权重越大越靠前；权重相同时按创建时间倒序。
- 显示隐藏：隐藏不展示，但隐藏入口仍参与内容访问权限规则。
- 入口引用校验：同教材同内容只能有一个全量入口；同教材同内容同定位项只能有一个入口。
- App 访问规则：进入定位项第一页；局部入口优先，全量入口兜底，未命中不可访问。
- 试学/权益：试学免费；权益标签用于会员卡判断。
```

For priority rules, define:

- judgment order
- fallback behavior for each layer
- field clearing or retaining rules when switching modes
- what happens when no rule is hit

## 10. Interaction Form Rules

If an operation's interaction form is not obvious, define it explicitly.

Examples:

- Move: drag-and-drop, target-selection modal, or move-up/move-down buttons.
- Sort: numeric weight, drag sorting, manual sequence, or backend default order.
- Search: realtime input, query button, enter-to-search, or delayed debounce.
- Multi-select: checkbox, batch toolbar, disabled rows, cross-page selection behavior.
- Wizard: entry condition for each step, revalidation before next step, and concurrent validation at final save.

Do not let high-cost interactions hide behind words like `支持调整`, `可配置`, or `按规则判断`.

## 11. Document Boundary Rules

When one requirement spans backend configuration, App/client behavior, shared jump capabilities, and prototype updates, keep each PRD in its own product layer.

- Backend PRDs describe backend pages, fields, save validation, state locks, and configuration outputs.
- App/client PRDs describe client display, interaction, access order, runtime errors, and user-facing behavior.
- Shared capability PRDs describe cross-business contracts and responsibility boundaries.

Do not mix page layers:

- Do not put App access rules into a backend configuration PRD unless the backend field directly needs a short linkage note.
- Do not put backend save validation into a client PRD except as a source-of-truth reference.
- When a reusable capability is consumed by multiple businesses, write the shared capability first, then write each caller's configuration-domain rules.
- Do not accidentally describe one caller, such as a sync textbook, as the only caller when other callers such as all-functions or promotion slots also use the capability.
- Define the caller configuration domain explicitly. For conflict checks, say whether the domain is a whole textbook, one lesson, one campaign, one slot, or another boundary.

## 12. Out Of Scope

The `本期不处理` section should contain product/business scope boundaries, not writing-process disclaimers.

Good examples:

- 本期不处理历史数据批量迁移。
- 本期不处理 App 端新样式，只复用现有入口展示组件。
- 本期不处理跨教材复制入口。

Avoid:

- 本期不定义数据库字段。
- 本期不写接口。
- 本期不评估技术成本。

Those are writing boundaries and should stay outside the PRD unless the user explicitly asks for a technical boundary section.

## 13. Final Self-Check

Before returning the PRD, check it from these roles:

- Frontend: Can the page modules, fields, dialogs, states, and interactions be drawn without guessing?
- Backend: Are validation rules, matching order, uniqueness constraints, and persistence expectations concrete enough to implement?
- Test: Can each field, action, save validation, deletion scope, empty state, and App access rule be verified?

Then check the rule coverage:

1. Field completeness: important fields include requiredness, type, constraint, and default.
2. Operation branches: important operations include success, failure, and boundary outcomes.
3. Batch operations: all-success, partial-failure, and all-failure are covered.
4. Boundary scenarios: empty, network-failure, extreme, and invalid states are covered where they matter.
5. Display precision: truncation, tooltip, expansion, and multi-value display are concrete.
6. Scope boundary: `本期不处理` states real product scope exclusions.
7. Copy completeness: naming, copied fields, non-copied fields, initial status, and list position are defined.
8. Linkage: linked interactions are described both ways.
9. Reference mode: referenced data is realtime sync or snapshot.
10. Hierarchy cascade: delete, hide, move, disable, and copy cascades are clear where applicable.
11. Interaction form: move, sort, multi-select, search, and wizard forms are explicit when they exist.
12. State lock: lock granularity, exceptions, reasons, and disabled states are listed.
13. Readonly reference: update timing, source modification, source deletion, and invalid states are defined.
14. Priority rule: judgment order, fallback behavior, and field clearing/retaining rules are defined.
15. Field organization: field definition, linkage, validation, and field-level exceptions are not scattered.

If any answer is no, revise before returning. Do not knowingly hand back a draft with scattered logic, missing page modules, invented states, or vague implementation rules.

## 14. Memory And Workflow

- Stable PRD-writing rules belong in this skill.
- Project-specific decisions belong in the project's local memory or project docs.
- If requirement logic changes during PRD writing, update project memory only after the user approves the change or asks to remember it.
- If the PRD becomes part of an embedded PRD or review baseline, let `pm-project-ops` manage storage, versioning, and baseline relationships.
