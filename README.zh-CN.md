# PM 工作流系统

[English](./README.md) | [简体中文](./README.zh-CN.md)

这不是一套只会讲流程的 PM 工具包，而是一套把工作从需求 intake 推进到 Demo、可运行 React 原型、嵌入式 PRD 评审，以及项目资产/版本管理的系统。

它适合这样的 PM：
- 不想停留在“写一份 PRD 就算完”
- 不想让需求、原型、PRD、版本记录散在聊天和临时文件夹里
- 想把 PM 工作变成一条可继续、可复盘、可交付原型的链路

这次最大的升级点，不只是“workflow 更完整了”，而是**原型交付能力**被正式提了上来：
- 截图 / 设计稿吸收不再只服务于一次性模仿，而是要沉成可复用的页面 grammar
- 结构化 handoff 可以继续推进成可运行 React 原型基线
- embedded PRD 不再只是左右分栏，而是和可运行原型保持联动
- 可复用 UI 资产有 canonical template 作为沉淀落点

如果你只想看抽象流程，这个包会显得偏重。
如果你想要一条“需求 -> Demo -> 可运行原型 -> review-grade PRD”的稳定路径，这套东西才有意义。

---

## 为什么会有这个包

很多 PM 工作最后会卡在这些问题上：
- 需求澄清只留在聊天里，后续无法追踪
- Demo 和 PRD 各写各的，最后慢慢漂移
- 评审态、冻结态没有被明确表达
- 版本基线不清楚，历史关系难以回看
- 原型工作停留在截图层，没法继续变成真正可复用的产物
- 项目文件越做越乱，最后变成大杂烩

这套系统想解决的就是这些结构性问题。

它把 PM 工作拆成一条更清楚的链路：
1. 用 readiness 和规则收敛处理需求输入
2. 用 Demo 迭代和 rule-change signal 推进结构表达
3. 把设计参考吸收到可复用组件和页面 grammar
4. 把稳定 handoff 推进成可运行 React 原型基线
5. 产出和 Demo 保持联动的 embedded PRD
6. 用稳定目录、版本、快照、索引方式管理项目资产

---

## 这次版本真正升级了什么

这次最重要的变化，是这套系统终于把“原型交付”这一侧讲清楚了，而不再像一份只讲 PM 流程的说明书。

- `pm-design-absorption` 正式公开：截图 / 设计稿输入要沉成可复用 grammar，而不是一次性美化
- `pm-react-prototype-execution` 正式公开：结构化 PM handoff 可以继续进入 React 原型执行
- embedded review shell 的规则更明确：App 和 backend 不该共用同一种默认壳偏置
- 示例项目补了更实用的前置条件：做设计吸收前，先准备代表性截图素材
详细变化见：[UPDATE-NOTES.md](./UPDATE-NOTES.md)

---

## 这套包的核心特点

### 1）它覆盖的是完整的 PM 交付链
这套系统服务的不是单点动作，而是一条从“拿到需求”到“交付可评审 PRD”的完整链路。

这条链路包括：
- 需求澄清与 readiness 判断
- Demo / 页面结构迭代
- 设计参考吸收
- 可运行原型执行
- embedded PRD 组装
- 项目基线与资产管理

### 2）六段 PM + 原型工作流内核
整个系统围绕 6 个核心技能构建，而且边界清楚：
- `pm-requirement-intake`：需求 intake、readiness、规则收敛
- `pm-demo-design`：Demo 生成、迭代、冻结前信号判断
- `pm-design-absorption`：把截图 / 设计稿吸收到可复用组件和页面 grammar
- `pm-react-prototype-execution`：把结构化 handoff 变成可运行 React 原型基线
- `pm-embedded-prd`：负责左文右原型交付壳和映射组织
- `pm-project-ops`：负责项目资产、版本、快照、目录结构与存储规则

这不是一个“什么都做”的大 prompt，而是一套可拆职责的系统。

### 3）带命令式技能层，适合高频复用检查
除了 6 个核心技能，还带一组更轻量的检查层：
- `rule-change-signal`
- `freeze-readiness-check`
- `state-audit`
- `embedded-prd-audit`
- `memory-export-summary`

这些更适合反复触发的检查、审阅、校验动作。

### 4）强调项目资产 / 版本 / 快照管理
这套系统不假设你可以靠聊天记录或脑内记忆管理项目。

它显式引入了项目资产模型，包括：
- working 区
- versions 目录
- snapshots
- indexes
- mappings
- historical 归档

这样后续 continuation、freeze、回看差异都会更稳。

### 5）默认不绑定私有 memory 层
这套系统默认不内置个人私有 memory operating layer。

如果要接 memory，更适合把它当作 companion layer，而不是项目里的默认核心。

### 6）强调显式初始化，而不是依赖作者本地环境
它的目标不是“在作者电脑上能跑”，而是“别人拿到后知道怎么起步”。

所以这里强调 init 路径，而不是默认绑定某个固定盘符或作者自己的目录习惯。

---

## 仓库里包含什么

### 核心技能
- `pm-requirement-intake`
- `pm-demo-design`
- `pm-design-absorption`
- `pm-react-prototype-execution`
- `pm-embedded-prd`
- `pm-project-ops`

### 命令式技能
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
  pm-requirement-intake/
  pm-demo-design/
  pm-design-absorption/
  pm-react-prototype-execution/
  pm-embedded-prd/
  pm-project-ops/
  rule-change-signal/
  freeze-readiness-check/
  state-audit/
  embedded-prd-audit/
  memory-export-summary/

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

尤其是做原型设计吸收时，建议提前准备：
- 1 到 3 张代表性截图或 mockup
- 一个明确的页面族或模块范围
- 足够解释页面存在原因的规则上下文

如果这些都没有，系统仍然能给结果，但更容易退回成“泛泛的 demo 美化”。

---

## 包边界

这个仓库有意不包含这些内容：
- 私有项目截图
- pilot-only 业务文档
- 私有绝对路径
- 内部模板代码资产

它保留的是方法层、结构层和安全示例。

---

## 当前状态

这已经是一套可用的 PM + 原型交付系统。

当前已经包含：
- init 脚本与配置示例
- 六个核心 PM / prototype 技能
- 一组命令式检查技能
- 一个轻量 sample-project 骨架
- 更新说明与边界说明

后面仍然可以继续增强，尤其是：
- 更完整的跨平台初始化
- 更丰富的公开示例产物
- 更完整的端到端公开案例
- 可选的 memory integration 说明
