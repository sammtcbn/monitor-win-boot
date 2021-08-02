echo off
set currdir=%~dp0
cd "%currdir%"

set enableflag="%currdir%enabled.txt"
set logfile="%currdir%log.txt"

rem echo logfile = %logfile%
rem echo enableflag = %enableflag%


:START
echo start
if not exist %enableflag% (
    goto END
)


:SERVICE_START
echo %date% %time% service start >> %logfile%


:SERVICE_MAIN_LOOP

echo %date% %time% main >> %logfile%

ping 127.0.0.1 -n 3 -w 1000 > nul

goto SERVICE_MAIN_LOOP

:SERVICE_END
echo %date% %time% service end >> %logfile%

:END
echo bye

rem timeout /t 10