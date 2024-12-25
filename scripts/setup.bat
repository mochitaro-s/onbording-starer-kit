@echo off
REM Python, Git, and VS Code setup script for Windows

REM Step 1: Install Visual Studio Code
echo Downloading Visual Studio Code...
curl -LO https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user
echo Installing Visual Studio Code...
start /wait VSCodeSetup.exe /silent /mergetasks="addtopath"

REM Step 2: Install Git
echo Downloading Git...
curl -LO https://github.com/git-for-windows/git/releases/latest/download/Git-2.42.0-64-bit.exe
echo Installing Git...
start /wait Git-2.42.0-64-bit.exe /VERYSILENT /NORESTART /NOCANCEL

REM Step 3: Install Python
echo Downloading Python...
curl -LO https://www.python.org/ftp/python/3.10.8/python-3.10.8-amd64.exe
echo Installing Python...
start /wait python-3.10.8-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

REM Verify installations
echo Verifying installations...
git --version
python --version
pip --version

REM Cleanup
del VSCodeSetup.exe
del Git-2.42.0-64-bit.exe
del python-3.10.8-amd64.exe

echo Setup complete!
pause
