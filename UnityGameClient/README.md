# Unity Game Client

Unity多人游戏客户端，与Unity Game Server配套使用，支持实时多人在线游戏。

## 功能特性

- **实时多人连接**: 使用SignalR与服务器进行实时通信
- **玩家移动同步**: 实时同步所有玩家的位置和旋转
- **房间系统**: 支持玩家加入/离开房间
- **消息系统**: 玩家间实时消息传递
- **自动化测试**: 支持创建AI机器人进行压力测试
- **网络状态监控**: 实时显示连接状态和网络信息

## 技术栈

- Unity 2022.3 LTS
- C# .NET Framework
- SignalR Client
- Unity UI System

## 快速开始

1. 确保Unity Game Server正在运行
2. 在Unity中打开项目
3. 打开主场景并点击Play
4. 使用WASD键控制角色移动

## 项目结构

```
Assets/
├── Scripts/
│   ├── Networking/           # 网络通信相关
│   ├── Player/              # 玩家控制相关
│   ├── UI/                  # 用户界面
│   └── README.md           # 详细文档
├── Scenes/                 # 游戏场景
├── Prefabs/               # 预制件
└── Resources/             # 资源文件
```

详细的使用说明请查看 `Assets/Scripts/README.md`

## 配置说明

在Unity Inspector中配置以下参数：
- **Server URL**: 服务器地址 (默认: `http://localhost:5000/gamehub`)
- **Player Name**: 玩家名称
- **Room ID**: 房间ID

## 系统要求

- Unity 2022.3 LTS 或更高版本
- Windows/Mac/Linux
- .NET 4.x 运行时

## 许可证

MIT License