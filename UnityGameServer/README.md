# Unity Game Server - 100+同屏游戏后端

一个基于.NET 9和SignalR的高性能游戏服务器，支持100+玩家同屏实时互动，可部署到Docker容器。

## 🎯 项目特性

- ✅ **高并发支持**: 支持100+玩家同时在线
- ✅ **实时通信**: 基于SignalR的WebSocket连接
- ✅ **房间管理**: 动态创建和管理游戏房间
- ✅ **玩家同步**: 实时位置和状态同步
- ✅ **聊天系统**: 房间内聊天功能
- ✅ **性能监控**: 内置性能监控和统计
- ✅ **Docker部署**: 完整的容器化部署方案
- ✅ **负载均衡**: Nginx反向代理和负载均衡
- ✅ **健康检查**: 应用和容器健康监控
- ✅ **日志记录**: 结构化日志和文件输出

## 🏗️ 项目结构

```
UnityGameServer/
├── UnityGameServer.API/          # Web API和SignalR Hub
├── UnityGameServer.Core/         # 核心业务逻辑
├── UnityGameServer.Models/       # 数据模型
├── Dockerfile                    # Docker镜像构建
├── docker-compose.yml           # Docker编排配置
├── nginx.conf                   # Nginx配置
└── README.md                    # 项目说明
```

## 🚀 快速开始

### 开发环境运行

1. **环境要求**
   - .NET 9 SDK
   - Visual Studio 2022 或 VS Code

2. **运行项目**
   ```bash
   cd UnityGameServer.API
   dotnet run
   ```

3. **访问地址**
   - API: `http://localhost:5000`
   - SignalR Hub: `ws://localhost:5000/gamehub`
   - 健康检查: `http://localhost:5000/health`

### Docker部署

1. **构建镜像**
   ```bash
   docker build -t unity-game-server .
   ```

2. **运行容器**
   ```bash
   docker run -p 5000:8080 unity-game-server
   ```

3. **使用Docker Compose（推荐）**
   ```bash
   docker-compose up -d
   ```

## 📡 API文档

### REST API端点

#### 房间管理
- `POST /api/game/rooms` - 创建房间
- `GET /api/game/rooms` - 获取房间列表
- `GET /api/game/rooms/{roomId}` - 获取房间详情
- `GET /api/game/rooms/{roomId}/players` - 获取房间玩家

#### 系统监控
- `GET /api/game/stats` - 服务器统计
- `GET /api/game/health` - 健康检查
- `POST /api/game/cleanup` - 清理非活跃房间

### SignalR Hub方法

#### 客户端调用的方法
- `JoinRoom(roomId, playerName)` - 加入房间
- `LeaveRoom()` - 离开房间
- `UpdatePosition(position)` - 更新玩家位置
- `SendChatMessage(message)` - 发送聊天消息
- `GetRoomStatus()` - 获取房间状态

#### 服务器推送的事件
- `JoinRoomResult` - 加入房间结果
- `PlayerJoined` - 玩家加入通知
- `PlayerLeft` - 玩家离开通知
- `PlayerMoved` - 玩家移动通知
- `ChatMessage` - 聊天消息
- `ExistingPlayers` - 现有玩家列表
- `RoomStatus` - 房间状态更新

## 🎮 Unity客户端集成示例

```csharp
using Microsoft.AspNetCore.SignalR.Client;
using UnityEngine;

public class GameClient : MonoBehaviour
{
    private HubConnection connection;
    
    async void Start()
    {
        // 连接到服务器
        connection = new HubConnectionBuilder()
            .WithUrl("http://localhost:5000/gamehub")
            .Build();
            
        // 注册事件
        connection.On<object>("PlayerJoined", OnPlayerJoined);
        connection.On<object>("PlayerMoved", OnPlayerMoved);
        connection.On<object>("PlayerLeft", OnPlayerLeft);
        connection.On<object>("ChatMessage", OnChatMessage);
        
        await connection.StartAsync();
        
        // 加入房间
        await connection.InvokeAsync("JoinRoom", "room123", "玩家名称");
    }
    
    async void Update()
    {
        // 发送位置更新
        if (transform.hasChanged)
        {
            var position = new {
                X = transform.position.x,
                Y = transform.position.y,
                Z = transform.position.z,
                RotationX = transform.rotation.x,
                RotationY = transform.rotation.y,
                RotationZ = transform.rotation.z,
                RotationW = transform.rotation.w
            };
            
            await connection.InvokeAsync("UpdatePosition", position);
            transform.hasChanged = false;
        }
    }
    
    void OnPlayerJoined(object data) { /* 处理玩家加入 */ }
    void OnPlayerMoved(object data) { /* 处理玩家移动 */ }
    void OnPlayerLeft(object data) { /* 处理玩家离开 */ }
    void OnChatMessage(object data) { /* 处理聊天消息 */ }
}
```

## ⚡ 性能优化配置

### SignalR优化
- 最大消息大小: 32KB
- 心跳间隔: 15秒
- 客户端超时: 30秒
- 握手超时: 15秒

### 内存和CPU优化
- 使用单例服务减少内存占用
- 并发字典提高线程安全性能
- 定期清理非活跃连接
- 异步处理所有IO操作

### Docker资源限制
- CPU限制: 2核心
- 内存限制: 2GB
- 最小预留: 0.5核心, 512MB

## 📊 监控和日志

### 日志配置
- 控制台输出: 彩色格式化
- 文件输出: 按天滚动，保留30天
- 日志级别: 开发环境Debug，生产环境Information

### 性能监控
- 连接数统计
- 房间活跃度监控
- 内存使用情况
- 响应时间追踪

### 健康检查
- HTTP端点: `/health`
- Docker健康检查: 30秒间隔
- 监控指标: 连接数、活跃房间数、服务状态

## 🔧 配置选项

### appsettings.json
```json
{
  "GameSettings": {
    "MaxRooms": 1000,
    "MaxPlayersPerRoom": 200,
    "DefaultMaxPlayersPerRoom": 100,
    "CleanupIntervalMinutes": 5,
    "PlayerTimeoutMinutes": 30
  },
  "SignalR": {
    "MaximumReceiveMessageSize": 32768,
    "KeepAliveIntervalSeconds": 15,
    "ClientTimeoutSeconds": 30
  }
}
```

### 环境变量
```bash
# 服务器配置
ASPNETCORE_ENVIRONMENT=Production
ASPNETCORE_URLS=http://+:8080

# 游戏设置
GameSettings__MaxRooms=1000
GameSettings__MaxPlayersPerRoom=200

# SignalR配置
SignalR__MaximumReceiveMessageSize=32768
```

## 🔄 扩展部署

### 多实例部署
1. 修改docker-compose.yml添加更多服务实例
2. 配置Redis做状态共享
3. 使用Nginx负载均衡

### 生产环境建议
- 使用HTTPS和SSL证书
- 配置反向代理缓存
- 启用Redis集群
- 配置数据库持久化
- 设置监控告警

## 🐛 故障排除

### 常见问题
1. **连接失败**: 检查CORS配置和防火墙设置
2. **内存泄漏**: 确保及时清理断开的连接
3. **性能下降**: 调整SignalR缓冲区大小和超时设置
4. **Docker构建失败**: 检查.dockerignore文件配置

### 调试技巧
- 启用SignalR详细错误信息
- 查看结构化日志
- 使用性能计数器
- 监控Docker容器资源使用

## 📄 许可证

MIT License - 详见LICENSE文件

## 🤝 贡献

欢迎提交Issue和Pull Request来改进项目！

---

**开发团队**: Unity Game Server Project  
**版本**: 1.0.0  
**更新时间**: 2025年10月31日