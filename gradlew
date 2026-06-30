#!/bin/sh
# Gradle wrapper script
# 如果没有本地 Gradle，尝试下载

GRADLE_VERSION="8.2"
GRADLE_DIR="$HOME/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
GRADLE_BIN="$GRADLE_DIR/*/gradle-${GRADLE_VERSION}/bin/gradle"

if [ ! -f "$GRADLE_BIN" ]; then
    echo "Downloading Gradle ${GRADLE_VERSION}..."
    mkdir -p "$GRADLE_DIR"
    cd "$GRADLE_DIR"
    curl -sL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o gradle.zip
    unzip -q gradle.zip
fi

exec $GRADLE_BIN "$@"
