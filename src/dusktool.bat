@echo off

set name=DuskTool 1.0.1

title %name%

goto tool

:: Temp files cleanup.
:TempClean
cd "C:\Windows\Temp\"
del "*"
cd "%UserProfile%\AppData\Local\Temp\"
del "*"
pause
goto tool

:: Ping a place
:pinger
set /p choice="ping what? "
ping %choice%
pause
goto tool

:: Grab system info.
:: TODO: Make this custom.
:sysinfo
systeminfo
pause
goto tool

:: ipconfig /all lmao
:ipstuff
ipconfig /all
pause
goto tool

:: Program info
:info
echo %name%
echo By Dusk
echo Functionality:
echo Clean temp files, ping internet addresses, view sysinfo, see port info
pause
goto tool

:tool
cls
echo %name%
echo 1 - Clean temp files.
echo 2 - Ping an address.
echo 3 - System info.
echo 4 - Run the 'ipconfig' command.
echo 5 - Program info.
echo 6 - Exit.
set choice="0"
set /p choice=Enter one of the above numbers: 

if "%choice%"=="1" (
    call :TempClean
) else if "%choice%"=="2" (
    call :pinger
) else if "%choice%"=="3" (
    call :sysinfo
) else if "%choice%"=="4" (
    call :ipstuff
) else if "%choice%"=="5" (
    call :info
) else if "%choice%"=="6" (
    echo Exiting.
    pause
    exit
)

goto tool