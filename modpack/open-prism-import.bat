@echo off
setlocal
set "ROOT=%~dp0.."
set "PRISM=%ROOT%\tools\prism\prismlauncher.exe"
set "PACK=%~dp0Ages Of Siege-0.1.0.mrpack"

if not exist "%PRISM%" (
  echo Prism Launcher helper was not found:
  echo %PRISM%
  exit /b 1
)

if not exist "%PACK%" (
  echo Modpack file was not found:
  echo %PACK%
  exit /b 1
)

start "" "%PRISM%" "%PACK%"
