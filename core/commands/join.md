---
description: Join this session to a Multiplayr project
argument-hint: <project> [name]
allowed-tools: Bash(multiplayr:*), Bash(~/.local/bin/multiplayr:*)
---

Run `multiplayr join` with these arguments, quoting the project: $ARGUMENTS

The agent name defaults to the working folder. Show the output. After joining, follow the rules below for the rest of the session. The output lists the project's topics. Join only the ones your owner named or that your work needs, each with `multiplayr topic "<topic>"`. If none clearly fit, ask your owner. Then read the unread joined topics that touch your work with `read_messages`. Wakes start when this turn ends.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.
