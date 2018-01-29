#!/bin/bash
# Run this from within a bash shell
HOST_IP=`hostname --all-ip-addresses`
if [[ ${HOST_IP} == *"10.10.10.65"* ]] || [[ ${HOST_IP} == *"10.10.10.67"* ]];
then
    ANDROID_NDK=/home/pub/ndk/android-ndk-r10d/
else
	ANDROID_SDK=~/programs/android/sdk
    ANDROID_NDK=${ANDROID_SDK}/ndk-bundle/
fi

rm -rf build lib

cmake -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake                     \
      -DCMAKE_BUILD_TYPE=Release                                            \
      -DANDROID_FORCE_ARM_BUILD=ON                                          \
      -DANDROID_NDK=${ANDROID_NDK}                                          \
      -DANDROID_SYSROOT=${PLATFORM}                                         \
      -DANDROID_ABI="armeabi-v7a with NEON"                                 \
      -DANDROID_TOOLCHAIN_NAME="arm-linux-androideabi-4.8"                  \
      -DANDROID_NATIVE_API_LEVEL=android-21                                 \
      -DANDROID_STL=system                                                  \
      -DRKPLATFORM=ON                                                       \
      -DHAVE_DRM=ON                                                         \
      ../../../

# ----------------------------------------------------------------------------
# usefull cmake debug flag
# ----------------------------------------------------------------------------
      #-DMPP_NAME="rockchip_mpp"                                             \
      #-DVPU_NAME="rockchip_vpu"                                             \
      #-DHAVE_DRM                                                            \
      #-DCMAKE_BUILD_TYPE=Debug                                              \
      #-DCMAKE_VERBOSE_MAKEFILE=true                                         \
      #--trace                                                               \
      #--debug-output                                                        \

#cmake --build . --clean-first -- V=1
cmake --build build

#rename
mv ${PWD}/lib/librockchip_vpu.so ${PWD}/lib/libvpu.so
mv ${PWD}/lib/librockchip_mpp.so ${PWD}/lib/libmpp.so
# ----------------------------------------------------------------------------
# test script
# ----------------------------------------------------------------------------
#adb push osal/test/rk_log_test /system/bin/
#adb push osal/test/rk_thread_test /system/bin/
#adb shell sync
#adb shell logcat -c
#adb shell rk_log_test
#adb shell rk_thread_test
#adb logcat -d|tail -30


