@echo off
setlocal

if "%~1"=="" (
    echo Usage: %0 ^<Drive letter to main disk^>
    exit /b 1
)

set "ApplyDir=%~1"

reg load HKLM\SOFT %ApplyDir%:\Windows\System32\config\SOFTWARE
reg load HKLM\SYS %ApplyDir%:\Windows\System32\config\SYSTEM
reg add HKLM\SOFT\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f
reg add HKLM\SOFT\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f
reg add HKLM\SYS\Setup /v CmdLine /t REG_SZ /d cmd.exe /f