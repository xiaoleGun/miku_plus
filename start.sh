#!/bin/bash

echo ""
echo "Miku UI应用FaceUnlock补丁脚本"
echo "三秒钟后将开始，你可以选择Ctrl+C退出"
echo ""

sleep 3

set -e

if [ ! -d packages/apps/FaceUnlockService ]
then
    echo "同步FaceUnlock依赖2-1"
    git clone https://github.com/xiaoleGun-OpenSource/platform_packages_apps_FaceUnlockService packages/apps/FaceUnlockService
    echo ""
fi

if [ ! -d external/faceunlock ]
then
    echo "同步FaceUnlock依赖2-2"
    git clone https://github.com/xiaoleGun-OpenSource/platform_external_faceunlock external/faceunlock
    echo ""
fi

echo "应用补丁"
echo "如有报错请尽快提出issue"
bash ./miku_faceunlock/apply-patches.sh

echo "成功，请开始编译叭"
. build/envsetup.sh
