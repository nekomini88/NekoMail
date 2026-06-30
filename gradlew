#!/bin/sh
# Gradle wrapper script - downloads and runs Gradle

GRADLE_VERSION="8.2"
GRADLE_USER_HOME="${GRADLE_USER_HOME:-${HOME}/.gradle}"
GRADLE_DIST_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
GRADLE_DIST_DIR="${GRADLE_USER_HOME}/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
GRADLE_HOME="${GRADLE_DIST_DIR}/*/gradle-${GRADLE_VERSION}"

# Function to find actual gradle binary
find_gradle_bin() {
    local dist_dir="${GRADLE_DIST_DIR}"
    # Find the actual extracted directory (contains a hash)
    for d in "${dist_dir}"/*/; do
        if [ -f "${d}gradle-${GRADLE_VERSION}/bin/gradle" ]; then
            echo "${d}gradle-${GRADLE_VERSION}/bin/gradle"
            return 0
        fi
    done
    return 1
}

# Try to find existing gradle
GRADLE_BIN=$(find_gradle_bin 2>/dev/null)

if [ -z "${GRADLE_BIN}" ] || [ ! -f "${GRADLE_BIN}" ]; then
    echo "Downloading Gradle ${GRADLE_VERSION}..."
    mkdir -p "${GRADLE_DIST_DIR}"
    cd "${GRADLE_DIST_DIR}"
    curl -sL "${GRADLE_DIST_URL}" -o gradle.zip
    unzip -q gradle.zip
    GRADLE_BIN=$(find_gradle_bin 2>/dev/null)
fi

if [ -z "${GRADLE_BIN}" ] || [ ! -f "${GRADLE_BIN}" ]; then
    echo "Error: Failed to find or download Gradle" >&2
    exit 1
fi

exec "${GRADLE_BIN}" "$@"