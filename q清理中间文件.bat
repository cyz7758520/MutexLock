set Name=MutexLock

::清理生成文件夹
set Dir=%~dp0\%Name%
del /S /Q "%Dir%\*.pdb" "%Dir%\*.idb" "%Dir%\*.ipdb" "%Dir%\*.exp" "%Dir%\*.iobj" "%Dir%\*.ilk"

::清理Visual_Studio文件夹
set Dir=%~dp0\%Name%-Visual_Studio
::这个.vs文件夹不要删，删了会重置编译器的启动项目和打开的文件，只要删除ipch子文件夹就可以了。
::rmdir /S /Q "%Dir%\.vs"
rmdir /S /Q "%Dir%\.vs\%Name%\v16\ipch"

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

::清理Cygwin_Linux文件夹
set Dir=%~dp0\%Name%-Cygwin_Linux
del /S /Q "%Dir%\.CygwinGCC_x64_Debug_LNKDLL_DLL.so\*.o"
del /S /Q "%Dir%\.CygwinGCC_x64_Debug_LNKLIB_LIB.a\*.o"
del /S /Q "%Dir%\.CygwinGCC_x64_Release_LNKDLL_DLL.so\*.o"
del /S /Q "%Dir%\.CygwinGCC_x64_Release_LNKLIB_LIB.a\*.o"
del /S /Q "%Dir%\.LinuxGCC_x64_Debug_LNKDLL_DLL.so\*.o"
del /S /Q "%Dir%\.LinuxGCC_x64_Debug_LNKLIB_LIB.a\*.o"
del /S /Q "%Dir%\.LinuxGCC_x64_Release_LNKDLL_DLL.so\*.o"
del /S /Q "%Dir%\.LinuxGCC_x64_Release_LNKLIB_LIB.a\*.o"

::清理NDK文件夹
set Dir=%~dp0\%Name%-NDK\obj
rmdir /S /Q "%Dir%\local"

::清理Keil文件夹
set Dir=%~dp0\%Name%-KEIL\%Name%_KeilArmC_Armv7_Release_LNKLIB_LIB\Objects
del /F "%Dir%\*.d" "%Dir%\*.o" "%Dir%\*.Scr" "%Dir%\*.htm" "%Dir%\*.dep" "%Dir%\*.lnp" "%Dir%\*.sct"

set Dir=%~dp0\%Name%-KEIL\%Name%_KeilArmC_Armv8_Release_LNKLIB_LIB\Objects
del /F "%Dir%\*.d" "%Dir%\*.o" "%Dir%\*.Scr" "%Dir%\*.htm" "%Dir%\*.dep" "%Dir%\*.lnp" "%Dir%\*.sct"