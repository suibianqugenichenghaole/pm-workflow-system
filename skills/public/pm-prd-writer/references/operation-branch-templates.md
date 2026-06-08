# Operation Branch Templates (on-demand)

Load only when writing operation rules, state/boundary scenarios, or acceptance criteria for a PRD. These are reusable copy-ready templates; keep the core rules in `SKILL.md`.

## Operation Rules

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

## State And Boundary Rules

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

## Acceptance Criteria Rules

Acceptance criteria are not mandatory for every module. Add them only when they reduce implementation or testing ambiguity.

Write acceptance criteria in the PRD body when a module or operation is:

- complex enough that frontend, backend, or QA may interpret the result differently
- high-risk, such as save, delete, publish, enable/disable, permission, payment, access, approval, batch operation, or cross-layer output
- state-heavy, such as involving empty, disabled, failed, timeout, partial success, historical, or referenced-deleted states
- validation-heavy, such as uniqueness, upper/lower bounds, required combinations, or dependency clearing
- configuration-driven, where different config values change display, available actions, or downstream behavior

Do not force acceptance criteria into simple display-only modules when the page/module rules are already clear.

Prefer Chinese condition-result wording rather than forcing English `Given / When / Then` into the final PRD:

```text
验收标准：
- 当{条件}时，系统应{结果}。
- 若{异常/边界}，则{处理方式}。
- 保存成功后，{数据/页面/状态变化}。
- 保存失败时，{提示/回退/保留输入/重试规则}。
```

For complex modules, cover only the relevant branches:

- happy path
- validation failure
- permission or role restriction
- boundary or quantity limit
- empty or unavailable dependency
- save/delete/update failure
- timeout or retry behavior
- partial success for batch operations
- data persistence or rollback expectation

Keep acceptance criteria close to the affected module or operation. Do not collect all criteria in a distant final section unless the user asks for a standalone QA-style checklist.

Do not turn the PRD into a full test-case document. Acceptance criteria should clarify product behavior, not enumerate every test step, device, browser, or implementation detail.
