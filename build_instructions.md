# 项目构建说明

## 文件结构
```
nemail-app/
├── domain.properties       # 域名配置文件
├── app/
│   ├── src/main/
│   │   ├── AndroidManifest.xml
│   │   ├── java/com/nekomini/mail/
│   │   │   ├── MainActivity.java
│   │   │   └── SettingsActivity.java
│   │   └── res/
│   │       ├── layout/
│   │       │   ├── activity_main.xml
│   │       │   └── activity_settings.xml
│   │       └── values/
│   │           ├── colors.xml
│   │           └── ids.xml
└── build_instructions.md    # 本文件
```

## 构建步骤

### 方法一：使用 Android Studio（推荐）
1. 安装 Android Studio (https://developer.android.com/studio)
2. 打开项目文件夹 nemail-app/
3. 等待 Gradle 同步完成
4. Build → Build Bundle(s) / APK(s) → Build APK(s)
5. APK 位于 app/build/outputs/apk/debug/NekoMail.apk

### 方法二：命令行构建
```bash
cd nemail-app
gradle assembleDebug
# APK: app/build/outputs/apk/debug/NekoMail.apk
```

## 功能特性
- 🚀 全屏 WebView 加载配置的邮箱域名
- ⚙️ 支持在应用内通过设置界面实时修改域名
- 🍪 Cookie 持久化（登录后保持会话）
- 🔗 外部链接用系统浏览器打开
- 📧 mailto: 链接调用系统邮件客户端
- 🔍 缩放支持 & 网络错误提示

## 自定义
- **域名配置**：修改项目根目录下的 `domain.properties` 文件。
- **主题色**：修改 `app/src/main/res/values/colors.xml`。
