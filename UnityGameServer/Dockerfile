# 使用ASP.NET Core运行时作为基础镜像
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# 使用.NET SDK进行构建
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# 复制项目文件并恢复依赖
COPY ["UnityGameServer.API/UnityGameServer.API.csproj", "UnityGameServer.API/"]
COPY ["UnityGameServer.Core/UnityGameServer.Core.csproj", "UnityGameServer.Core/"]
COPY ["UnityGameServer.Models/UnityGameServer.Models.csproj", "UnityGameServer.Models/"]
RUN dotnet restore "UnityGameServer.API/UnityGameServer.API.csproj"

# 复制所有源代码
COPY . .
WORKDIR "/src/UnityGameServer.API"

# 构建应用程序
RUN dotnet build "UnityGameServer.API.csproj" -c $BUILD_CONFIGURATION -o /app/build

# 发布应用程序
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "UnityGameServer.API.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# 最终运行时镜像
FROM base AS final
WORKDIR /app

# 创建非root用户
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# 复制发布的应用程序
COPY --from=publish /app/publish .

# 创建日志目录
RUN mkdir -p logs

# 设置环境变量
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://+:8080
ENV DOTNET_RUNNING_IN_CONTAINER=true

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# 启动应用程序
ENTRYPOINT ["dotnet", "UnityGameServer.API.dll"]