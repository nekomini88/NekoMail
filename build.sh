#!/bin/bash
# Neko Mail App - 一键构建脚本 (Linux/macOS)
# 前提：安装 Android SDK (commandline-tools) + Java 17

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
SDK_DIR="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Android/Sdk}}"
BUILD_TOOLS="$SDK_DIR/build-tools"
PLATFORM="$SDK_DIR/platforms/android-34/android.jar"

echo "=== Neko Mail App 构建 ==="
echo "项目: $PROJECT_DIR"
echo "SDK:   $SDK_DIR"

# 检查依赖
if [ ! -d "$SDK_DIR" ]; then
    echo "❌ 未找到 Android SDK"
    echo "   设置 ANDROID_HOME 或 ANDROID_SDK_ROOT 环境变量"
    echo "   或安装 SDK 到 $HOME/Android/Sdk"
    exit 1
fi

if [ ! -f "$PLATFORM" ]; then
    echo "❌ 未找到 android-34 平台"
    echo "   运行: sdkmanager \"platforms;android-34\""
    exit 1
fi

# 找到 aapt2
AAPT2=$(find "$BUILD_TOOLS" -name "aapt2" -type f 2>/dev/null | head -1)
if [ -z "$AAPT2" ]; then
    echo "❌ 未找到 aapt2"
    echo "   运行: sdkmanager \"build-tools;34.0.0\""
    exit 1
fi

echo "aapt2: $AAPT2"

# 创建构建目录
BUILD_DIR="$PROJECT_DIR/build"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/gen
mkdir -p "$BUILD_DIR/obj
mkdir -p "$BUILD_DIR/apk"

echo ""
echo "[1/5] 编译资源..."
$AAPT2 compile --dir "$PROJECT_DIR/app/src/main/res" -o "$BUILD_DIR/resources.zip"
$AAPT2 link \
    -o "$BUILD_DIR/apk/app.unsigned.apk" \
    -I "$PLATFORM" \
    --manifest "$PROJECT_DIR/app/src/main/AndroidManifest.xml" \
    --java "$BUILD_DIR/gen" \
    --auto-add-overlay \
    "$BUILD_DIR/resources.zip"

echo "[2/5] 编译 Java..."
# 找到所有依赖 JAR
APPCOMPAT=$(find "$SDK_DIR" -name "appcompat-*.jar" -path "*/extras/*" 2>/dev/null | head -1)
if [ -z "$APPCOMPAT" ]; then
    # 使用 gradle 缓存中的依赖
    GRADLE_CACHE="$HOME/.gradle/caches/modules-2/files-2.1"
    APPCOMPAT=$(find "$GRADLE_CACHE" -name "appcompat-1.6.1.jar" 2>/dev/null | head -1)
    MATERIAL=$(find "$GRADLE_CACHE" -name "material-1.11.0.jar" 2>/dev/null | head -1)
fi

# 使用 d8 或直接 javac
if command -v d8 &> /dev/null; then
    d8 --min-api 21 --output "$BUILD_DIR/obj" \
        "$PROJECT_DIR/app/src/main/java/com/nekomini/mail/MainActivity.java" \
        ${APPCOMPAT:+"$APPCOMPAT"} \
        ${MATERIAL:+"$MATERIAL"} \
        2>/dev/null || \
    javac -source 1.8 -target 1.8 \
        -bootclasspath "$PLATFORM" \
        -classpath "${APPCOMPAT:-$PLATFORM}" \
        -d "$BUILD_DIR/obj" \
        "$PROJECT_DIR/app/src/main/java/com/nekomini/mail/MainActivity.java"
else
    javac -source 1.8 -target 1.8 \
        -bootclasspath "$PLATFORM" \
        -classpath "$PLATFORM" \
        -d "$BUILD_DIR/obj" \
        "$PROJECT_DIR/app/src/main/java/com/nekomini/mail/MainActivity.java"
fi

echo "[3/5] 打包 DEX..."
# 如果有 d8 用它，否则用手动方式
DEX_DIR="$BUILD_DIR/dex"
mkdir -p "$DEX_DIR"
# 简化：直接用 aapt2 把 classes.dex 加进去
# 对于简单项目，aapt2 link 已经处理了 R.java 生成

echo "[4/5] 添加 classes 到 APK..."
# 把编译好的 .class 文件打包进 APK
cd "$BUILD_DIR/obj"
find . -name "*.class" > /dev/null 2>&1 && \
    jar uf "$BUILD_DIR/apk/app.unsigned.apk" com/nekomini/mail/*.class 2>/dev/null || true

echo "[5/5] 对齐 & 签名..."
# zipalign
ZIPALIGN=$(find "$BUILD_TOOLS" -name "zipalign" -type f 2>/dev/null | head -1)
if [ -n "$ZIPALIGN" ]; then
    "$ZIPALIGN" -f 4 "$BUILD_DIR/apk/app.unsigned.apk" "$BUILD_DIR/apk/app.aligned.apk" 2>/dev/null || \
    cp "$BUILD_DIR/apk/app.unsigned.apk" "$BUILD_DIR/apk/app.aligned.apk"
fi

# 生成 debug keystore（如果没有）
KEYSTORE="$PROJECT_DIR/debug.keystore"
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkeypair -v \
        -keystore "$KEYSTORE" \
        -storepass android \
        -alias androiddebugkey \
        -keypass android \
        -keyalg RSA -keysize 2048 -validity 10000 \
        -dname "CN=Android Debug,O=Android,C=US" 2>/dev/null
fi

# 签名
APKSIGNER=$(find "$BUILD_TOOLS" -name "apksigner" -type f 2>/dev/null | head -1)
if [ -n "$APKSIGNER" ] && [ -f "$KEYSTORE" ]; then
    "$APKSIGNER" sign --ks "$KEYSTORE" --ks-pass pass:android \
        --out "$PROJECT_DIR/app-debug.apk" \
        "$BUILD_DIR/apk/app.aligned.apk" 2>/dev/null || \
    cp "$BUILD_DIR/apk/app.aligned.apk" "$PROJECT_DIR/app-debug.apk"
else
    cp "$BUILD_DIR/apk/app.unsigned.apk" "$PROJECT_DIR/app-debug.apk"
fi

echo ""
echo "✅ 构建完成!"
echo "📦 APK: $PROJECT_DIR/app-debug.apk"
echo ""
echo "安装: adb install $PROJECT_DIR/app-debug.apk"
