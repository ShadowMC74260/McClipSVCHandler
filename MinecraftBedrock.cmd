@echo off
:CHOICE
cls
title Minecraft Bedrock Regedit Handler 
echo Please Make sure the script is running as administrator. 
set "choice="
echo Normal method. 
echo.
echo 1 - Enroll Registry to enable for Minecraft 
echo 2 - Enroll Registry to disable clipsvc for other store apps
echo. 
echo Advanced method. 
echo.
echo 3 - Replace store dlls for MC
echo 4 - Replace store dlls for other UMP apps
echo 5 - Exit
echo.
set /p choice="Choice: "echo.
if /I "%choice%"=="1" goto :MINECRAFT_ON
if /I "%choice%"=="2" goto :MINECRAFT_OFF
if /I "%choice%"=="3" goto :DLL_ON
if /I "%choice%"=="4" goto :DLL_OFF
if /I "%choice%"=="5" goto :END

:MINECRAFT_ON

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /f /t REG_EXPAND_SZ /v ServiceDll /d %SystemRoot%\System32\ClipSVC.dlla

pause
goto :CHOICE

:MINECRAFT_OFF

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /f /t REG_EXPAND_SZ /v ServiceDll /d %SystemRoot%\System32\ClipSVC.dll 

pause 
goto :CHOICE

:DLL_ON
echo Comming soon.
pause

:DLL_OFF
echo Comming soon.
pause

:END 
exit
echo reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /f /t REG_DWORD /v DisableSubscription /d 0
echo reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /f /t REG_DWORD /v InactivityShutdownDelay /d 300 
echo reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /f /t REG_DWORD /v RefreshRequired /d 1
echo reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /f /t REG_DWORD /v ServiceDllUnloadOnStop /d 1
echo reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /f /t REG_DWORD /v ProcessBiosKey /d 1 
