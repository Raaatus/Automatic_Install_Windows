@echo off
setlocal

if "%~3"=="" (
    echo Usage: %0 ^<Location to install.wim^> ^<SKU Number^> ^<Drive letter to main disk^>
    exit /b 1
)

set "ImageFile=%~1"
set "Index=%~2"
set "ApplyDir=%~3"

dism /apply-image /imagefile:%ImageFile% /index:%Index% /applydir:%ApplyDir%:\

bootsect /nt60 %ApplyDir%: /force /mbr

bcdboot %ApplyDir%:\Windows
