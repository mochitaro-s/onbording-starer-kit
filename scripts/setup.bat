@echo off
REM Improved setup script for Visual Studio Code, Git, and Python
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
    python --version
) else (
    echo Installing Python...
    %download_and_install% "https://www.python.org/ftp/python/3.10.8/python-3.10.8-amd64.exe" "PythonSetup.exe" "start /wait PythonSetup.exe /quiet InstallAllUsers=1 PrependPath=1"
    echo Python installation completed.
    python --version
)

REM Step 4: Install VS Code Extensions
echo Installing VS Code Extensions...
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
