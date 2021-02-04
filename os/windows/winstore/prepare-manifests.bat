@echo off
call "%~dp0\set-version.bat"
powershell -File "%~dp0prepare-manifests.ps1" %1 %2 %3 %OTTD_VERSION%
