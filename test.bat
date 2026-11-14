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
start /min "Host" "%GAME_PATH%\Lethal Company.exe" -screen-height 600 -screen-width 800 -screen-fullscreen 0