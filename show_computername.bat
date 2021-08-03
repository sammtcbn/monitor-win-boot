@echo off

set currdir=%~dp0
cd "%currdir%"

set logfile="%currdir%log.txt"

rem main function

echo %date% %time% computername = %computername% >> %logfile%