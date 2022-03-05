#!/bin/bash

SOURCE_DIR=$PWD
FACEUNLOCK=${SOURCE_DIR}/miku_plus/patches/faceunlock
VOLUME=${SOURCE_DIR}/miku_plus/patches/volume

RED_BOLD="\e[1;31m"
RED_BOLD_HIGHLIGHT="\e[1;41m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

apply_patches() {
  if [ "$PWD" == "${SOURCE_DIR}/$1" ]; then
     git am $2/$3*
  elif [ ${DISPLAY_MSG} == 1 ]; then
     echo -e "${RED_BOLD_HIGHLIGHT}Current Directory:${ENDCOLOR} ${YELLOW} $PWD ≠ ${SOURCE_DIR}/$1${ENDCOLOR}"
     echo -e "${RED_BOLD}Skipping patches for $1 ${ENDCOLOR}"
     DISPLAY_MSG="0"
  fi
}

if [[ "$1" = "faceunlock" ]] || [[ "$2" = "faceunlock" ]] 
then
#platform_device_miku_sepolicy
DISPLAY_MSG=1
cp -r ${FACEUNLOCK}/platform_device_miku_sepolicy ${SOURCE_DIR}/device/miku/sepolicy/faceunlock && cd ${SOURCE_DIR}/device/miku/sepolicy
for i in {0001..0001}
do apply_patches device/miku/sepolicy faceunlock $i
done

#platform_frameworks_base
DISPLAY_MSG=1
cp -r ${FACEUNLOCK}/platform_frameworks_base ${SOURCE_DIR}/frameworks/base/faceunlock && cd ${SOURCE_DIR}/frameworks/base
for i in {0001..0024}
do apply_patches frameworks/base faceunlock $i
done

#platform_packages_apps_Settings
DISPLAY_MSG=1
cp -r ${FACEUNLOCK}/platform_packages_apps_Settings ${SOURCE_DIR}/packages/apps/Settings/faceunlock && cd ${SOURCE_DIR}/packages/apps/Settings
for i in {0001..0011}
do apply_patches packages/apps/Settings faceunlock $i
done

#platform_vendor_miku
DISPLAY_MSG=1
cp -r ${FACEUNLOCK}/platform_vendor_miku ${SOURCE_DIR}/vendor/miku/faceunlock && cd ${SOURCE_DIR}/vendor/miku
for i in {0001..0002}
do apply_patches vendor/miku faceunlock $i
done

#platform_vendor_MikuSettings
DISPLAY_MSG=1
cp -r ${FACEUNLOCK}/platform_vendor_MikuSettings ${SOURCE_DIR}/vendor/MikuSettings/faceunlock && cd ${SOURCE_DIR}/vendor/MikuSettings
for i in {0001..0002}
do apply_patches vendor/MikuSettings faceunlock $i
done

rm -rf ${SOURCE_DIR}/device/miku/*/{faceunlock}
rm -rf ${SOURCE_DIR}/frameworks/*/{faceunlock}
rm -rf ${SOURCE_DIR}/packages/apps/*/{faceunlock}
rm -rf ${SOURCE_DIR}/vendor/*/{faceunlock}
fi

if [[ "$1" = "volume" ]] || [[ "$2" = "volume" ]] 
then
#platform_frameworks_av
DISPLAY_MSG=1
cp -r ${VOLUME}/platform_frameworks_av ${SOURCE_DIR}/frameworks/av/volume && cd ${SOURCE_DIR}/frameworks/av
for i in {0001..0001}
do apply_patches frameworks/av volume $i
done

#platform_frameworks_base
DISPLAY_MSG=1
cp -r ${VOLUME}/platform_frameworks_base ${SOURCE_DIR}/frameworks/base/volume && cd ${SOURCE_DIR}/frameworks/base
for i in {0001..0001}
do apply_patches frameworks/base volume $i
done

#platform_packages_apps_Settings
DISPLAY_MSG=1
cp -r ${VOLUME}/platform_packages_apps_Settings ${SOURCE_DIR}/packages/apps/Settings/volume && cd ${SOURCE_DIR}/packages/apps/Settings
for i in {0001..0002}
do apply_patches packages/apps/Settings volume $i
done
fi
