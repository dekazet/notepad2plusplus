@ECHO OFF
SETLOCAL

PUSHD %~dp0

IF EXIST "build.user.bat" (CALL "build.user.bat")

SET "BASH_EXE="
IF DEFINED MSYS IF EXIST "%MSYS%\bin\bash.exe" SET "BASH_EXE=%MSYS%\bin\bash.exe"
IF NOT DEFINED BASH_EXE IF EXIST "%ProgramFiles%\Git\usr\bin\bash.exe"      SET "BASH_EXE=%ProgramFiles%\Git\usr\bin\bash.exe"
IF NOT DEFINED BASH_EXE IF EXIST "%ProgramFiles(x86)%\Git\usr\bin\bash.exe" SET "BASH_EXE=%ProgramFiles(x86)%\Git\usr\bin\bash.exe"
IF NOT DEFINED BASH_EXE IF EXIST "%LocalAppData%\Programs\Git\usr\bin\bash.exe" SET "BASH_EXE=%LocalAppData%\Programs\Git\usr\bin\bash.exe"

IF NOT DEFINED BASH_EXE GOTO NoBash

"%BASH_EXE%" ./version.sh

:END
POPD
ENDLOCAL
EXIT /B


:NoBash
ECHO update_rev.bat: no MSYS/Git bash.exe found, skipping revision stamp.
IF NOT EXIST "src\VersionRev.h" (
  ECHO #define VERSION_HASH    _T("0000000")> "src\VersionRev.h"
  ECHO #define VERSION_REV     0>> "src\VersionRev.h"
  ECHO #define VERSION_REV_FULL _T("0 (0000000)")>> "src\VersionRev.h"
)
POPD
ENDLOCAL
EXIT /B
