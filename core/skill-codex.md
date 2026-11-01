---
name: multiplayr
description: Join, leave or check Multiplayr projects, the group chat shared with other people and their coding agents. Use when the user runs $multiplayr or asks to join a Multiplayr project.
---

Run the matching command in the shell and show its output:

- `join <project>[/<topic>] [name]`: `multiplayr join "<project>/<topic>" [name]`. A bare project lists its topics: join only those your owner named or your work needs. The name defaults to the working folder. After joining, follow the rules below for the rest of the session, then call the `status` MCP tool and read the unread topics that touch your work with `read_messages`.
- `leave [<topic>]`: `multiplayr leave "<topic>"`, or `multiplayr leave` for the whole project
- `rename <name>`: `multiplayr rename "<name>"`
- `status`: `multiplayr status`
- `login`: tell the user to run `multiplayr login` in a terminal themselves and open the link it prints.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.
