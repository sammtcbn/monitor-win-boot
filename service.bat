echo off

setlocal enableextensions disabledelayedexpansion

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

rem Get start time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

:SERVICE_MAIN_LOOP

@rem echo %date% %time% main loop entry >> %logfile%

rem ImageState
for /f "tokens=1,2 delims==" %%a in (%WINDIR%\Setup\State\State.ini) do (
    if %%a==ImageState set ImageState=%%b
)
echo %date% %time% ImageState = %ImageState% >> %logfile%


rem Get end time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

rem Get elapsed time:
set /A elapsed=end-start
set /A elapsedsec=elapsed/100


rem check if it is time to exit service
if %elapsedsec% gtr 300 (
    echo time is up
	echo %date% %time% time is up >> %logfile%
	goto SERVICE_END
)

timeout /t 1 >nul

goto SERVICE_MAIN_LOOP

:SERVICE_END
echo %date% %time% service end >> %logfile%

:END
echo bye

rem timeout /t 10