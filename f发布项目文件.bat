set Name=MutexLock

::��Ҫ�����м��ļ����������������ΪҪ���±��롣

::����ͷ�ļ�
set SrcDir=%~dp0\Source\%Name%\MutexLock.h
set DestDir=%~dp0\%Name%\MutexLock.h
mklink /H %DestDir% %SrcDir%

::����NDK�Ŀ��ļ�
mklink /J %~dp0\%Name%\NDK-libs %~dp0\%Name%-NDK\libs

::����KEIL�Ŀ��ļ�
mkdir %~dp0\%Name%\KEIL-libs
mklink /J %~dp0\%Name%\KEIL-libs\Armv7 %~dp0\%Name%-KEIL\%Name%_KeilArmC_Armv7_Release_LNKLIB_LIB\Objects
mklink /J %~dp0\%Name%\KEIL-libs\Armv8 %~dp0\%Name%-KEIL\%Name%_KeilArmC_Armv8_Release_LNKLIB_LIB\Objects

::���ӿ��ļ���������Ŀ
::set SrcDir=%~dp0\%Name%\NDK-libs\*
::set DestDir=%~dp0\..\AndrdAdoVdoSftkDemo\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%

::set SrcDir=%~dp0\%Name%\NDK-libs\*
::set DestDir=%~dp0\..\AndrdAdoVdoTkbkDemo\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%