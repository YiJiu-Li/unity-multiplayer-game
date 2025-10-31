#!/bin/bash

# Unity Game Server 部署脚本

echo "🚀 Unity Game Server 部署开始..."

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ Docker 未安装，请先安装Docker"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose 未安装，请先安装Docker Compose"
    exit 1
fi

# 创建必要的目录
echo "📁 创建日志目录..."
mkdir -p logs
mkdir -p ssl

# 构建 Docker镜像
echo "🔨 构建 Docker镜像..."
docker build -t unity-game-server:latest .

if [ $? -ne 0 ]; then
    echo "❌ Docker镜像构建失败"
    exit 1
fi

# 停止现有容器
echo "🛑 停止现有容器..."
docker-compose down

# 启动服务
echo "🚀 启动服务..."
docker-compose up -d

if [ $? -eq 0 ]; then
    echo "✅ 部署成功！"
    echo ""
    echo "📡 服务地址:"
    echo "   - HTTP: http://localhost:5102"
    echo "   - WebSocket: ws://localhost:5102/gamehub"
    echo "   - 健康检查: http://localhost:5102/health"
    echo "   - 服务统计: http://localhost:5102/api/game/stats"
    echo ""
    echo "📊 查看日志:"
    echo "   docker-compose logs -f unitygameserver"
    echo ""
    echo "🔍 查看容器状态:"
    echo "   docker-compose ps"
else
    echo "❌ 部署失败，请检查日志"
    docker-compose logs
fi