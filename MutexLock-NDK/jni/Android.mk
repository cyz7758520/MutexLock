LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := MutexLock
LOCAL_LDFLAGS := -Wl,-O1 -Wl,-gc-sections -Wl,--hash-style=sysv -Wl,--as-needed -l:libc.so -l:liblog.so -Wl,--export-dynamic-symbol=MutexLocked -Wl,--export-dynamic-symbol=MutexUnlock
LOCAL_CFLAGS := -fPIC -pipe -fvisibility=hidden -fomit-frame-pointer -frename-registers -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -D__STDINT_LIMITS -DHAVE_INTTYPES_H -Ofast
LOCAL_CPPFLAGS := 
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
LOCAL_CFLAGS += -D__NAME_MUTEXLOCK__ -D__ANDROID_GCC__ -D__ARMV7__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_ARM_NEON := true
LOCAL_CFLAGS += -D__NAME_MUTEXLOCK__ -D__ANDROID_GCC__ -D__ARMV8__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
else ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_CFLAGS += -D__NAME_MUTEXLOCK__ -D__ANDROID_GCC__ -D__X86__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
else ifeq ($(TARGET_ARCH_ABI),x86_64)
LOCAL_CFLAGS += -D__NAME_MUTEXLOCK__ -D__ANDROID_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
endif
LOCAL_C_INCLUDES := ../../Source/MutexLock
LOCAL_SRC_FILES := ../../Source/MutexLock-NDK/MutexLockJniLoadAndUnload.cpp \
                   ../../Source/MutexLock/MutexLock.cpp
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_SRC_FILES += ../../Source/MutexLock/MutexLock_AndroidGCC_Armv7.s
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_SRC_FILES += ../../Source/MutexLock/MutexLock_AndroidGCC_Armv8.s
else ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_SRC_FILES += ../../Source/MutexLock/MutexLock_AndroidGCC_x86.asm
else ifeq ($(TARGET_ARCH_ABI),x86_64)
LOCAL_SRC_FILES += ../../Source/MutexLock/MutexLock_AndroidGCC_x64.asm
endif

$(warning NDK_DEBUG=$(NDK_DEBUG))
$(warning APP_OPTIM=$(APP_OPTIM))
$(warning APP_ABI=$(APP_ABI))
$(warning APP_PLATFORM=$(APP_PLATFORM))
$(warning NDK_PROJECT_PATH=$(NDK_PROJECT_PATH))
$(warning LOCAL_MODULE=$(LOCAL_MODULE))
$(warning NDK_TOOLCHAIN_VERSION=$(NDK_TOOLCHAIN_VERSION))
$(warning LOCAL_CFLAGS=$(LOCAL_CFLAGS))
$(warning LOCAL_CPPFLAGS=$(LOCAL_CPPFLAGS))

include $(BUILD_SHARED_LIBRARY)