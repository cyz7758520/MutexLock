set Name=MutexLock

set Dir=%~dp0\%Name%
del /S /Q "%Dir%\*.pdb" "%Dir%\*.idb" "%Dir%\*.ipdb" "%Dir%\*.exp" "%Dir%\*.iobj" "%Dir%\*.ilk" "%Dir%\*.lib" "%Dir%\*.dll" "%Dir%\*.exe"

::这个.vs文件夹不要删，删了会重置编译器的启动项目和打开的文件。
::set Dir=%~dp0\%Name%-Visual_Studio
::rmdir /S /Q "%Dir%\.vs"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x86_Debug_LNKDLL_DLL
rmdir /S /Q "%Dir%\Win32"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x86_Debug_LNKLIB_LIB
rmdir /S /Q "%Dir%\Win32"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x86_Release_LNKDLL_DLL
rmdir /S /Q "%Dir%\Win32"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x86_Release_LNKLIB_LIB
rmdir /S /Q "%Dir%\Win32"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x64_Debug_LNKDLL_DLL
rmdir /S /Q "%Dir%\x64"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x64_Debug_LNKLIB_LIB
rmdir /S /Q "%Dir%\x64"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x64_Release_LNKDLL_DLL
rmdir /S /Q "%Dir%\x64"

set Dir=%~dp0\%Name%-Visual_Studio\%Name%_MSVC++_x64_Release_LNKLIB_LIB
rmdir /S /Q "%Dir%\x64"

set Dir=%~dp0\%Name%-NDK
rmdir /S /Q "%Dir%\obj\local" "%Dir%\libs\armeabi-v7a" "%Dir%\libs\arm64-v8a" "%Dir%\libs\x86" "%Dir%\libs\x86_64"

set Dir=%~dp0\%Name%-KEIL\%Name%_KeilArmC_Armv7_Release_LNKLIB_LIB\Objects
del /Q "%Dir%\*"

set Dir=%~dp0\%Name%-KEIL\%Name%_KeilArmC_Armv8_Release_LNKLIB_LIB\Objects
del /Q "%Dir%\*"