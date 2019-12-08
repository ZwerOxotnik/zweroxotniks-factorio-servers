@echo off

tasklist /nh /v | for /f "tokens=2" %%A in ('find "Server_check_Factorio"') do set "isRun=%%A"
if NOT EXIST isRun (
	exit
)

title Server_check_Factorio
echo Checking...
timeout /t 10
cd /D "D:\Program Files\Factorio_0_17\bin\x64"
:loop
ping -n 1 8.8.8.8 | findstr TTL | timeout /t 60 && goto :loop
REM ping 8.8.8.8 | find "Reply"
REM if errorlevel 1 timeout /t 60 && goto :loop
set "isRun="
tasklist /nh /v | for /f "tokens=2" %%A in ('find "last_server_1"') do set "isRun=%%A"
if EXIST isRun (
	echo Result: last_server_1 not founded
) ELSE (
    tasklist /nh /v | for /f "tokens=2" %%A in ('find "last_server_1"') do taskkill /pid %%A && echo "last_server_1 founded" && START /wait start-server-load-latest1.bat
)

set "isRun="
tasklist /nh /v | for /f "tokens=2" %%A in ('find "last_server_2"') do set "isRun=%%A"
if EXIST isRun (
	echo Result: last_server_2 not founded
) ELSE (
    tasklist /nh /v | for /f "tokens=2" %%A in ('find "last_server_2"') do taskkill /pid %%A && echo "last_server_2 founded" && START /wait start-server-load-latest2.bat
)

set "isRun="
tasklist /nh /v | for /f "tokens=2" %%A in ('find "last_server_"3') do set "isRun=%%A"
if EXIST isRun (
	echo Result: last_server_3 not founded
) ELSE (
    tasklist /nh /v | for /f "tokens=2" %%A in ('find "last_server_3"') do taskkill /pid %%A && echo "last_server_3 founded" && START /wait start-server-load-latest3.bat
)
timeout /t 17
ping -n 1 8.8.8.8 | findstr TTL | timeout /t 60 && goto :loop
exit