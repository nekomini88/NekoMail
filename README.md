# NekoMail

![NekoMail Logo](https://imbed.nekomini.dpdns.org/file/1782807402564_app-debug.apk) <!-- Placeholder for actual logo if available -->

[![GitHub release](https://img.shields.io/github/v/release/nekomini88/NekoMail)](https://github.com/nekomini88/NekoMail/releases)
[![GitHub license](https://img.shields.io/github/license/nekomini88/NekoMail)](https://github.com/nekomini88/NekoMail/blob/main/LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/nekomini88/NekoMail)](https://github.com/nekomini88/NekoMail/commits/main)

> **NekoMail** 是一个轻量级 Android WebView 包装应用，用于访问 Roundcube Webmail。  
> **NekoMail** is a lightweight Android WebView wrapper for Roundcube Webmail.

---

## 🌐 语言 / Language

[English](#english) | [简体中文](#简体中文) | [Français](#français) | [日本語](#日本語)

---

## 📦 功能特性 / Features

- **极致轻量 / Ultra-Lightweight** : 原生 WebView，启动快，资源占用低  
- **域名可配置 / Configurable Domain** : 支持在应用内或通过配置文件自定义邮件服务器地址  
- **Cookie 持久化 / Session Persistence** : 登录状态保持，免频繁输入密码  
- **智能路由 / Smart Link Handling** : 外部链接使用系统浏览器打开，`mailto:` 调用系统邮件客户端  
- **全屏沉浸 / Immersive Fullscreen** : 适配各种屏幕尺寸，提供沉浸式邮件阅读体验  
- **自动化构建 / CI/CD** : GitHub Actions 自动编译 APK 并发布 Release  

## ⚙️ 配置与构建 / Configuration & Build

### 默认配置 / Default Configuration

默认目标域名定义在项目根目录的 `domain.properties` 文件中：

```properties
email_domain=mail.nekomini.dpdns.org
```

修改此文件即可更改默认域名，无需改动代码。

### 本地构建 / Local Build

#### 先决条件 / Prerequisites

- Android SDK (推荐版本 21+)
- Gradle (随 Android Studio 自带或手动安装)

#### 构建步骤 / Build Steps

```bash
# 克隆仓库
git clone https://github.com/nekomini88/NekoMail.git
cd NekoMail

# 编译 Debug APK
gradle assembleDebug
```

生成的 APK 位于：

```
app/build/outputs/apk/debug/NekoMail.apk
```

### 自动化发布 / Automated Release

推送 Git tag 即可触发 GitHub Actions 自动构建并创建 Release：

```bash
git tag v1.2
git push origin v1.2
```

Release 页面：https://github.com/nekomini88/NekoMail/releases

## 📄 许可证 / License

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

--- 

<a name="english"></a>
## 🇬🇧 English

NekoMail is a lightweight Android WebView wrapper designed to provide a clean and efficient mobile experience for accessing Roundcube Webmail.

### ✨ Features
- **Ultra-Lightweight**: Native WebView for fast launch and low resource usage.  
- **Configurable Domain**: Set your email server via in-app settings or `domain.properties`.  
- **Session Persistence**: Cookie handling keeps you logged in across app launches.  
- **Smart Link Handling**: External links open in system browser; `mailto:` triggers the native mail client.  
- **Immersive Fullscreen**: Optimized for various screen sizes, delivering a distraction‑free mail view.  
- **CI/CD**: GitHub Actions automatically builds the APK and publishes a Release on tag push.  

### 🛠️ Configuration & Build
#### Default Configuration
The default target mail domain is defined in `domain.properties`:

```properties
email_domain=mail.nekomini.dpdns.org
```

Edit this file to change the default domain without touching code.

#### Local Build
1. Install Android SDK and Gradle.  
2. Run:
   ```bash
   gradle assembleDebug
   ```
3. Locate the APK at:  
   `app/build/outputs/apk/debug/NekoMail.apk`

#### Automated Release
Push a version tag to trigger GitHub Actions:
```bash
git tag v1.2
git push origin v1.2
```
The released APK will be available on the [Releases](https://github.com/nekomini88/NekoMail/releases) page.

--- 

<a name="简体中文"></a>
## 🇨🇳 简体中文

NekoMail 是一个基于 Android WebView 的轻量级包装应用，专为提供流畅的移动端 Roundcube Webmail 访问体验而设计。

### ✨ 功能特性
- **极致轻量**：原生 WebView 实现，启动迅速，占用资源极少。  
- **域名可配置**：可通过应用内设置或修改 `domain.properties` 自定义邮件服务器地址。  
- **Cookie 持久化**：登录状态自动保存，减少重复输入密码的麻烦。  
- **智能链接处理**：外部链接使用系统浏览器打开，`mailto:` 链接调用系统邮件客户端。  
- **全屏沉浸**：适配多种屏幕尺寸，提供专注的邮件阅读界面。  
- **自动化构建**：借助 GitHub Actions 实现代码提交自动编译 APK 并发布 Release。  

### ⚙️ 配置与构建
#### 默认配置
项目根目录下的 `domain.properties` 文件定义了默认目标域名：

```properties
email_domain=mail.nekomini.dpdns.org
```

修改该文件即可更改默认域名，无需改动代码。

#### 本地构建
1. 安装 Android SDK 与 Gradle。  
2. 执行编译命令：
   ```bash
   gradle assembleDebug
   ```
3. 生成的 APK 路径为：  
   `app/build/outputs/apk/debug/NekoMail.apk`

#### 自动化发布
通过推送 Git 标签触发 GitHub Actions 自动构建并创建 Release：
```bash
git tag v1.2
git push origin v1.2
```
发布后可在 [Releases](https://github.com/nekomini88/NekoMail/releases) 页面下载 APK。

--- 

<a name="français"></a>
## 🇫🇷 Français

NekoMail est une enveloppe légère basée sur Android WebView conçue pour offrir une expérience mobile fluide lors de l’accès à Roundcube Webmail.

### ✨ Fonctionnalités
- **Ultra‑léger** : WebView natif pour un démarrage rapide et une faible consommation de ressources.  
- **Domaine configurable** : Définissez votre serveur de messagerie via les paramètres de l’application ou le fichier `domain.properties`.  
- **Persistance de session** : La gestion des cookies permet de rester connecté entre les lancements de l’application.  
- **Gestion intelligente des liens** : Les liens externes s’ouvrent dans le navigateur système ; les liens `mailto:` lancent le client de messagerie natif.  
- **Plein écran immersif** : Optimisé pour différentes tailles d’écran, offrant une vue de messagerie sans distraction.  
- **CI/CD** : GitHub Actions compile automatiquement l’APK et publie une version lorsqu’un tag est poussé.  

### 🛠️ Configuration & Build
#### Configuration par défaut
Le domaine cible par défaut est défini dans le fichier `domain.properties` à la racine du projet :

```properties
email_domain=mail.nekomini.dpdns.org
```

Modifiez ce fichier pour changer le domaine par défaut sans toucher au code.

#### Compilation locale
1. Installez le SDK Android et Gradle.  
2. Exécutez :
   ```bash
   gradle assembleDebug
   ```
3. L’APK se trouve à :  
   `app/build/outputs/apk/debug/NekoMail.apk`

#### Publication automatisée
En poussant un tag de version, GitHub Actions construit l’APK et crée une Release :
```bash
git tag v1.2
git push origin v1.2
```
L’APK sera disponible sur la page [Releases](https://github.com/nekomini88/NekoMail/releases).

--- 

<a name="日本語"></a>
## 🇯🇵 日本語

NekoMail は、Android WebView をラップした軽量アプリで、モバイルから快適に Roundcube Webmail にアクセスするために設計されています。

### ✨ 機能
- **超軽量** : ネイティブ WebView を採用し、起動が高速でリソース消費が少ない。  
- **ドメイン設定可能** : アプリ内設定または `domain.properties` ファイルでメールサーバをカスタマイズ可能。  
- **セッション永続化** : Cookie 管理により、ログイン状態をアプリ起動間で維持。  
- **スマートリンク処理** : 外部リンクはシステムブラウザで開き、`mailto:` リンクは標準メールクライアントを起動。  
- **フルスクリーン immersive** : 各種画面サイズに最適化され、邪魔されないメール閲覧体験を提供。  
- **CI/CD** : GitHub Actions がコードプッシュ時に APK を自動ビルドし、リリースとして公開。  

### ⚙️ 設定とビルド
#### デフォルト設定
プロジェクトのルートディレクトリにある `domain.properties` ファイルでデフォルトのメールドメインを定義：

```properties
email_domain=mail.nekomini.dpdns.org
```

このファイルを編集するだけでデフォルトドメインを変更でき、コードを触る必要はありません。

#### ローカルビルド
1. Android SDK と Gradle をインストール。  
2. 次のコマンドを実行：
   ```bash
   gradle assembleDebug
   ```
3. 生成された APK の場所：  
   `app/build/outputs/apk/debug/NekoMail.apk`

#### 自動リリース
バージョンタグをプッシュすると、GitHub Actions がビルドとリリースを自動実行：
```bash
git tag v1.2
git push origin v1.2
```
リリースされた APK は [Releases](https://github.com/nekomini88/NekoMail/releases) ページからダウンロードできます。

--- 

*Made with ❤️ for the NekoMail community.*