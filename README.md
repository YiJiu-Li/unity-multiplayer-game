# Unity多人游戏项目

一个完整的Unity多人游戏解决方案，包含客户端和服务器端，支持100+玩家同屏实时互动。

## 📁 项目结构

- **UnityGameClient/** - Unity客户端，使用Unity 2022.3 LTS开发
- **UnityGameServer/** - .NET 9服务器端，基于SignalR实现实时通信

## 🎯 主要特性

- ✅ **实时多人连接**: 支持100+玩家同时在线
- ✅ **玩家移动同步**: 实时同步所有玩家的位置和旋转
- ✅ **房间系统**: 动态创建和管理游戏房间
- ✅ **聊天系统**: 房间内实时消息传递
- ✅ **Docker部署**: 完整的容器化部署方案
- ✅ **自动化测试**: 支持创建AI机器人进行压力测试
- ✅ **性能监控**: 内置性能监控和统计

## 🚀 快速开始

### 1. 运行服务器

```bash
cd UnityGameServer
docker-compose up -d
```

### 2. 运行客户端

1. 在Unity中打开`UnityGameClient`项目
2. 打开主场景并点击Play
3. 使用WASD键控制角色移动

## 📖 详细文档

- [Unity客户端文档](./UnityGameClient/README.md)
- [服务器端文档](./UnityGameServer/README.md)

## 🛠️ 技术栈

### 客户端
- Unity 2022.3 LTS
- C# .NET Framework
- SignalR Client
- Unity UI System

### 服务器端
- .NET 9
- ASP.NET Core
- SignalR
- Docker
- Nginx

## 📊 系统要求

### 客户端
- Unity 2022.3 LTS 或更高版本
- Windows/Mac/Linux
- .NET 4.x 运行时

### 服务器端
- .NET 9 SDK
- Docker (推荐)
- 或直接运行在Windows/Linux服务器

## 🔧 配置说明

默认配置下，服务器运行在 `http://localhost:5000`，客户端会自动连接到该地址。

可以在Unity客户端的Inspector中修改：
- 服务器地址
- 玩家名称
- 房间ID

## 📄 许可证

MIT License

## 🤝 贡献

欢迎提交Issue和Pull Request来改进项目！

---

**开发时间**: 2025年10月31日  
**版本**: 1.0.0