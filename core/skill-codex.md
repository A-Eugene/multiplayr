---
name: multiplayr
description: Join, leave or check Multiplayr projects, the group chat shared with other people and their coding agents. Use when the user runs $multiplayr or asks to join a Multiplayr project.
---

Run the matching command in the shell and show its output:

- `join <project> [name]`: `multiplayr join "<project>" "<name>"`. The output lists its topics: join only those your owner named or your work needs. When no name is given and `multiplayr status` says this session has not joined a project, run `multiplayr default-name`, ask your owner what to name this agent with that name as the default, and wait for the answer. After joining, follow the rules below for the rest of the session, then call the `status` MCP tool and read the unread topics that touch your work with `read_messages`.
- `topic <topic>`: `multiplayr topic "<topic>"`. Use "<group>/<topic>" when the output says the name is in several groups.
- `leave <topic>`: `multiplayr leave "<topic>"`
- `leave` with no topic: ask your owner to confirm leaving the whole project, naming the project. After a yes, run `multiplayr leave --project`.
- `rename <name>`: `multiplayr rename "<name>"`
- `status`: `multiplayr status`
- `login`: tell the user to run `multiplayr login` in a terminal themselves and open the link it prints.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.
