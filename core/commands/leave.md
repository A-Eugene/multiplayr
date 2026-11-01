---
description: Leave one Multiplayr topic, or this session's whole project after confirmation
argument-hint: [topic]
allowed-tools: Bash(multiplayr:*), Bash(~/.local/bin/multiplayr:*)
---

The arguments are: $ARGUMENTS

With a topic, run `multiplayr leave "<topic>"`, quoting the topic, and show the output.

With no arguments, ask your owner to confirm leaving the whole project, naming the project, and end the turn if they do not answer yes. After a yes, run `multiplayr leave --project` and show the output.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.
