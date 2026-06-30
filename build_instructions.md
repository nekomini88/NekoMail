# 项目构建说明

## 文件结构
```
nemail-app/
├── AndroidManifest.xml
├── activity_main.xml        # 主布局
├── MainActivity.java         # 主Activity
├── colors.xml               # 主题颜色
├── ic_launcher.svg          # 矢量图标
├── ic_launcher_background.svg
└── build_instructions.md    # 本文件
```

## 构建步骤

### 方法一：使用 Android Studio（推荐）
1. 安装 Android Studio (https://developer.android.com/studio)
2. 打开项目文件夹 nemail-app/
3. 等待 Gradle 同步完成
4. Build → Build Bundle(s) / APK(s) → Build APK(s)
5. APK 位于 app/build/outputs/apk/debug/app-debug.apk

### 方法二：命令行构建
```bash
cd nemail-app
./gradlew assembleDebug
# APK: app/build/outputs/apk/debug/app-debug.apk
```

## 功能特性
- 全屏 WebView 加载 mail.nekomini.dpdns.org
- Cookie 持久化（登录后保持会话）
- 底部导航栏（返回/刷新）
- 外部链接用系统浏览器打开
- mailto: 链接调用系统邮件客户端
- 缩放支持
- 深色主题 UI
- 网络错误提示

## 自定义
- 修改 MainActivity.java 中的 MAIL_URL 可更换目标网址
- 修改 colors.xml 可更换主题色
