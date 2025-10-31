# Unity 多人游戏项目 - 贡献指南

欢迎参与 Unity 多人游戏项目的开发！这份指南将帮助您了解如何为项目做出贡献。

## 🤝 贡献方式

### 1. 代码贡献
- 修复 Bug
- 实现新功能
- 性能优化
- 代码重构

### 2. 文档贡献
- 完善 README 文档
- 编写教程和示例
- API 文档完善
- 翻译文档

### 3. 测试贡献
- 编写单元测试
- 集成测试
- 性能测试
- Bug 报告

### 4. 设计贡献
- UI/UX 设计
- 游戏美术资源
- 交互设计

## 🛠️ 开发环境搭建

### 服务器端环境
1. 安装 .NET 9 SDK
2. 安装 Visual Studio 2022 或 VS Code
3. 安装 Docker (可选)

### 客户端环境
1. 安装 Unity 2022.3 LTS
2. 配置 .NET 4.x 兼容级别

## 🔄 贡献流程

### 1. Fork 项目
```bash
# 点击 GitHub 页面上的 "Fork" 按钮
# 克隆您的 Fork
git clone https://github.com/YOUR_USERNAME/unity-multiplayer-game.git
cd unity-multiplayer-game
```

### 2. 创建分支
```bash
# 创建新分支
git checkout -b feature/your-feature-name
# 或
git checkout -b bugfix/issue-number
```

### 3. 进行开发
- 遵循代码风格指南
- 编写清晰的提交信息
- 包含必要的测试

### 4. 提交变更
```bash
git add .
git commit -m "feat: add new multiplayer feature"
git push origin feature/your-feature-name
```

### 5. 创建 Pull Request
- 在 GitHub 上创建 PR
- 填写详细的描述
- 关联相关 Issue

## 📝 代码风格

### C# 代码风格
- 使用 PascalCase 命名类和方法
- 使用 camelCase 命名变量和参数
- 使用有意义的命名
- 添加适当的注释

```csharp
// 好的例子
public class PlayerController : MonoBehaviour
{
    private float moveSpeed = 5.0f;
    
    /// <summary>
    /// 更新玩家位置
    /// </summary>
    /// <param name="deltaTime">帧时间</param>
    public void UpdatePosition(float deltaTime)
    {
        // 实现逻辑
    }
}
```

### TypeScript/JavaScript 代码风格
- 使用 camelCase 命名变量和函数
- 使用 const/let 而不是 var
- 使用 TypeScript 类型注解

## 📝 提交信息规范

使用 [Conventional Commits](https://www.conventionalcommits.org/) 规范：

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### 类型 (Type)
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `style`: 代码格式化
- `refactor`: 代码重构
- `test`: 添加测试
- `chore`: 构建过程或辅助工具的变动

### 示例
```
feat(server): add room management API
fix(client): resolve connection timeout issue
docs: update installation guide
test(server): add unit tests for game hub
```

## 📊 测试指南

### 运行测试
```bash
# 服务器端测试
cd UnityGameServer
dotnet test

# 客户端测试
# 在 Unity Editor 中运行 Test Runner
```

### 测试覆盖率
- 新功能应包含相应测试
- 保持测试覆盖率在 80% 以上

## 📄 Issue 报告

### Bug 报告
使用 Bug 报告模板，包括：
- 环境信息
- 复现步骤
- 期望结果 vs 实际结果
- 截图或视频（如适用）

### 功能请求
使用功能请求模板，包括：
- 问题描述
- 建议解决方案
- 可选的替代方案
- 额外上下文

## 🔍 代码审查

### PR 审查标准
- 代码质量和可读性
- 测试覆盖率
- 文档更新
- 性能影响
- 安全性考虑

### 审查流程
1. 自动化测试通过
2. 至少一个维护者审查
3. 解决所有反馈
4. 合并到主分支

## 🎆 认可

所有贡献者将在以下地方获得认可：
- README.md 中的贡献者列表
- Release Notes
- 项目网站（如果有）

## 📞 联系方式

- 通过 GitHub Issues 提问
- 通过 GitHub Discussions 讨论
- 通过 Pull Request 进行代码审查

## 📜 资源

- [Unity 官方文档](https://docs.unity3d.com/)
- [.NET 9 文档](https://docs.microsoft.com/en-us/dotnet/)
- [SignalR 文档](https://docs.microsoft.com/en-us/aspnet/core/signalr/)
- [Docker 文档](https://docs.docker.com/)

---

感谢您的贡献！🚀