@echo off
REM Improved setup script for Visual Studio Code, Git, Python, and Task CLI
REM This script checks for existing installations before proceeding.

setlocal ENABLEDELAYEDEXPANSION

echo === Setup Script Start ===

REM Helper function to download and install software
set "download_and_install=call :download_install"

REM Step 1: Check and Install Visual Studio Code
echo Checking for Visual Studio Code...
where code >nul 2>nul
if not errorlevel 1 (
    echo Visual Studio Code is already installed.
) else (
    echo Installing Visual Studio Code...
    %download_and_install% "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" "VSCodeSetup.exe" "start /wait VSCodeSetup.exe /silent /mergetasks=\"addtopath\""
    echo Visual Studio Code installation completed.
)

REM Step 2: Check and Install Git
echo Checking for Git...
where git >nul 2>nul
if not errorlevel 1 (
    echo Git is already installed.
) else (
    echo Installing Git...
    %download_and_install% "https://github.com/git-for-windows/git/releases/latest/download/Git-2.42.0-64-bit.exe" "GitSetup.exe" "start /wait GitSetup.exe /VERYSILENT /NORESTART /NOCANCEL"
    echo Git installation completed.
)

REM Step 3: Check and Install Python
echo Checking for Python...
where python >nul 2>nul
if not errorlevel 1 (
    echo Python is already installed.
REM    python --version
) else (
    echo Installing Python...
    %download_and_install% "https://www.python.org/ftp/python/3.10.8/python-3.10.8-amd64.exe" "PythonSetup.exe" "start /wait PythonSetup.exe /quiet InstallAllUsers=1 PrependPath=1"
    echo Python installation completed.
    python --version
)

REM Step 4: Check and Install Task CLI
echo Checking for Task CLI...
where task >nul 2>nul
if not errorlevel 1 (
    echo Task CLI is already installed.
) else (
    echo Installing Task CLI...
    REM ダウンロードと解凍の手順
    curl -LO https://github.com/go-task/task/releases/download/v3.40.1/task_windows_amd64.zip
    if exist task_windows_amd64.zip (
        powershell -Command "Expand-Archive -Path 'task_windows_amd64.zip' -DestinationPath 'task_temp'"
        if exist task_temp\\task.exe (
            move /Y task_temp\\task.exe C:\\Windows\\System32
            echo Task CLI installation completed.
        ) else (
            echo Failed to locate task.exe after extraction.
            exit /b 1
        )
        REM 不要ファイルの削除
        echo Cleaning up temporary files...
        rmdir /s /q task_temp
        del /f /q task_windows_amd64.zip
    ) else (
        echo Failed to download task_windows_amd64.zip.
        exit /b 1
    )
)

REM Step 5: Install VS Code Extensions
echo Installing VS Code Extensions...
set "extensions_file=vscode\extensions.txt"
if not exist %extensions_file% (
    echo Error: Extensions file %extensions_file% not found.
    exit /b 1
)

for /f "tokens=* delims=" %%E in (%extensions_file%) do (
    echo Checking extension: %%E
    code --list-extensions | findstr /i "%%E" >nul
    if not errorlevel 1 (
        echo Extension %%E is already installed. Skipping...
    ) else (
        echo Installing extension: %%E
        code --install-extension %%E
        if errorlevel 1 (
            echo Failed to install extension: %%E
        ) else (
            echo Successfully installed extension: %%E
        )
    )
)

echo VS Code Extensions installation completed.

echo === Setup Script Complete ===
pause
exit /b

REM Function to download and install software
:download_install
set "url=%1"
set "filename=%2"
set "command=%3"

curl -LO !url!
if exist !filename! (
    %command%
    del /f /q !filename!
) else (
    echo Failed to download !filename! from !url!.
    exit /b 1
)
exit /b
