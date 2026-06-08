# Field, Linkage & Interaction Examples (on-demand)

Load only when writing field-level detail, linkage/hierarchy cascades, interaction forms, or weight/drag sorting. Core rules stay in `SKILL.md`.

## Field Detail Pattern

For each important field, cover four elements whenever applicable: requiredness (必填/选填), type (文本、数字、单选、多选、开关、图片、选择器、日期等), constraint (length, range, count, selectable values, format, uniqueness, or dependency), default (default value or `无默认值`).

Write field detail in this pattern:

```text
字段名：必填，类型，默认值；核心限制。
- Secondary display, linkage, validation, save, or exception rules.
- Put field-level behavior near the field, not in a distant section.
```

Example:

```text
入口名称：必填，文本，最多 64 字，无默认值。

展示图：选填，图片，从资源库选择，无默认值；不创建资源关联关系。

关联对象：必填，选择器，使用已有对象选择弹窗，无默认值。
- 选择后展示关联对象名称。
- 修改入口类型后，已选择的关联对象自动清空。

定位项：选填，选择器，来源于已选择关联对象，无默认值。
- 仅当关联对象类型支持定位项时可选择。
- 不选择定位项时，入口关联对象全量；选择定位项时，入口只关联该定位项范围。
- 保存时校验同一父对象、同一关联对象、同一定位项只能被一个入口引用。
```

For fields displayed in lists or cards, also define display behavior:

- Overflow: max characters, max items, or line count.
- Abbreviation: ellipsis, comma-separated text, line break, or tag wrap.
- Full view: hover tooltip, click to expand, detail modal, or no full view.

Do not write vague display rules such as `内容过多时截断展示`; specify the threshold and full-view behavior.

## Page / Module Example

```text
## 3.1 左侧：对象层级树

展示规则：展示父对象下的分组与子项层级，支持展开/收起；点击子项后，右侧展示该子项配置内容。

新增/编辑分组：
- 分组名称：必填，文本，最多 64 字，无默认值。
- 是否隐藏：单选，默认显示。
- 排序权重：数字，默认 0，数值越大越靠前。
- 保存成功后左侧层级树刷新。
- 保存失败时弹窗保持打开，已填数据不丢失。

删除分组：二次确认；删除后该分组下子项、模块、入口一并删除，且无法恢复。
```

## Linkage And Hierarchy Rules

Write linkage in both directions.

- If `A` affects `B`, also state what happens when `B` changes, is cleared, or becomes invalid.
- If a field switch clears other fields, name the cleared fields.
- If a field switch keeps values, explain whether hidden values still participate in validation or output.

For hierarchical structures, define cascade behavior for: delete, hide/show, move, disable/enable, copy, sort.

Example:

```text
关键逻辑：
- 层级关系：父对象 > 分组 > 子项 > 模块 > 入口。
- 删除影响范围：删除上级会带走下级。
- 排序规则：权重越大越靠前；权重相同时按创建时间倒序。
- 显示隐藏：隐藏不展示，但隐藏入口仍参与访问权限规则。
- 入口引用校验：同一父对象、同一关联对象只能有一个全量入口；同一父对象、同一关联对象、同一定位项只能有一个入口。
- 访问规则：进入定位项第一页；局部入口优先，全量入口兜底，未命中不可访问。
- 权限规则：免费入口直接访问；受限入口按权限标签判断。
```

For priority rules, define: judgment order, fallback behavior for each layer, field clearing or retaining rules when switching modes, what happens when no rule is hit.

When the priority rule has several branches, use a flow tree or decision table instead of a long sentence list.

Example flow tree:

```text
对象访问类型判断
  └─ 受限且无访问资格 → 弹访问引导
  └─ 其余 → 继续

入口是否免费
  └─ 免费 → 直接进入
  └─ 受限 → 继续

权限标签判断
  └─ 已配置 + 有权限 → 进入
  └─ 已配置 + 无权限 → 弹权限开通引导
  └─ 未配置 → Toast「内容准备中」，不进入
```

If using a decision table, keep columns small and product-facing. Avoid turning it into an API or database spec.

## Interaction Form Rules

If an operation's interaction form is not obvious, define it explicitly.

- Move: drag-and-drop, target-selection modal, or move-up/move-down buttons.
- Sort: numeric weight, drag sorting, manual sequence, or backend default order.
- Search: realtime input, query button, enter-to-search, or delayed debounce.
- Multi-select: checkbox, batch toolbar, disabled rows, cross-page selection behavior.
- Wizard: entry condition for each step, revalidation before next step, and concurrent validation at final save.

Do not let high-cost interactions hide behind words like `支持调整`, `可配置`, or `按规则判断`.

### Weight Sorting + Drag Sorting

When a backend page already has a numeric `排序权重` field and adds drag sorting, do not describe it as a pure UI interaction. Treat drag sorting as another operation for updating persisted weight values.

The PRD must define:

- Initial order: the page still initializes by sorting weight descending; ties use the existing fallback, usually creation time descending.
- Save timing: drag updates are submitted when the user releases the dragged item.
- Persistence model: drag sorting updates `排序权重`; it is not an independent hidden order field unless explicitly designed as one.
- Insert calculation: when dropped between two items, define how the new weight is calculated. For the common "front-adjacent insert" pattern, use `previous item weight - 1`.
- Top and bottom bounds: when moved to the top, use `first item weight + 1`; if the first item is already at the upper bound, trigger reweighting. When moved to the bottom, use `last item weight - 1`; if the last item is already at the lower bound, trigger reweighting.
- Reweighting trigger: if the drop position cannot produce a valid integer weight, trigger reweighting for the current sorting context.
- Reweighting scope: define the current context, such as all sections under the current lesson, all entries under the current section, all products under the current category, or another bounded group.
- Interaction state: while the reorder request is pending, show loading and disable further drag gestures. On success, keep the new order and show the latest weight values. On failure, roll back to the previous order and show an error.
- State lock: if enabled/disabled status controls editability, explicitly state whether drag sorting is disabled and how the drag handle appears.

Use a concrete example when the weight behavior is easy to misread:

```text
拖到两个对象之间时，新权重优先取前一项权重 - 1。
- 示例：A 权重 99，B 权重 90，C 权重 80。
- 将 C 拖到 A 和 B 中间后，C 新权重 = 99 - 1 = 98。
- 更新后顺序为 A 99、C 98、B 90。
```
