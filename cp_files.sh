#!/bin/bash
if [ ! -e "$1" ]; then
  echo "Invalid FreeRTOS_root '$1'"
  exit 1
fi
FreeRTOS_root=$1
mkdir -p FreeRTOS/include FreeRTOS/portable/MemMang FreeRTOS/portable/ThirdParty/GCC
cp $FreeRTOS_root/*.c $FreeRTOS_root/CMakeLists.txt FreeRTOS/
cp $FreeRTOS_root/include/*.h $FreeRTOS_root/include/CMakeLists.txt FreeRTOS/include/
cp $FreeRTOS_root/portable/CMakeLists.txt FreeRTOS/portable/
cp $FreeRTOS_root/portable/MemMang/*.c FreeRTOS/portable/MemMang/
cp -r $FreeRTOS_root/portable/ThirdParty/GCC/Posix/ FreeRTOS/portable/ThirdParty/GCC/Posix/
