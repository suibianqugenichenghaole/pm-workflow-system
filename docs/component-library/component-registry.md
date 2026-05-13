# Component Registry

组件登记表用于告诉 PM workflow：已有组件在哪里、适合什么场景、是否可以直接复用，以及下一轮应该如何处理尚未落地的组件候选。

## Registry State Rule

核心原则：`planned` 只能是临时入口，不能长期堆着。每个 `planned` 必须带 `next_action`，下一轮整理时必须分流。

### Status

- `planned`: 刚发现一个可能可复用的组件，但还没判断清楚。必须带 `next_action`。
- `candidate`: 已经确认是稳定复用模式，但还没落正式组件源码。下一次做类似页面时优先抽组件。
- `needs-confirmation`: 方向像组件，但还缺关键确认，比如交互边界、命名、适用范围。确认后转 `candidate`、`deferred` 或 `drop`。
- `mapped-active`: 不单独建新组件，已由现有 `active` 组件覆盖，后续直接用现有组件名。
- `active`: 组件库已有正式源码和文档，可以直接复用。
- `external-template`: 能力在 workflow 模板或嵌入式交付壳里，不算组件库源码待办。
- `deferred`: 暂不做，等更多场景出现再看。
- `drop`: 确认不值得沉淀，删除登记或不再跟踪。

### next_action

- `extract_component`: 素材够了，下一步应该落组件源码和 README。
- `wait_for_more_screens`: 只有一个孤例，先等更多截图验证。
- `merge_with_existing`: 不新建，合并到已有组件。
- `defer`: 暂缓。
- `drop`: 放弃，不再跟踪。
- `-`: 当前状态不需要下一步动作，通常用于 `active` 或已明确的 `mapped-active`。

### Flow

1. 收到截图或原型后，先判断是不是稳定结构，而不是直接写页面。
2. 查 registry，看有没有 `active` 或 `mapped-active` 能覆盖。
3. 能覆盖就标 `mapped-active`，不要重复造组件名。
4. 不能覆盖但结构稳定，就进 `candidate`。
5. 还缺交互边界，就进 `needs-confirmation`，并列清楚需要确认什么。
6. 如果只是单点场景或当前不做，就进 `deferred` / `drop`。
7. 真正落了组件源码、README、示例或复用引用后，才进 `active`。

## Backend / Edit

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `BackendConfigFormSection` | active | - | `_component-library/src/backend/edit` | 后台配置页表单区块 |
| `BackendFormRow` | active | - | `_component-library/src/backend/edit` | 后台编辑表单的标签 + 控件行 |
| `BackendTextInput` | active | - | `_component-library/src/backend/edit` | 单行输入框，支持 placeholder、字数计数、禁用态 |
| `BackendTextarea` | active | - | `_component-library/src/backend/edit` | 多行输入框，支持字数计数 |
| `BackendSelect` | active | - | `_component-library/src/backend/edit` | 标准下拉选择控件 |
| `BackendRadioGroup` | active | - | `_component-library/src/backend/edit` | 单选组 |
| `BackendSwitch` | active | - | `_component-library/src/backend/edit` | 开关，适合是否试学等布尔配置 |
| `BackendNumberInput` | active | - | `_component-library/src/backend/edit` | 数字输入框，支持步进器、单位、错误态 |
| `BackendUploadField` | active | - | `_component-library/src/backend/edit` | 上传封面/图片字段 |
| `BackendFieldHint` | active | - | `_component-library/src/backend/edit` | 字段说明、错误、弱提示 |
| `BackendLinkedTargetFields` | candidate | extract_component | project prototype absorption | 关联链接、跳转类型、定位字段组合控件；下一次配置页实现时优先抽组件 |
| `BackendFreeRightsFields` | candidate | extract_component | project prototype absorption | 是否免费、权益标签组合控件 |
| `BackendProductSaleForm` | needs-confirmation | wait_for_more_screens | project prototype absorption | 商品售卖配置表单；需确认售卖方式、收款方式、价格字段是否跨业务稳定 |
| `BackendHomepageTabForm` | candidate | extract_component | project prototype absorption | App 首页 tab 配置表单 |

## Backend / Display

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `BackendStatusTag` | candidate | extract_component | project prototypes | 可用、待确认、不可用、试用、VIP 等状态标签 |
| `BackendDataTable` | candidate | extract_component | existing backend workbench pages | 后台表格骨架 |
| `BackendFilterBar` | active | - | `_component-library/src/backend/display` | 筛选栏 |
| `BackendTableToolbar` | active | - | `_component-library/src/backend/display` | 表格工具栏 |
| `BackendAfterSalesManagementBoard` | needs-confirmation | defer | `_component-library/src/backend/display` | 交易售后类列表看板源码存在，但更像业务看板样例；需确认是否参数化为通用看板 |
| `BackendTreePanel` | candidate | extract_component | project / real backend screenshots | 左侧树、目录、教材结构 |
| `BackendReferenceDetailModal` | candidate | extract_component | project prototype absorption | 引用详情弹窗，展示引用业务、引用对象、引用类型和操作 |
| `BackendTreeManagementModal` | candidate | extract_component | project prototype absorption | 目录树管理弹窗，支持空态、添加、节点操作和删除确认 |
| `BackendTwoPaneSelectorModal` | candidate | extract_component | project prototype absorption | 左候选 / 右已选选择弹窗，用于城市、教材、学习工具等 |
| `BackendConfigListPage` | candidate | extract_component | project prototype absorption | 配置型列表页，包含筛选、工具栏、表格、批量操作和分页 |

## Backend / Shell

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `BackendEditModalShell` | active | - | `_component-library/src/backend/shell` | 后台编辑弹窗外壳 |
| `BackendWorkbenchShell` | mapped-active | merge_with_existing | `BackendResourceWorkspace` | 后台工作台页面外壳先复用 / 对齐已有资源工作台结构，不重复命名 |
| `BackendResourceWorkspace` | needs-confirmation | defer | `_component-library/src/backend/shell` | 资源编排工作台源码存在，但仍含样例数据；需确认是否参数化为通用 shell |
| `BackendDetailWorkbenchShell` | candidate | extract_component | project prototype absorption | 详情工作台外壳，包含顶部标题、左侧二级菜单和右侧内容区 |
| `BackendReferenceSelectWizard` | candidate | extract_component | project prototype absorption | 引用对象创建向导，例如选择公用教材后确认同步教材配置 |

## Backend / Common

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `BackendPrimaryButton` | active | - | `_component-library/src/backend/common` | 后台主按钮/次按钮 |

## App / Common

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `AppPrimaryButton` | active | - | `_component-library/src/app/common` | App 主按钮 |

## App / Shell

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `AppMobilePageShell` | candidate | extract_component | project client prototype absorption | 手机页面外壳：状态栏、标题区、内容滚动区、底部安全区 |
| `AppBottomTabBar` | active | - | `_component-library/src/app/shell` | App 底部导航 |
| `AppDirectoryDrawer` | candidate | extract_component | project client prototype absorption | 右侧目录抽屉，支持单元 / 子单元 / 课树结构和选中态 |
| `AppLandscapePlayerShell` | active | - | `_component-library/src/app/shell` | App 横屏播放器外壳 |

## App / Display

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `AppSubjectTabs` | active | - | `_component-library/src/app/display` | App 科目 / 分类 tab，需支持非学科 tab 如家长 |
| `AppCurrentTextbookCard` | needs-confirmation | merge_with_existing | `AppTextbookSelectorCard` | 首页当前教材上下文卡；先判断是否扩展现有教材卡还是拆新语义组件 |
| `AppTextbookFilterChips` | candidate | extract_component | project client prototype absorption | 年级、学期等筛选按钮组 |
| `AppTextbookSelectCard` | needs-confirmation | merge_with_existing | `AppTextbookSelectorCard` | 切换教材页教材卡；需确认与当前教材卡是否拆分 |
| `AppEntrySection` | candidate | extract_component | project client prototype absorption | App 入口板块，包含板块标题和入口卡片宫格 |
| `AppEntryCard` | mapped-active | merge_with_existing | `AppLearningEntryCard` / `AppFeatureGrid` | App 入口卡片先复用学习入口卡或功能宫格基础，不重复造卡片语法 |
| `AppPermissionTag` | candidate | extract_component | project client prototype absorption | App 权限 / 状态标签，如 VIP、免费 |
| `AppLearningToolStrip` | mapped-active | merge_with_existing | `AppFeatureGrid` | 整本书学习工具横向入口先映射到功能入口宫格语法 |
| `AppAlbumHeroCard` | active | - | `_component-library/src/app/display` | App 专辑详情头图卡 |
| `AppAlbumPurchaseBar` | active | - | `_component-library/src/app/display` | App 专辑购买条 |
| `AppCourseCard` | active | - | `_component-library/src/app/display` | App 课程卡片 |
| `AppEpisodeListItem` | active | - | `_component-library/src/app/display` | App 剧集 / 课节列表项 |
| `AppFeatureGrid` | active | - | `_component-library/src/app/display` | App 功能入口宫格，可作为学习工具入口的基础参考 |
| `AppGuideModal` | active | - | `_component-library/src/app/display` | App 引导 / 提示弹窗；源码存在，补登记 |
| `AppLearningEntryCard` | active | - | `_component-library/src/app/display` | App 学习入口卡片，可作为project入口卡片的基础参考 |
| `AppTextbookSelectorCard` | active | - | `_component-library/src/app/display` | App 教材选择 / 当前教材卡基础组件，后续可拆分语义 |
| `AppVipBanner` | active | - | `_component-library/src/app/display` | App VIP 横幅 |

## App / Edit

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| App edit components | deferred | wait_for_more_screens | not yet absorbed | App 侧编辑 / 配置组件，暂不强行补 |

## Embedded

| Component | Status | next_action | Source / Mapping | Purpose / Note |
| --- | --- | --- | --- | --- |
| `LeftDocRightPrototypeShell` | external-template | merge_with_existing | existing workflow shell | 左文档右原型交付外壳；先定位 canonical shell 来源，不作为组件库源码待办 |
| `EmbeddedReviewShell` | external-template | merge_with_existing | existing embedded PRD outputs | 嵌入式评审页外壳；先登记模板来源和最小配置，不直接沉淀 TSX |

## Maintenance Rules

- 新增 registry 行时必须填写 `Status` 和 `next_action`。
- `planned` 行不得长期停留；下一轮组件整理必须转为 `candidate`、`needs-confirmation`、`mapped-active`、`deferred` 或 `drop`。
- `active` 需要同时满足：源码存在、README/文档存在、适用边界清楚。
- 如果源码存在但仍含强业务样例或缺少可配置 Props，优先标 `needs-confirmation`，不要把它当作完全通用组件。
- 每次截图吸收后，更新 `docs/absorption/`，并在本 registry 记录状态变化原因。
