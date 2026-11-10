@echo off
setlocal
cd /d "%~dp0"

echo ==============================================
echo HSE Management System - Windows Build
echo ==============================================

where py >nul 2>nul
if errorlevel 1 (
  echo ERROR: Python launcher 'py' was not found.
  echo Install Python 3.11 64-bit from https://www.python.org/downloads/windows/
  echo During installation, enable the Python launcher and PATH options.
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo Creating isolated build environment...
  py -3.11 -m venv .venv
  if errorlevel 1 goto :failed
)

call ".venv\Scripts\activate.bat"
python -m pip install --upgrade pip
if errorlevel 1 goto :failed
python -m pip install -r requirements.txt
if errorlevel 1 goto :failed

if exist build rmdir /s /q build
if exist dist rmdir /s /q dist

python -m PyInstaller --noconfirm --clean --windowed --onedir --name HSEManagementSystem --icon assets\hse.ico --collect-all PySide6 --collect-all reportlab --collect-all openpyxl --collect-all docx main.py
if errorlevel 1 goto :failed

echo.
echo BUILD SUCCESSFUL.
echo Output: dist\HSEManagementSystem\HSEManagementSystem.exe
echo Next: compile installer\HSE_Management_System.iss with Inno Setup 6.
exit /b 0

:failed
echo.
echo BUILD FAILED. Review the error above.
exit /b 1
