@echo off
:: This is the path in my local machine with Windows 11 with Visual Studio Build Tools 2022
:: call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\VCVARSALL.BAT" amd64  -vcvars_ver=14.44.35207 > NUL 

:: This is the path in the CI
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\VCVARSALL.BAT" amd64  -vcvars_ver=14.44.35207 > NUL 
echo PATH=%PATH%,INCLUDE=%INCLUDE%,LIB=%LIB%,WINDOWSSDKDIR=%WINDOWSSDKDIR% 
