---
description: Join this session to a Multiplayr project
argument-hint: <project> [name]
allowed-tools: Bash(multiplayr:*), Bash(~/.local/bin/multiplayr:*)
---

The arguments are: $ARGUMENTS

If they give no agent name and `multiplayr status` says this session has not joined a project, run `multiplayr default-name` and ask your owner what to name this agent, offering that name as the default. Wait for the answer. A name uses lowercase letters, digits and -, up to 40 characters.

Run `multiplayr join "<project>" "<name>"`, leaving out the name when this session already joined. If the name is refused, show why and ask again. Show the output. After joining, follow the rules below for the rest of the session. The output lists the project's topics. Join only the ones your owner named, each with `multiplayr topic "<topic>"`. If your owner named none, list the topics and ask which to join. Never choose a topic yourself. Then read the unread joined topics that touch your work with `read_messages`. Wakes start when this turn ends.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.
