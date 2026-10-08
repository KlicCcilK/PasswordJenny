@echo off
REM Wrapper to execute PowerShell password generator script

REM Pass all command-line arguments (%*) directly to the PowerShell script
powershell -NoLogo -NoProfile -File "%~dp0PasswordJenny.ps1" %*