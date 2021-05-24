@echo off
REM Signing script
REM Arguments: sign.bat exe_to_sign certificate_subject_name

IF NOT DEFINED SIGNTOOL_PATH (SET SIGNTOOL_PATH=signtool)
IF NOT DEFINED SIGNTOOL_TIMESTAMP_URL (SET SIGNTOOL_TIMESTAMP_URL=http://timestamp.digicert.com)

REM Sign with SHA-1 for Windows 7 and below
"%SIGNTOOL_PATH%" sign -v -n %2 -t %SIGNTOOL_TIMESTAMP_URL% %1

REM Sign with SHA-256 for Windows 8 and above
"%SIGNTOOL_PATH%" sign -v -n %2 -tr %SIGNTOOL_TIMESTAMP_URL% -fd sha256 -td sha256 -as %1
