@echo off

set name=DuskTool 1.0.0

title %name%

:genericError
call popup\error.bat DuskTool genericError Cancel.
exit

goto genericError

pause