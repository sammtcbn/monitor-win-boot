@echo off

setlocal enableextensions disabledelayedexpansion

set currdir=%~dp0
cd "%currdir%"

set logfile="%currdir%log.txt"

rem main function

for /f "tokens=1,2 delims==" %%a in (%WINDIR%\Setup\State\State.ini) do (
    if %%a==ImageState set ImageState=%%b
)
echo %date% %time% ImageState = %ImageState% >> %logfile%