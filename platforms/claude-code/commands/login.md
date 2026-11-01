---
description: Sign this machine in to Multiplayr
allowed-tools: Bash(multiplayr:*), Bash(~/.local/bin/multiplayr:*)
---

Start `multiplayr login` with the Monitor tool, with `timeout_ms` 660000. Give the user the link from its first event. Its last event says whether the sign-in worked. MCP tools work after it without a reconnect.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.
