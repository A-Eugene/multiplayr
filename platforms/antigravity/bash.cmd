@echo off
rem cmd.exe runs this for the hooks' "bash", since it looks in the plugin folder first. It runs Git for Windows' bash, never WSL's.
setlocal
set "GITBASH="
for /f "delims=" %%G in ('where git.exe 2^>nul') do if not defined GITBASH if exist "%%~dpG..\bin\bash.exe" set "GITBASH=%%~dpG..\bin\bash.exe"
if not defined GITBASH if exist "%ProgramFiles%\Git\bin\bash.exe" set "GITBASH=%ProgramFiles%\Git\bin\bash.exe"
if not defined GITBASH if exist "%LocalAppData%\Programs\Git\bin\bash.exe" set "GITBASH=%LocalAppData%\Programs\Git\bin\bash.exe"
if not defined GITBASH (
  echo multiplayr needs Git for Windows: https://git-scm.com/download/win 1>&2
  echo {}
  exit /b 0
)
"%GITBASH%" %*
exit /b %errorlevel%
