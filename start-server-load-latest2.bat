REM Duplicate checking
REM tasklist /nh /v | for /f "tokens=2" %%A in ('find "last_server_2"') do set "isRun=%%A"
REM if EXIST isRun (
REM 	exit
REM )

REM Uncomment line below and change the path if this file launched by another script!
REM cd /D "D:\Program Files\Factorio_0_17\bin\x64"
TITLE last_server_2

REM Launching factorio and after crash
FOR /L %%a IN (1,1,16) DO (
	START /wait factorio.exe --start-server-load-latest --port 35601 -c config-server2.ini --server-settings server-settings2.json
)
pause
