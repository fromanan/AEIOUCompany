@echo off
setlocal
if not "%~1"=="" set "GAME_PATH=%~1"
if not defined GAME_PATH (
    echo Set GAME_PATH or pass the Lethal Company installation directory.
    exit /b 2
)
if not exist "%GAME_PATH%\Lethal Company.exe" (
    echo GAME_PATH must contain Lethal Company.exe.
    exit /b 2
)
cd /d "%~dp0"
mkdir "%GAME_PATH%\BepInEx\plugins\aeioucompany"
set "TEST_DIR=%GAME_PATH%\BepInEx\plugins\aeioucompany"
set "RELEASE_DIR=release\aeioucompany"

cd ./SpeakServer
echo Building Speak Server...
start /b /wait "" build || (
    echo Building speak server failed
    exit
)
echo Speak Server Build Successful, Building Plugin...
cd ../Plugin
start /b /wait "" build || (
    echo Building Plugin Failed
    exit
)
cd ..
xcopy /y "%RELEASE_DIR%" "%TEST_DIR%"