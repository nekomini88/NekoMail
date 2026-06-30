# NekoMail

<p align="center">
  <img src="https://github.com/nekomini88/NekoMail/raw/main/app/src/main/res/mipmap-xhdpi/ic_launcher.png" width="120" alt="NekoMail Logo">
</p>

<p align="center">
  <a href="#chinese">🇨🇳 中文简体</a> | <a href="#english">🇬🇧 English</a>
</p>

---

<a name="chinese"></a>
## 🇨🇳 简体中文

NekoMail 是一个轻量级的 Android WebView 包装应用，旨在为 Roundcube Webmail 提供纯净的移动端访问体验。

### ✨ 功能特性
- **🚀 极致轻量**：采用原生的 WebView 实现，启动快，内存占用极低。
- **⚙️ 灵活配置**：支持在应用设置中自定义邮箱域名，无需重新构建。
- **📱 沉浸体验**：全屏响应式布局，适配多种 Android 设备。
- **🍪 会话持久化**：内置 Cookie 管理，登录一次即可长期保持会话。
- **🔗 智能路由**：外部链接自动跳转至系统浏览器，`mailto:` 协议自动调用邮件客户端。
- **🛠️ 自动发布**：集成 GitHub Actions，实现从代码推送至 APK 发布的自动化流程。

### 🛠️ 配置与构建
#### 默认配置
默认的目标域名在 `domain.properties` 中定义：
```properties
email_domain=mail.nekomini.dpdns.org
```

#### 本地构建
1. 环境准备：安装 Android SDK 和 Gradle。
2. 执行构建：
   ```bash
   gradle assembleDebug
   ```
3. 产物路径：`app/build/outputs/apk/debug/NekoMail.apk`

#### 自动化发布
- 通过推送版本标签触发 Release：`git tag v1.x && git push origin v1.x`

---

<a name="english"></a>
## 🇬🇧 English

NekoMail is a lightweight Android WebView wrapper designed to provide a clean and efficient mobile access experience for Roundcube Webmail.

### ✨ Features
- **🚀 Ultra-Lightweight**: Pure native WebView implementation for fast access and low resource usage.
- **⚙️ Configurable Domain**: Support for custom email domains directly within the app settings.
- **📱 Immersive Experience**: Full-screen responsive design optimized for various Android devices.
- **🍪 Session Persistence**: Integrated Cookie management to keep you signed in.
- **🔗 Smart Routing**: External links open in the system browser, and `mailto:` links trigger the system mail client.
- **🛠️ Auto-Deployment**: GitHub Actions integrated for a seamless "Code to APK" pipeline.

### 🛠️ Configuration & Build
#### Default Configuration
The default target domain is defined in `domain.properties`:
```properties
email_domain=mail.nekomini.dpdns.org
```

#### Local Build
1. Prerequisites: Install Android SDK and Gradle.
2. Run build:
   ```bash
   gradle assembleDebug
   ```
3. APK Location: `app/build/outputs/apk/debug/NekoMail.apk`

#### Auto Release
- Trigger a GitHub Release by pushing a version tag: `git tag v1.x && git push origin v1.x`

---

## License
MIT