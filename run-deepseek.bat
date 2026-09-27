@echo off
setlocal EnableExtensions EnableDelayedExpansion

cd /d "%~dp0"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set "DSH_PORT=3080"
set "FINAL_LOG=%~dp0deepseek-log.txt"
set "TEMP_LOG=%TEMP%\deepseek-log-%RANDOM%.txt"

echo ===== DeepSeek Harness Runner =====
echo.

echo [1/3] Checking for existing DSH instance on port %DSH_PORT%...

set "PIDS="
for /f "tokens=5" %%P in ('netstat -aon ^| findstr ":%DSH_PORT%" ^| findstr "LISTENING"') do (
    echo !PIDS! | findstr /C:"%%P" >nul
    if errorlevel 1 set "PIDS=!PIDS! %%P"
)

if "!PIDS!"=="" (
    echo   No existing instance found on port %DSH_PORT%.
) else (
    for %%Q in (!PIDS!) do (
        echo   Killing PID %%Q ...
        taskkill /F /T /PID %%Q >nul 2>&1
        if !errorlevel! equ 0 (
            echo   Killed PID %%Q successfully.
        ) else (
            echo   PID %%Q already gone or inaccessible.
        )
    )
)

echo.
echo [2/3] Waiting for port to fully release...

set "TRIES=0"
:waitloop
set /a TRIES+=1
netstat -aon | findstr ":%DSH_PORT%" | findstr "LISTENING" >nul
if not errorlevel 1 (
    if !TRIES! lss 10 (
        timeout /t 1 /nobreak >nul
        goto waitloop
    ) else (
        echo   WARNING: Port %DSH_PORT% still occupied after 10s - proceeding anyway.
    )
) else (
    echo   Port %DSH_PORT% is free.
)

echo.
echo [3/3] Starting fresh DeepSeek Harness...
echo   (logging to temp location to avoid OneDrive file locks)
echo.

(
    echo ===== DeepSeek Harness Log =====
    echo Date: %date% %time%
    echo.

    echo [Node version]
    node --version

    echo.
    echo [npm version]
    npm --version

    echo.
    echo [DSH version]
    call npx --yes @deepseek-ai/dsh@latest --version

    echo.
    echo [Starting Web UI]
    call npx --yes @deepseek-ai/dsh@latest web
) > "%TEMP_LOG%" 2>&1

REM Copy the completed log to the Desktop now that DSH has stopped writing to it
copy /y "%TEMP_LOG%" "%FINAL_LOG%" >nul 2>&1
del "%TEMP_LOG%" >nul 2>&1

echo.
echo The command has finished.
echo Log saved to:
echo %FINAL_LOG%
echo.
echo Press any key to close.
pause
