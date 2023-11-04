@echo off
setlocal

if "%~6"=="" (
    echo Usage: %0 ^<Custom Diskpart:DefaultMbr_Low(default^)^> ^<Location to install.wim^> ^<SKU Number^> ^<Drive letter to main disk^> ^<Format:MBR(default^):UEFI^> ^<Bypass OOBE:False(default^)^>
    exit /b 1
)

set "CustomDiskpart=%~1"
set "ImageFile=%~2"
set "Index=%~3"
set "LetterApplyDir=%~4"
set "Format=%~5"
set "OOBE=%~6"



set "ScriptDirectory=%~dp0\custom\%CustomDiskpart%"

diskpart /s "%ScriptDirectory%"

if "%Format%"=="MBR" (
    InstallWinMbr.bat "%ImageFile%" "%Index%" "%LetterApplyDir%"
) else if "%Format%"=="UEFI" (
    InstallWinUefi.bat "%ImageFile%" "%Index%" "%LetterApplyDir%"
)

if "%OOBE%"=="True" (
    Bypass_OOBE_P1.bat "%LetterApplyDir%"
)

