@echo off

set name=DuskTool 1.0.0

title %name%

goto tool

:TempClean
cd "C:\Windows\Temp\"
del "*"
cd "%UserProfile%\AppData\Local\Temp\"
del "*"
pause
goto tool

:pinger
set /p choice="ping what? "
ping %choice%
pause
goto tool

:sysinfo
systeminfo
pause
goto tool

:ipstuff
ipconfig /all
pause
goto tool

:tool
cls
echo 1 - Clean temp files.
echo 2 - Ping an address.
echo 3 - System info.
echo 4 - Run the 'ipconfig' command.
echo 5 - Exit.

set /p choice=choice: 

if "%choice%"=="1" (
    call :TempClean
) else if "%choice%"=="2" (
    call :pinger
) else if "%choice%" == "3" (
    call :sysinfo
) else if "%choice%" == "4" (
    call :ipstuff
) else if "%choice%"=="5" (
    echo Exiting.
    pause
    exit
)

goto tool