#!/bin/bash -ex

# SPDX-FileCopyrightText: 2024 suyu Emulator Project
# SPDX-License-Identifier: GPL-3.0-or-later
# 
# Modified by AMA25 on 3/5/24

. ./.ci/scripts/common/pre-upload.sh

REV_NAME="suyu-${GITDATE}-${GITREV}"

BUILD_FLAVOR="mainline"

BUILD_TYPE_LOWER="release"
BUILD_TYPE_UPPER="Release"
if [ "${GITHUB_REPOSITORY}" == "suyu-emu/suyu" ]; then
    BUILD_TYPE_LOWER="relWithDebInfo"
    BUILD_TYPE_UPPER="RelWithDebInfo"
fi

cp src/android/app/build/outputs/apk/"${BUILD_FLAVOR}/${BUILD_TYPE_LOWER}/app-${BUILD_FLAVOR}-${BUILD_TYPE_LOWER}.apk" \
  "artifacts/${REV_NAME}.apk"
cp src/android/app/build/outputs/bundle/"${BUILD_FLAVOR}${BUILD_TYPE_UPPER}"/"app-${BUILD_FLAVOR}-${BUILD_TYPE_LOWER}.aab" \
  "artifacts/${REV_NAME}.aab"