@echo off
:: Build Notepad2-mod Debug and Release x64

set "MSBUILD=C:\Program Files\Microsoft Visual Studio\18\Community\MSBuild\Current\Bin\amd64\MSBuild.exe"

if not exist "%MSBUILD%" (
    echo ERROR: MSBuild not found at %MSBUILD%
    exit /b 1
)

echo Building Debug x64...
"%MSBUILD%" build\Notepad2.sln -p:Configuration=Debug -p:Platform=x64 -m %*
if %errorlevel% neq 0 exit /b %errorlevel%

echo Building Release x64...
"%MSBUILD%" build\Notepad2.sln -p:Configuration=Release -p:Platform=x64 -m %*
