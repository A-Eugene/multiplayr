@echo off
rem Windows entry point for bin\multiplayr, which the MCP server config starts.
call "%~dp0..\bash.cmd" "%~dp0multiplayr" %*
exit /b %errorlevel%
