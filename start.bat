@echo off
:start
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


cd "%SERVER_PATH%"
echo Starting DayZ server...
::Launch parameters
start /wait "DayZ Server" "DayZServer_x64.exe" ^
    -config=%SERVER_CONFIG% ^
    -port=%SERVER_PORT% ^
    -profiles=%SERVER_PROFILE% ^
    -cpuCount=%SERVER_CPU% ^
    "-mod=@mod1;@mod2" ^
    -dologs ^
    -adminlog ^
    -netlog ^
    -freezecheck 
    

echo [WARN] Server exited or crashed. Restarting in 5 seconds...    
::Time in seconds before kill server process (5s)
timeout 5
::Go back and restart the server
goto start