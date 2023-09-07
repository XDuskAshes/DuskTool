@echo off

set name=DuskTool 1.2.1

title %name%

goto tool

:opnosupport
cls
echo error:1
echo OperationNotSupportedError
echo Details: Operation not supported. You either entered something wrong or nothing at all.
pause
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
set /p infinity="loop until manual cancel? [y/N] "
if "%infinity%"=="y" (
    ping %choice% -t
) else if "%infinity%"=="n" (
    ping %choice%
) else (
    ping %choice%
)
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
echo Clean temp files, ping internet addresses, view sysinfo, see port info, trace all the hops between you and an address, find a file/dir
pause
goto tool

:: trace smn
:trace
set /p choice="trace what? "
tracert %choice%
pause
goto tool

:searchfs
set /p lookfor="look for what? "
if exist %lookfor% (
    echo %lookfor% exists.
) else (
    echo %lookfor% does not exist.
)
pause
goto tool


:tool
cls
echo %name%
echo 1 - Clean temp files.
echo 2 - Ping an address.
echo 3 - System info.
echo 4 - Run the 'ipconfig' command.
echo 5 - Trace an address.
echo 6 - Search for a file/dir
echo 7 - Program info.
echo 8 - Exit.
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
    call :trace
) else if "%choice%"=="6" (
    call :searchfs
) else if "%choice%"=="7" (
    call :info
) else if "%choice%"=="8" (
    echo Exiting.
    pause
    exit
) else if "%choice%"=="" (
call :opnosupport
) else (
call :opnosupport
)
goto tool