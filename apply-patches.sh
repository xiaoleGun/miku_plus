#!/bin/bash

SOURCE_DIR=$PWD
MIKU=${SOURCE_DIR}/miku_faceunlock/patches/

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

#platform_device_miku_sepolicy
DISPLAY_MSG=1
cp -r ${MIKU}/platform_device_miku_sepolicy ${SOURCE_DIR}/device/miku/sepolicy/miku && cd ${SOURCE_DIR}/device/miku/sepolicy
for i in {0001..0001}
do apply_patches device/miku/sepolicy miku $i
done

#platform_frameworks_base
DISPLAY_MSG=1
cp -r ${MIKU}/platform_frameworks_base ${SOURCE_DIR}/frameworks/base/miku && cd ${SOURCE_DIR}/frameworks/base
for i in {0001..0024}
do apply_patches frameworks/base miku $i
done

#platform_packages_apps_Settings
DISPLAY_MSG=1
cp -r ${MIKU}/platform_packages_apps_Settings ${SOURCE_DIR}/packages/apps/Settings/miku && cd ${SOURCE_DIR}/packages/apps/Settings
for i in {0001..0011}
do apply_patches packages/apps/Settings miku $i
done

#platform_vendor_miku
DISPLAY_MSG=1
cp -r ${MIKU}/platform_vendor_miku ${SOURCE_DIR}/vendor/miku/miku && cd ${SOURCE_DIR}/vendor/miku
for i in {0001..0002}
do apply_patches vendor/miku miku $i
done

#platform_vendor_MikuSettings
DISPLAY_MSG=1
cp -r ${MIKU}/platform_vendor_MikuSettings ${SOURCE_DIR}/vendor/MikuSettings/miku && cd ${SOURCE_DIR}/vendor/MikuSettings
for i in {0001..0002}
do apply_patches vendor/MikuSettings miku $i
done

mkdir apply_patches_end

rm -rf ${SOURCE_DIR}/device/miku/*/{miku}
rm -rf ${SOURCE_DIR}/frameworks/*/{miku}
rm -rf ${SOURCE_DIR}/packages/apps/*/{miku}
rm -rf ${SOURCE_DIR}/vendor/*/{miku}
