# PM 工作流系统

这是一套面向产品经理的结构化工作流系统，用来把工作从**需求收敛**推进到**Demo 迭代**、**嵌入式 PRD 交付**，以及**项目资产 / 版本 / 快照管理**。

这个仓库是一个**公开版 / 开源草案**，它最初来自个人优先的真实工作流，后来被抽离成更可复用的形式。

它适合这样的 PM：
- 不想停留在“写一篇 PRD 就完了”
- 不想让需求、Demo、PRD、版本记录散落在聊天和临时文件夹里
- 想把 PM 工作变成一套可持续迭代的操作系统，而不是一次性提示词

---

## 为什么会有这个包

很多 PM 工作流最后会卡在这几类问题上：
- 需求澄清只存在于聊天里，后续无法追踪
- Demo 和 PRD 各写各的，最后逐渐漂移
- 评审态、冻结态没有被明确表达
- 版本基线不清楚，历史关系难以追溯
- 项目文件越做越乱，最后变成一个大杂物堆

这套系统想解决的，就是这些结构性问题。

它把 PM 工作拆成一个更清晰的链路：
1. 通过显式的 readiness / 规则收敛处理需求输入
2. 结合上下文和规则变化信号推进 Demo 设计与迭代
3. 产出与 Demo 评审保持联动的嵌入式 PRD
4. 用稳定的目录、版本、快照、索引方式管理项目资产

---

## 这套系统的特点

### 1）四核分工，而不是一个“大一统提示词”
整个工作流围绕 4 个核心技能构建，而且边界是清楚的：

- `pm-requirement-intake`：负责需求 intake、readiness、规则收敛
- `pm-demo-design`：负责 Demo 生成、迭代、冻结前检查信号
- `pm-embedded-prd`：负责左文右演示的交付壳层，以及映射关系组织
- `pm-project-ops`：负责项目资产、版本、快照、目录结构与存储规则

这不是一个“什么都做”的超级提示词，而是一个**模块化、可拆分职责的 PM 工作流内核**。

### 2）带有命令式技能层，适合高频复用检查
除了四个核心技能，还包含一组更轻量的命令式技能：

- `rule-change-signal`
- `freeze-readiness-check`
- `state-audit`
- `embedded-prd-audit`
- `memory-export-summary`

这些技能更适合触发那些反复出现的检查、审阅、校验动作，让流程不只是“能做”，而是“能反复稳定做”。

### 3）强调项目资产 / 版本 / 快照管理
这套系统不假设你可以靠聊天记录或脑内记忆来管理项目。

它显式引入了一套项目资产模型，包括：
- working 区
- versions 版本目录
- snapshots 快照
- indexes 索引
- mappings 映射
- historical 历史归档

这样做的价值是：后续继续推进、回看基线、冻结版本、比较差异时，不容易失控。

### 4）公开版默认不绑定私有 memory 层
这个公开包**默认不包含个人私有 memory operating layer**。

如果未来要接 memory，更适合把它当成一个可选 companion layer，而不是默认内置到核心包里。

### 5）强调显式初始化，而不是依赖作者本地环境
公开版的目标不是“在作者电脑上能跑”，而是“别人拿到后能知道第一步怎么开箱”。

所以这套包需要一个明确的 init 路径，而不是默认绑定某个固定盘符或作者自己的目录习惯。

---

## 仓库里包含什么

### 核心技能
- `pm-requirement-intake`
- `pm-demo-design`
- `pm-embedded-prd`
- `pm-project-ops`

### 命令式技能
- `rule-change-signal`
- `freeze-readiness-check`
- `state-audit`
- `embedded-prd-audit`
- `memory-export-summary`

### 配置、包装与示例
- `pm-workflow.config.example.json`
- `packaging/pm-workflow-init-spec.md`
- `scripts/init-pm-workflow.ps1`
- `examples/sample-project/`
- `LICENSE`
- `CONTRIBUTING.md`

---

## 仓库结构

```text
skills/public/
  pm-requirement-intake/
  pm-demo-design/
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
先把示例配置复制成正式配置：

- 复制 `pm-workflow.config.example.json`
- 保存为 `pm-workflow.config.json`

#### 2）设置 `projectsRoot`
选择你的 PM 项目资产根目录，也就是以后所有项目资产要存放的位置。

示例：

```json
{
  "projectsRoot": "<你的项目资产根目录>",
  "stages": ["draft", "review", "frozen", "historical", "deprecated"],
  "artifactDirs": {
    "rules": "rules",
    "demo": "demo",
    "prd": "prd",
    "snapshots": "snapshots",
    "mappings": "mappings",
    "diffs": "diffs",
    "attachments": "attachments",
    "indexes": "indexes"
  },
  "naming": {
    "versionPrefix": "v",
    "mainEntry": "current",
    "reviewEntry": "review",
    "deliveryEntry": "delivery"
  }
}
```

#### 3）创建或确认根目录存在
如果你设置的 `projectsRoot` 还不存在，就先创建它。

#### 4）没有特别理由时，先保留默认协议
通常情况下，不建议一上来就改这些默认项：
- 阶段名 `stages`
- 工件目录名 `artifactDirs`
- 命名规则 `naming`

因为它们更像是这套系统的协议层，保持稳定更利于后续复用。

---

## 示例项目

如果你想看 init 之后一个项目实际应该长什么样，建议先看：
- `examples/sample-project/README.md`
- `examples/sample-project/study-session-checkin/`

这个 sample project 刻意做得比较轻，主要是为了展示：
- 一个项目根目录长什么样
- current baseline 从哪里进
- continuation entry 应该怎么放
- `working/` 和 `versions/v0.1/` 如何分层
- snapshot manifest 怎么挂

你可以把它理解成“项目结构实物样板”，不是完整业务案例。

---

## 初始化模型

这个公开版默认需要一个显式 init 步骤。

最小初始化应当完成这 4 件事：
1. 收集或确认 `projectsRoot`
2. 写入 `pm-workflow.config.json`
3. 在需要时创建项目资产根目录
4. 确认系统已经可以继续进行项目创建和资产管理

这里要区分两个概念：

- **Init**：准备全局配置和项目资产根目录
- **Project creation**：创建某个具体项目的目录、元信息和入口文件

当前草案可以参考：
- `packaging/pm-workflow-init-spec.md`

---

## 这套包适合什么场景

如果你希望做到下面这些事，这个包会比较有价值：
- 不再只靠聊天推进 PM 工作
- 把需求 intake、Demo 设计、PRD 交付拆成清晰阶段
- 让 Demo 和 PRD 保持联动，而不是各自漂移
- 让版本基线、冻结点、历史关系更容易追溯
- 把个人提示词升级成一个可复用、可迁移的 PM 工作流系统

---

## 当前状态

这是一个从个人真实工作流中抽离出来的**结构化开源草案**。

核心流程已经可用，而且当前公开包已经包含：
- 第一版 PowerShell init 脚本
- 中性化后的示例配置
- 初始化说明 spec
- 一个轻量 sample project 骨架
- 一个宽松可复用的开源 License
- 一份正式的贡献说明

当前仍值得继续补强的能力包括：
- 跨平台 init 命令或安装方案
- 更丰富的 sample project 产物
- 一条完整的 intake → demo → embedded PRD → freeze baseline 端到端示例
- 可选 memory integration 文档

---

## 建议的下一步

如果你想让这套包更容易被别人拿来用，当前最值得做的增强是：
1. 提供跨平台的 init 命令或脚本集
2. 提供一个更丰富、更贴近真实业务的 sample project
3. 提供一条完整链路的 end-to-end 示例
4. 补清楚不同运行环境下的安装 / 使用说明

---

## License

当前仓库使用的是 **MIT License**。

见：
- `LICENSE`

---

## Contributing

见：
- `CONTRIBUTING.md`
