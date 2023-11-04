@echo off
setlocal

if "%~6"=="" (
    echo Usage: %0 ^<Letter Main Disk^> <Recovery Partition:False^(default^)^> ^<Administrator Name^> ^<Password Administrator^> ^<Local Groups Admin:administrators^(default^)^> ^<Local Groups Users:users^(default^)^>
    exit /b 1
)

set "Letter=%~1"
set "Recovery=%~2"
set "AdminName=%~3"
set "AdminPass=%~4"
set "GroupAdmin=%~5"
set "GroupUser=%~6"


start /wait %Letter%:\Windows\System32\oobe\windeploy

if "%Recovery%"=="True" (
    Reagentc /enable
)

Reagentc /Info /Target %Letter%:\Windows

net user /add %AdminName% %AdminPass%
net localgroup %GroupUser% /add %AdminName%
net localgroup %GroupAdmin% /add %AdminName%

reg add HKLM\SYSTEM\Setup /v OOBEInProgress /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\Setup /v SetupType /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f

exit