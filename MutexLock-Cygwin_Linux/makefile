#解决方案名称
SltnName = MutexLock
SltnUpperName = MUTEXLOCK

#多线程编译
MtThrdCmpil = -j$(shell grep -c processor /proc/cpuinfo)

#编译命令
CCmpil = gcc
CppCmpil = g++
AsmCmpil = as
LibCmpil = ar
DllCmpil = g++
ExeCmpil = g++

#源文件
CommonProjFileList = 

#构建选项
CommonCFlag = -fPIC -pipe -fvisibility=hidden -fomit-frame-pointer -frename-registers -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -finput-charset=UTF-8 -fexec-charset=UTF-8 -D__STDINT_LIMITS -DHAVE_INTTYPES_H -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -D__LARGE64_FILES -D_LARGEFILE64_SOURCE -D_GNU_SOURCE
CommonCppFlag = $(CommonCFlag) -std=gnu++11
CommonAsmFlag = 
CygwinCFlag = $(CommonCFlag) -D__CYGWIN__ -DUNICODE
CygwinCppFlag = $(CommonCppFlag) -D__CYGWIN__ -DUNICODE
CygwinAsmFlag = $(CommonAsmFlag)
LinuxCFlag = $(CommonCFlag)
LinuxCppFlag = $(CommonCppFlag)
LinuxAsmFlag = $(CommonAsmFlag)
CFlag = 
CppFlag = 
AsmFlag = 

#目标平台
x86 = -m32
x64 = -m64

#优化选项
Debug = -g2
Release = -O3

#链接选项
CommonLNK = -Wl,-O1 -Wl,-gc-sections -Wl,-hash-style=gnu -Wl,-as-needed -pthread -lm -ldl
CommonLNKLIB = $(CommonLNK) -static -L../../../Func/Func -l:Func_$(ProjNameLibSufx)
CommonLNKDLL = $(CommonLNK) -L../../../Func/Func -l:Func_$(ProjNameLibSufx)
CygwinLNKLIB = $(CommonLNKLIB) -l:libgdi32.a -l:libwinmm.a -l:libole32.a
CygwinLNKDLL = $(CommonLNKDLL) -l:libgdi32.a -l:libwinmm.a -l:libole32.a
LinuxLNKLIB = $(CommonLNKLIB)
LinuxLNKDLL = $(CommonLNKDLL)
LNKLIB = 
LNKDLL = 

#生成选项
CommonCOMLIB = -rsv
CommonCOMDLL = -shared
CommonCOMEXE = 
CygwinCOMLIB = $(CommonCOMLIB)
CygwinCOMDLL = $(CommonCOMDLL)
CygwinCOMEXE = $(CommonCOMEXE)
LinuxCOMLIB = $(CommonCOMLIB)
LinuxCOMDLL = $(CommonCOMDLL)
LinuxCOMEXE = $(CommonCOMEXE)
COMLIB = 
COMDLL = 
COMEXE = 

#头文件
Include = -I/usr/include/w32api -I../../Source/$(SltnName) -I../../../Func/Func

#构建项目
CygwinGCC: CygwinGCC_x86 CygwinGCC_x64

CygwinGCC_x86: CygwinGCC_x86_Debug_LNKLIB_LIB.a CygwinGCC_x86_Release_LNKLIB_LIB.a CygwinGCC_x86_Debug_LNKDLL_DLL.so CygwinGCC_x86_Release_LNKDLL_DLL.so

CygwinGCC_x64: CygwinGCC_x64_Debug_LNKLIB_LIB.a CygwinGCC_x64_Release_LNKLIB_LIB.a CygwinGCC_x64_Debug_LNKDLL_DLL.so CygwinGCC_x64_Release_LNKDLL_DLL.so

LinuxGCC: LinuxGCC_x86 LinuxGCC_x64

LinuxGCC_x86: LinuxGCC_x86_Debug_LNKLIB_LIB.a LinuxGCC_x86_Release_LNKLIB_LIB.a LinuxGCC_x86_Debug_LNKDLL_DLL.so LinuxGCC_x86_Release_LNKDLL_DLL.so

LinuxGCC_x64: LinuxGCC_x64_Debug_LNKLIB_LIB.a LinuxGCC_x64_Release_LNKLIB_LIB.a LinuxGCC_x64_Debug_LNKDLL_DLL.so LinuxGCC_x64_Release_LNKDLL_DLL.so

MakeFileRule:
	if [ ! -d ".$@" ]; then mkdir .$@; fi
	cd .$@ && \
	SrcFileList=`find ../../Source/$(SltnName) -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.cxx"` && \
	ObjFileList=$${SrcFileList//..\/..\/Source\/$(SltnName)\//} && \
	ObjFileList=$${ObjFileList//.cpp/.o} && \
	ObjFileList=$${ObjFileList//.cc/.o} && \
	ObjFileList=$${ObjFileList//.c/.o} && \
	echo $$ObjFileList && \
	$(CCmpil) $(CygwinCFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -D__COMEXE__ -MM $$SrcFileList

MutexLock_CygwinGCC_x64.o: ../../Source/MutexLock/MutexLock_CygwinGCC_x64.asm
	$(eval Cmpil := $(shell if [ "$(suffix $<)" == ".c" ]; then echo "$(C) -o $@ $<"; elif [ "$(suffix $<)" == ".cc" ] || [ "$(suffix $<)" == ".cpp" ] || [ "$(suffix $<)" == ".cxx" ]; then echo "$(CPP) -o $@ $<"; else echo "$(ASM) -o $@ $<"; fi ))
	$(Cmpil)

MutexLock_LinuxGCC_x64.o: ../../Source/MutexLock/MutexLock_LinuxGCC_x64.asm
	$(eval Cmpil := $(shell if [ "$(suffix $<)" == ".c" ]; then echo "$(C) -o $@ $<"; elif [ "$(suffix $<)" == ".cc" ] || [ "$(suffix $<)" == ".cpp" ] || [ "$(suffix $<)" == ".cxx" ]; then echo "$(CPP) -o $@ $<"; else echo "$(ASM) -o $@ $<"; fi ))
	$(Cmpil)

CygwinGCC_x86_Debug_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := CygwinGCC_x86_Debug_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := CygwinGCC_x86_Debug_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x86_Release_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := CygwinGCC_x86_Release_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := CygwinGCC_x86_Release_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x86_Debug_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := CygwinGCC_x86_Debug_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := CygwinGCC_x86_Debug_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x86_Release_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := CygwinGCC_x86_Release_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := CygwinGCC_x86_Release_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X86__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x64_Debug_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Debug_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Debug_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_CygwinGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x64_Release_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Release_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Release_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_CygwinGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x64_Debug_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Debug_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Debug_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_CygwinGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x64_Release_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Release_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Release_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_CygwinGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x86_Debug_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := LinuxGCC_x86_Debug_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := LinuxGCC_x86_Debug_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x86_Release_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := LinuxGCC_x86_Release_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := LinuxGCC_x86_Release_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x86_Debug_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := LinuxGCC_x86_Debug_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := LinuxGCC_x86_Debug_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x86) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x86_Release_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := LinuxGCC_x86_Release_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := LinuxGCC_x86_Release_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x86) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X86__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Debug_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Debug_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Debug_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_LinuxGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Release_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Release_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Release_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_LinuxGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Debug_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Debug_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Debug_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(Debug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_LinuxGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Release_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Release_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Release_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(Release) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__ -c" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CommonProjFileList) MutexLock_LinuxGCC_x64.o" \
	$(SltnName)_$(ProjNameLibSufx)

$(ProjNameLNKLIBCOMLIB): $(ProjFileList)
	$(LibCmpil) -o $(ProjNameLNKLIBCOMLIB) $^ $(COMLIB)
	mv $(ProjNameLNKLIBCOMLIB) ../../$(SltnName)/$(ProjNameLNKLIBCOMLIB)

$(ProjNameLNKDLLCOMDLL): $(ProjFileList)
	$(DllCmpil) -o $(ProjNameLNKDLLCOMDLL) $^ $(LNKDLL) $(COMDLL)
	mv $(ProjNameLNKDLLCOMDLL) ../../$(SltnName)/$(ProjNameLNKDLLCOMDLL)

$(ProjNameLNKLIBCOMEXE): $(ProjFileList)
	$(ExeCmpil) -o $(ProjNameLNKLIBCOMEXE) $^ $(LNKLIB) $(COMEXE)
	mv $(ProjNameLNKLIBCOMEXE) ../../$(SltnName)/$(ProjNameLNKLIBCOMEXE)

$(ProjNameLNKDLLCOMEXE): $(ProjFileList)
	$(ExeCmpil) -o $(ProjNameLNKDLLCOMEXE) $^ $(LNKDLL) $(COMEXE)
	mv $(ProjNameLNKDLLCOMEXE) ../../$(SltnName)/$(ProjNameLNKDLLCOMEXE)

#不要将mv命令改为cp命令，因为这样每次编译都可以重新生成文件，防止依赖的静态库已经更新但不重新生成文件，防止静态库的有些目标文件已经删除但静态库里却没删除。

clean:
	rm -f *.o *.lis .*/*.o .*/*.lis .*/*.a .*/*.so */.*.exe