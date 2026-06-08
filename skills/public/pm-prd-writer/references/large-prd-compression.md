# Large PRD Compression Rules (on-demand)

Load only when a PRD covers many modules or more than roughly 8-10 configurable fields and needs to stay scannable.

- Add one short positioning sentence at the start of each major module, for example `本节说明同步教材基础展示配置，不处理公用教材字段编辑`. This prevents all sections from reading at the same rhythm.
- Use a `全局规则` or `通用规则` section for rules that apply everywhere, such as edit locks, generic save results, generic network failures, sorting conventions, and common delete behavior.
- Use tables for same-shaped field lists only when the output is a standalone Markdown document. For embedded/prototype paste targets, use grouped bullets with bold field names instead.
- Do not create `保存结果` and `边界场景` subsections under every module if they only repeat common behavior. Put common behavior once in `通用操作结果`; module sections should only list special differences.
- Keep `关键逻辑` for cross-module or cross-layer rules only. If a rule is already fully explained under the owning field/module, do not restate it there.
- If examples are needed, place them after the rule under an `示例` label. Do not mix examples into the rule sentence.
- If a document starts to feel like a changelog or field dump, compress repeated fields into a table and move repeated behavior into global rules before returning the answer.
- If the target is a prototype left document, compress repeated fields into short field groups instead of a table:
  - `**字段组：基础配置**`
  - `- 字段名：类型，必填/选填，默认值；核心规则。`
  - `- 字段名：类型，必填/选填，默认值；核心规则。`
- When two content types, modules, or fields share the same rule shape, do not duplicate two nearly identical sections. Write `通用规则` once, then list `类型差异` separately. Example: `点读书按页码，视频专辑按视频序号`; the validation rules can remain shared.
- For `关键逻辑`, keep only cross-module constraints and core design decisions. Do not repeat single-module field rules, page display rules, or already-owned validation details.

## Table usage detail

- For large configuration pages, long lists, or repeated field sets in standalone Markdown documents, compact Markdown tables may be used for field definitions. Recommended columns: `字段 / 类型 / 必填 / 默认值 / 规则`. Put only the stable field contract in the table; put complex linkage, validation branches, and examples immediately below the table.
- For embedded PRD, prototype left panels, workflow pages, or any output that will be pasted into a constrained UI canvas, do not use Markdown tables. Use compact grouped bullets instead, because tables often collapse or overflow in prototype renderers.

## Document boundary detail (multi-layer requirements)

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
