@echo off
:: Install Notepad2-mod to System32 as n2.exe
:: Requires Administrator privileges

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script must be run as Administrator.
    echo Right-click and select "Run as administrator".
    pause
    exit /b 1
)

set "SRC=bin\VS2017\Release_x64\Notepad2.exe"
set "DST=%SystemRoot%\System32\n2.exe"

if not exist "%SRC%" (
    echo ERROR: Release build not found at %SRC%
    echo Run the build first: MSBuild build/Notepad2.sln -p:Configuration=Release -p:Platform=x64 -m
    pause
    exit /b 1
)

copy /Y "%SRC%" "%DST%"
if %errorlevel% equ 0 (
    echo Installed to %DST%
) else (
    echo ERROR: Failed to copy to %DST%
    pause
    exit /b 1
)
