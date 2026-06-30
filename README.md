# NekoMail

A lightweight Android WebView wrapper for Roundcube Webmail. / 一个轻量级的 Roundcube Webmail 安卓 WebView 包装应用。

---

## 🇬🇧 English

### Features
- 🚀 **Fast & Lightweight**: Minimalist WebView implementation for quick access.
- ⚙️ **Configurable Domain**: Support custom email domains via settings or config file.
- 📱 **Responsive Layout**: Full-screen optimized experience.
- 🛠️ **CI/CD**: Automated builds and releases via GitHub Actions.

### Configuration
The default target email domain is configured in `domain.properties`:
```properties
email_domain=mail.nekomini.dpdns.org
```

### Build and Deploy
#### Local Build
1. Install Android SDK and Gradle.
2. Run: `gradle assembleDebug`
3. APK path: `app/build/outputs/apk/debug/NekoMail.apk`

#### Automatic Release
- Push a tag (e.g., `git tag v1.2 && git push origin v1.2`) to trigger a GitHub Release.

---

## 🇨🇳 简体中文

### 功能特性
- 🚀 **轻量快速**：极致精简的 WebView 实现，快速访问邮箱。
- ⚙️ **域名可配置**：支持通过设置界面或配置文件自定义邮箱域名。
- 📱 **适配布局**：全屏沉浸式设计，适配多种屏幕尺寸。
- 🛠️ **自动化构建**：通过 GitHub Actions 实现自动构建与发布。

### 配置说明
默认的目标邮箱域名在 `domain.properties` 中定义：
```properties
email_domain=mail.nekomini.dpdns.org
```

### 构建与部署
#### 本地构建
1. 安装 Android SDK 和 Gradle。
2. 执行命令：`gradle assembleDebug`
3. APK 路径：`app/build/outputs/apk/debug/NekoMail.apk`

#### 自动化发布
- 推送版本标签（例如：`git tag v1.2 && git push origin v1.2`）即可自动触发 GitHub Release 发布。

---

## License
MIT