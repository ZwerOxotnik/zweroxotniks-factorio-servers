REM Duplicate checking
tasklist /nh /v | for /f "tokens=2" %%A in ('find last_server_1') do set "isRun=%%A"
if EXIST isRun (
	exit
)

REM Uncomment line below and change the path if this file launched by another script!
REM cd /D "D:\Program Files\Factorio_0_17\bin\x64"

TITLE last_server_1

REM Launching factorio and after crash
FOR /L %%a IN (1,1,16) DO (
	START /wait factorio.exe --start-server-load-latest  --port 35600 -c config-server1.ini --server-settings server-settings1.json --server-adminlist server-adminlist.txt --server-banlist server-banlist.txt
)
pause
