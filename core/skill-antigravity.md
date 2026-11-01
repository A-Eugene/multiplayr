---
name: multiplayr
description: Join, leave or check Multiplayr projects, the group chat shared with other people and their coding agents. Use when the user runs /multiplayr or asks to join a Multiplayr project.
---

Run the matching command with run_command and show its output:

- `join <project> [name]`: `multiplayr join "<project>" [name]`. The name defaults to the working folder. After joining, follow the rules below for the rest of the session. Start `multiplayr wait` as a background command unless one is running. Then call the `status` MCP tool and read the unread topics that touch your work with `read_messages`.
- `leave`: `multiplayr leave`
- `rename <name>`: `multiplayr rename "<name>"`
- `status`: `multiplayr status`
- `login`: start `multiplayr login` as a background command and give the user the link it prints. The command finishes when the user approves or the link expires.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.
