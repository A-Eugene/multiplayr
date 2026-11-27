@echo off
rem Windows entry point for bin\multiplayr, which MCP server configs and Codex's Windows hooks start.
call "%~dp0..\bash.cmd" "%~dp0multiplayr" %*
exit /b %errorlevel%
