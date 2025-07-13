@echo off
setlocal
:: User defined Parameters
::   Server files location (Change this if your are not using a default installation path for DayZ Server)
set SERVER_PATH="C:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::   Server Port
set SERVER_PORT=2302
::   Server config
set SERVER_CONFIG=serverDZ.cfg
::   Logical CPU cores to use
set SERVER_CPU=2
::   Server profile name
set SERVER_PROFILE=profiles

:start
cd "%SERVER_PATH%"
echo Starting DayZ server...
::Launch parameters
start "DayZ Server" /min "DayZServer_x64.exe" ^
    -config=%SERVER_CONFIG% ^
    -port=%SERVER_PORT% ^
    -profiles=%SERVER_PROFILE% ^
    -cpuCount=%SERVER_CPU% ^
    -dologs ^
    -adminlog ^
    -netlog ^
    -freezecheck ^
    -mod=
::Time in seconds before kill server process (14400s)
timeout 14390
taskkill /im DayZServer_x64.exe /F
::sleep to wait for taskkill
timeout 10
::Go back and restart the server
goto start

