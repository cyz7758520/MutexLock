::获取逻辑处理器数量
@echo off
setlocal enabledelayedexpansion
set line=0
for /f  %%i in ('wmic cpu get NumberOfLogicalProcessors') do (
set /a line+=1
if !line!==2 set Num=%%i
)
@echo on

ndk-build.cmd -j%Num% NDK_DEBUG=0 V=1 APP_ABI="armeabi-v7a arm64-v8a x86 x86_64" APP_PLATFORM=android-16 NDK_PROJECT_PATH=../ APP_BUILD_SCRIPT=./Android.mk APP_STL=system