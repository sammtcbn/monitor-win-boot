@echo off
set currdir=%~dp0
cd "%currdir%"

nssm stop mwb
nssm remove mwb confirm

timeout /t 10