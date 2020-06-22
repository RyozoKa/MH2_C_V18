# Microsoft Developer Studio Project File - Name="MH2_C_V17 DLL" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=MH2_C_V17 DLL - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "MH2_C_V17 DLL.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "MH2_C_V17 DLL.mak" CFG="MH2_C_V17 DLL - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "MH2_C_V17 DLL - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe
# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "MH2_C_V17DLL_EXPORTS" /YX /FD /c
# ADD CPP /nologo /Zp4 /MT /w /W0 /vd0 /GX /O2 /I "..\..\Core\Inc" /I "..\..\Engine\Inc" /I "..\Inc" /I "..\MySQL\MySQL\include" /I "..\Src" /D "WIN32" /D "WINDOWS" /D "_WINDOWS" /D "UNICODE" /D "_UNICODE" /D MH2_C_V17_API=__declspec(dllexport) /FR /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41d /d "NDEBUG"
# ADD RSC /l 0x41d /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib ..\..\Core\Lib\Core.lib ..\..\Engine\Lib\Engine.lib ..\..\MH2_C_V17\MySQL\MySQL\lib\libmysql.lib /nologo /dll /incremental:yes /machine:I386 /force /out:"..\..\System/MH2_C_V17.dll"
# SUBTRACT LINK32 /pdb:none
# Begin Target

# Name "MH2_C_V17 DLL - Win32 Release"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\ClientMessageLog.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientNativeDownloader.cpp
# End Source File
# Begin Source File

SOURCE=.\MonsterBasePlus.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\Inc\MH2_C_V17Classes.h
# End Source File
# Begin Source File

SOURCE=.\MH2_C_V17Private.h
# End Source File
# Begin Source File

SOURCE=.\MHGlobal.h
# End Source File
# Begin Source File

SOURCE=.\UnLinuxHardware.h
# End Source File
# Begin Source File

SOURCE=.\UnOSDataBase.h
# End Source File
# Begin Source File

SOURCE=.\UnWindowsHardware.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
