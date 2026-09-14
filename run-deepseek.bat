@echo off
setlocal EnableExtensions

cd /d "%~dp0"

echo Starting DeepSeek Harness setup...
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
) > "%~dp0deepseek-log.txt" 2>&1

echo.
echo The command has finished.
echo Log saved to:
echo %~dp0deepseek-log.txt
echo.
echo Press any key to close.
pause