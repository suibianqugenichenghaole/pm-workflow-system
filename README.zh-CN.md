# PM 工作流系统

[English](./README.md) | [简体中文](./README.zh-CN.md)

这是一套 PM workflow skill 包，用来把产品工作从请求判断、价值澄清、需求 intake，推进到 Demo、页面型 PRD、可运行 React 原型、嵌入式 PRD 评审，以及项目资产/版本管理。

它适合这样的 PM：
- 不想停留在“写一份 PRD 就算完”
- 不想让需求、原型、PRD、版本记录散在聊天和临时文件夹里
- 想先判断一件事该不该进入完整流程，而不是所有请求都重处理
- 想在评审前提前暴露价值、范围、状态和失败路径
- 想把 PM 工作变成一条可继续、可复盘、可交付原型的链路

如果你只想看抽象流程，这个包会显得偏重。
如果你想要一条“请求判断 -> 价值锚定 -> 需求 -> Demo -> PRD -> 可运行原型 -> review-grade embedded PRD”的稳定路径，这套东西才有意义。

---

## 为什么会有这个包

很多 PM 工作最后会卡在这些问题上：
- 所有请求都被同等处理，要么过度设计，要么重要风险被漏掉
- 需求澄清只留在聊天里，后续无法追踪
- 价值、成功标准和证据不清楚，导致评审时才发现方向没对齐
- Demo 和 PRD 各写各的，最后慢慢漂移
- 评审态、冻结态、状态缺口没有被明确表达
- 高风险规则缺少反例检查，交易、履约、状态、角色等边界到后面才爆
- 原型工作停留在截图层，没法继续变成真正可运行、可复用的产物
- 版本基线不清楚，历史关系难以回看
- 项目文件越做越乱，最后变成大杂烩

这套系统想解决的就是这些结构性问题。

它把 PM 工作拆成一条更清楚的链路：
1. 用 `request-triage` 判断请求应该快处理、标准处理，还是进入深度 workflow
2. 用 `pm-value-anchor` 先收敛目标价值、最低成功标准、证据和取舍
3. 用 `audience-judgment-framing` 明确文档或评审材料要服务谁、让对方做什么判断
4. 用 readiness 和规则收敛处理需求输入
5. 用 Demo 迭代和 rule-change signal 推进结构表达
6. 把设计参考吸收到可复用组件和页面 grammar
7. 把已澄清需求整理成面向实现的页面型 PRD
8. 把稳定 handoff 推进成可运行 React 原型基线，并在必要时做垂直切片验证
9. 产出和 Demo / 原型保持联动的 embedded PRD
10. 用挑战、反证、状态审计和冻结检查控制评审前风险
11. 用稳定目录、版本、快照、索引方式管理项目资产

---

## 核心特点

### 1）覆盖完整 PM 交付链

这套系统服务的不是单点动作，而是一条从“收到请求”到“交付可评审 PRD / 原型”的完整链路。

这条链路包括：
- 请求分流与处理深度判断
- 价值锚点、成功标准和证据收敛
- 面向读者判断的文档 / 评审 framing
- 需求澄清与 readiness 判断
- Demo / 页面结构迭代
- 设计参考吸收
- 页面型 PRD 编写
- 可运行 React 原型执行
- embedded PRD 组装
- 反向挑战、状态审计和冻结检查
- 项目基线与资产管理

### 2）入口、生产、审计三层分工

这不是一个“什么都做”的大 prompt，而是一套职责可拆的技能系统。

入口和判断层：
- `request-triage`：判断一个请求应该快处理、标准处理，还是进入深度 workflow
- `pm-value-anchor`：先明确目标价值、最低成功标准、证据和取舍
- `audience-judgment-framing`：先定义读者、目标判断和证据需求，再写文档或评审材料

核心生产链路：
- `pm-requirement-intake`：需求 intake、readiness、规则收敛
- `pm-demo-design`：Demo 生成、迭代、冻结前信号判断
- `pm-prd-writer`：从已澄清需求写出页面型、开发可读 PRD
- `pm-design-absorption`：把截图 / 设计稿吸收到可复用组件和页面 grammar
- `pm-react-prototype-execution`：把结构化 handoff 变成可运行 React 原型基线
- `pm-embedded-prd`：负责左文右原型交付壳和映射组织
- `pm-project-ops`：负责项目资产、版本、快照、目录结构与存储规则

挑战和审计层：
- `pm-devil-advocate`：挑战价值、假设、范围、证据和失败模式
- `pm-requirement-reverse-audit`：用反例压测高风险需求规则
- `rule-change-signal`：判断单点规则或表现差异是否需要回上游
- `state-audit`：检查页面、流程、PRD 的状态缺口
- `freeze-readiness-check`：判断当前轮是否具备冻结或交付条件
- `embedded-prd-audit`：审计 embedded PRD 的文档、原型和映射是否一致
- `memory-export-summary`：把项目状态压缩成适合 continuation 的摘要和指针

### 3）原型交付不是 PRD 附件

- 截图 / mockup 吸收要沉成页面 grammar，而不是一次性模仿
- Demo 结构和 PRD 规则要能互相映射
- React 原型要基于结构化 handoff，而不是凭空美化
- 高风险路径需要时，要用垂直切片验证关键行为是否跑通
- embedded PRD 的右侧保持真实页面 / 原型，解释、风险、规则留在左侧文档

### 4）项目资产 / 版本 / 快照管理

这套系统不假设你可以靠聊天记录或脑内记忆管理项目。

它显式引入：
- working 区
- versions 目录
- snapshots
- indexes
- mappings
- historical 归档

这样后续 continuation、freeze、回看差异都会更稳。

### 5）memory 是 companion layer，不是默认核心

这个公开包默认不绑定私有 memory operating layer，也不要求使用者拥有作者本地的 memory 配置。

如果搭配 `memory-skill` 使用，更推荐这样分工：
- 项目资产、PRD、原型、版本、截图证据仍然放在项目目录里
- memory 只保存稳定摘要、当前阶段、关键结论和可继续的文件指针
- `memory-export-summary` 用来把当前项目状态压缩成 memory-safe continuation 摘要
- 详细过程、私有业务细节、个人路径和内部材料不写进公开包

换句话说：项目资产是事实源，memory 是续接索引。不要反过来。

### 6）显式初始化，不依赖作者本地环境

它的目标不是“在作者电脑上能跑”，而是“别人拿到后知道怎么起步”。

所以这里强调 init 路径、示例配置和项目根目录，而不是默认绑定某个固定盘符、私有目录或作者自己的环境习惯。

---

## 本次更新

本轮为 skill-only 更新，同时包含 2026-06-07 的公开技能扩展和 2026-06-08 的既有技能精简 / 拆分：

- 新增 `request-triage`、`pm-value-anchor`、`audience-judgment-framing`，把请求分流、价值锚定、读者判断放到需求 intake 之前
- 新增 `pm-devil-advocate`、`pm-requirement-reverse-audit`，补齐通用反向挑战和高风险需求反证审计
- `pm-prd-writer`：把过长的正文拆进按需加载的 `references/`（操作分支、字段联动与交互、大型 PRD 压缩、最终自检清单），核心技能更精简，详细模板只在需要时加载
- `pm-react-prototype-execution`：把组件复用/注册规则、完整分步执行细节、页面 spec 与输出预期移到 `references/execution-and-reuse-detail.md`
- `pm-project-ops`：把 PM + React 融合操作模式、续接纪律、方法迁移规则移到 `references/pm-react-fusion-ops.md`
- `pm-demo-design`：description 明确认领“demo 结构 / 页面规划（非可运行）”这条道，把“可运行 / 能跑的 React 实现”路由到 `pm-react-prototype-execution`
- `pm-devil-advocate`：补充口语化挑刺触发词，并与 `pm-requirement-reverse-audit` 建立对称路由，高风险交易 / 状态 / 角色需求会被导向更锋利的反证矩阵

详细变化见：[UPDATE-NOTES.md](./UPDATE-NOTES.md)。

---

## 仓库里包含什么

### 入口和判断技能
- `request-triage`
- `pm-value-anchor`
- `audience-judgment-framing`

### 核心生产技能
- `pm-requirement-intake`
- `pm-demo-design`
- `pm-prd-writer`
- `pm-design-absorption`
- `pm-react-prototype-execution`
- `pm-embedded-prd`
- `pm-project-ops`

### 挑战和审计技能
- `pm-devil-advocate`
- `pm-requirement-reverse-audit`
- `rule-change-signal`
- `freeze-readiness-check`
- `state-audit`
- `embedded-prd-audit`
- `memory-export-summary`

### 配置、打包与示例
- `pm-workflow.config.example.json`
- `packaging/pm-workflow-init-spec.md`
- `scripts/init-pm-workflow.ps1`
- `examples/sample-project/`
- `UPDATE-NOTES.md`
- `LICENSE`
- `CONTRIBUTING.md`

---

## 仓库结构

```text
skills/public/
  request-triage/
  pm-value-anchor/
  audience-judgment-framing/
  pm-requirement-intake/
  pm-demo-design/
  pm-prd-writer/
  pm-design-absorption/
  pm-react-prototype-execution/
  pm-embedded-prd/
  pm-project-ops/
  pm-devil-advocate/
  pm-requirement-reverse-audit/
  rule-change-signal/
  freeze-readiness-check/
  state-audit/
  embedded-prd-audit/
  memory-export-summary/

docs/
  component-library/
    component-registry.md

packaging/
  pm-workflow-init-spec.md

scripts/
  init-pm-workflow.ps1

examples/
  sample-project/

pm-workflow.config.example.json
UPDATE-NOTES.md
LICENSE
CONTRIBUTING.md
```

---

## 快速开始

### 方式 A：使用 init 脚本

#### 交互模式

```powershell
pwsh ./scripts/init-pm-workflow.ps1
```

或者在 Windows PowerShell 下：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-pm-workflow.ps1
```

#### 非交互模式

```powershell
pwsh ./scripts/init-pm-workflow.ps1 -ProjectsRoot "D:\pm-workflow-projects" -Force
```

### 方式 B：手动初始化

#### 1）复制示例配置
- 复制 `pm-workflow.config.example.json`
- 保存为 `pm-workflow.config.json`

#### 2）设置 `projectsRoot`
选择你的 PM 项目资产根目录。

#### 3）创建或确认根目录存在
如果 `projectsRoot` 不存在，就先建好。

#### 4）没有特殊原因时，先保留默认协议
大多数情况下，不建议一开始就改 stage 名、artifactDirs、naming 规则。

---

## 示例项目

想看 init 之后一个项目应该长什么样，先看这里：
- `examples/sample-project/README.md`
- `examples/sample-project/study-session-checkin/`

这个 sample project 故意保持轻量，主要展示：
- 一个项目根目录怎么组织
- current baseline 从哪里进入
- continuation entry 应该怎么放
- `working/` 和 `versions/v0.1/` 怎么分层
- snapshot manifest 怎么挂接
- 设计吸收素材入口怎么留

它更接近“项目结构样板”，不是完整业务案例。

---

## 实际使用前的前置条件

这套包在你准备了一些上下文之后，效果会明显更稳。

建议提前准备：
- 一个明确的请求或需求范围
- 这个请求为什么值得处理，以及最低成功标准是什么
- PRD、评审材料或 handoff 的目标读者
- 关键页面、状态、角色、流程或规则边界
- 需要做设计吸收时，准备 1 到 3 张代表性截图或 mockup
- 需要做 React 原型时，准备结构化 handoff 或已冻结的页面 / 规则基线

如果这些都没有，系统仍然能给结果，但更容易退回成泛泛的流程建议或 demo 美化。

---

## 包边界

这个仓库有意不包含这些内容：
- 私有项目截图
- 真实公司、项目、产品或个人信息
- pilot-only 业务文档
- 私有绝对路径
- 内部模板代码资产
- 私有 memory 数据或作者本地 memory 配置

它保留的是方法层、结构层、公开技能和安全示例。

---

## 当前状态

这已经是一套可用的 PM + 原型交付系统。

当前已经包含：
- init 脚本与配置示例
- 入口和价值判断技能
- 七个核心 PM / prototype 生产技能
- 一组挑战、反证、状态审计和冻结检查技能
- 一个轻量 sample-project 骨架
- 更新说明与边界说明
- 可选 memory companion 的衔接方式
