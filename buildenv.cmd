@echo off
REM Configures the environment variables required to publish neonKUBE node images.
REM 
REM 	buildenv [ <source folder> ]
REM
REM Note that <source folder> defaults to the folder holding this
REM batch file.
REM
REM This must be [RUN AS ADMINISTRATOR].

echo ============================================
echo * neonKUBE-images Environment Configurator *
echo ============================================

REM Default NI_ROOT to the folder holding this batch file after stripping
REM off the trailing backslash.

set NI_ROOT=%~dp0 
set NI_ROOT=%NI_ROOT:~0,-2%

if not [%1]==[] set NI_ROOT=%1

if exist %NI_ROOT%\buildenv.cmd goto goodPath
echo The [%NI_ROOT%\buildenv.cmd] file does not exist.  Please pass the path
echo to the neonKUBE-images solution folder.
goto done

:goodPath 

echo.
echo Configuring...
echo.

setx NI_ROOT "%NI_ROOT%" /M > nul

:done
echo.
echo ============================================================================================
echo * Be sure to close and reopen Visual Studio and any command windows to pick up the changes *
echo ============================================================================================
pause
