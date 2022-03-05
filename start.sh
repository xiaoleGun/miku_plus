#!/bin/bash

if [ "$1" -o "$2" ]
then
if [[ "$1" = "faceunlock" ]] || [[ "$2" = "faceunlock" ]] || [[ "$1" = "volume" ]] || [[ "$2" = "volume" ]] 
then
echo ""
echo "Miku UI Plus"
echo "Executing in 3 seconds - CTRL-C to exit"
echo ""

sleep 3

set -e

if [ ! -d packages/apps/FaceUnlockService ]
then
    echo "Sync FaceUnlock [2-1]"
    git clone https://github.com/xiaoleGun-OpenSource/platform_packages_apps_FaceUnlockService packages/apps/FaceUnlockService
    echo ""
fi

if [ ! -d external/faceunlock ]
then
    echo "Sync FaceUnlock [2-2]"
    git clone https://github.com/xiaoleGun-OpenSource/platform_external_faceunlock external/faceunlock
    echo ""
fi

echo "Applying patches"
bash ./miku_plus/apply-patches.sh $1 $2
echo ""

echo "Success"
. build/envsetup.sh
else
echo "Error! Please enter the correct parameters."
fi
else
echo "Error! Please enter parameters."
fi
