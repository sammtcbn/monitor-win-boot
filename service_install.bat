@echo off
set currdir=%~dp0
cd "%currdir%"

IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
nssm install mwb "service.bat"
nssm set mwb AppDirectory "%currdir%"
nssm set mwb AppExit Default Exit
nssm set mwb AppExit 0 Exit
nssm start mwb

timeout /t 10
