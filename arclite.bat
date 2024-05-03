@echo off

:start
goto filename
:run
arclite.exe > .\logs\%FILENAME%.log
goto start


:filename
:: Extract year, month, and day from the system's date
set DATESTRING=%DATE:/=_%

:: Extract hour, minute, and second from the system's time
set HOUR=%TIME:~0,2%
set MINUTE=%TIME:~3,2%
set SECOND=%TIME:~6,2%

set TIMESTRING=%TIME::=-%
set TIMESTRING=%TIMESTRING:.=-%

:: Create a log file with the current timestamp in its name
set FILENAME=arclite_log_%DATESTRING%_%TIMESTRING%
set FILENAME=%FILENAME: =%

goto run

echo WTF? IT SHOULDNT GET THERE
pause