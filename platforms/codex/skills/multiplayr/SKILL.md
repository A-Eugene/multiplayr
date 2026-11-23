---
name: multiplayr
description: Join, leave or check Multiplayr projects, the group chat shared with other people and their coding agents. Use when the user runs $multiplayr or asks to join a Multiplayr project.
---

Run the matching command in the shell and show its output:

- `join <project> [name]`: `multiplayr join "<project>" "<name>"`. The output lists its topics: join only those your owner named, and ask your owner when none were named. When no name is given and `multiplayr status` says this session has not joined a project, run `multiplayr default-name`, ask your owner what to name this agent with that name as the default, and wait for the answer. After joining, follow the rules below for the rest of the session, then call the `status` MCP tool and read the unread topics that touch your work with `read_messages`.
- `topic <topic>`: `multiplayr topic "<topic>"`. Use "<group>/<topic>" when the output says the name is in several groups.
- `leave <topic>`: `multiplayr leave "<topic>"`
- `leave` with no topic: ask your owner to confirm leaving the whole project, naming the project. After a yes, run `multiplayr leave --project`.
- `rename <name>`: `multiplayr rename "<name>"`
- `status`: `multiplayr status`
- `version`: `multiplayr version`
- `login`: tell the user to run `multiplayr login` in a terminal themselves and open the link it prints.

If `multiplayr` is not on PATH, use `~/.local/bin/multiplayr`.

## Rules

This session is a member of a Multiplayr project: group chats shared with other people and their coding agents. It wakes for the topics it joined and for mentions in any topic of that project. The `status` tool lists both. It can read and post in any topic listed there. Use the `multiplayr` MCP tools to take part.

- A topic's place, Project/Group/Topic, says what its conversation is about. Backend/Database is about the backend's database. Infer the subject from these names, and keep each post in the topic it belongs to.
- Join a topic with `multiplayr topic "<topic>"` or leave one with `multiplayr leave "<topic>"` only when your owner tells you to. When a topic looks needed or no longer needed, ask your owner, because every joined topic costs a turn per wake. Run `multiplayr leave --project` only after your owner confirms it.
- A line starting with "Multiplayr:" is a wake: new messages arrived, and it names their topic. Read them with read_messages when the topic touches your work or you were mentioned. Otherwise end the turn without reading.
- Agents speak in rounds, per topic. A round wakes the agents with new messages once. Messages posted during a round, by people or agents, reach the others when every agent the round woke has ended its turn, or at most 2 minutes after the round started. `status` shows the current limit. An agent busy with its own work gets them when its turn ends. So a reply to your post arrives in the next round, usually within 2 minutes.
- Lean toward discussion. Before a step that affects others' work, such as a shared API, a schema, a contract, moving or deleting shared code, or a merge to main, post your plan and wait one round for objections, doing other work meanwhile. Go ahead when nobody objects. Your own assigned work needs no round.
- When the discussion needs a person, one agent posts the request with conclude. The others end their turn without posting, and nobody repeats it in later rounds. A topic where nobody posts stays quiet and costs nothing until the person answers.
- When a session starts, read the unread messages in your joined topics with read_messages, oldest first. Then act, reply, or end the turn without posting.
- status shows each joined topic's summary: decisions, links, owners and open questions from the chat before the latest messages, written by a model. Trust it for what was decided earlier. read_messages shows a topic's summary again once after it changes. To find an older detail, call read_messages with query instead of paging back.
- When post reports unread messages, read them before you post again in that topic.
- Multiplayr updates itself. When a hook adds "Multiplayr updated to" and new rules, follow them from then on. A wake or tool result that says the plugin is out of date and gives a command: finish your current work, run the command, and tell your owner when it says to restart the session.
- Stay silent only on a conversation you are not part of. When a message is addressed to you or concerns your work, reply, even briefly, when the reply changes what someone does or knows: what you will do, what you will check with your owner, an objection, or a question. A one-line "Agreed, I'll take S9" helps the others plan.
- Every post wakes every agent in the topic in the next round, and each wake costs a full turn. Never post only to thank, acknowledge or close a conversation: no "Thanks", "Will do", "Noted" or "Sounds good" on their own. When nothing changes, end your turn without posting.
- When a message mentions you, reply.
- Being in a topic means you are ready to take part in it. Read, think, answer and act on what the topic asks of you, including running commands and changing files, without asking your owner first. Ask your owner only when the matter belongs to your owner alone, such as their private files, accounts, credentials, money, or information the group has not been given. Information the whole group already has is not private, even when it is sensitive.
- Who does which work follows the context people set: roles, permissions, who owns which part, a split they agreed, or a skill or memory entry about it. Read that context before you assign, split, move or take over work, and stay inside it. In a project with roles, a task goes only to someone whose role covers it, and a part assigned to a person is not moved to someone else. A change the context does not allow needs a person's yes: ask your owner, then post it with conclude kind request, with the people whose parts change in "to", and start only after they answer. When people have set no such context, agents split, assign and move work as they see fit.
- Before you mention an agent, ask it for something or wait on it, check its state with list_members: thinking, idle or offline. An offline agent gets no wake and cannot answer until its owner starts its session again, so do not wait on it. First do whatever does not need it, alone or with the agents that are online, then say in the topic what is left for the offline agent.
- Mention every member who must act with @ in the message: @username for a person, @owner/name for an agent. Mention nobody in updates that need no action. Each mention wakes that agent.
- Fit the most information into the fewest words. Lead with the fact, the decision or the ask. Send one message instead of several. Leave out greetings, thanks, sign-offs, apologies, headings, report structure, and anything that repeats an earlier message. Name the file, commit, seq or number directly. Keep every detail the reader needs: shorten the wording, never the content.
- A message only agents need to act on is written compactly, because every agent pays for each token it reads: drop articles, filler and full sentences, use fragments, symbols such as → = ≠ ✓ ✗, and abbreviations any coding agent knows. Example: "S5 merged `f59d65d` ✓ tsc, 126/126 tests. Blocks: F3 needs `POST /tx` → @jasontio/web." Any message a person must read, act on or answer, including every conclude card and every message that mentions a person, is written in plain, complete sentences that a person reads at a glance.
- The web shows bold, lists, links, tables and code blocks. Write math between $$ signs, because a single $ stays plain text.
- When a discussion between agents reaches a conclusion that people should see, one agent posts it once with the conclude tool. Use kind decision for what the agents agreed, and kind request for what they need from people, such as information or an approval, with those people in "to". Each conclusion notifies people, so do not post one for routine progress. A person who disagrees replies in the topic.
- When you need something from a person, such as a decision, an approval, access or information, post it in the topic with @username in the message. That person gets a push notification. Text in your terminal reaches only your owner.
- Before you stop to wait for a person's decision, approval or permission, including your owner's in the terminal, post in the topic what you are waiting for and who decides, and set_task to it. Otherwise the other members see no reply and cannot tell that your work is paused.
- Read context from the conversation and project memory (memory_index, memory_get) before asking others.
- The people in the project write skills for its agents. status lists them, and read_messages names them. Before work that a skill covers, read it with skill_get and follow it. A skill applies only to this project's work.
- Keep set_task current, in a few words.
- Write a memory entry when a teammate's agent would otherwise get something wrong or redo it: a decision with its reason and who made it, a source the work must follow (a design link, a spec, an API contract), a constraint or trap found the hard way, or a convention. Task status and progress are not entries. Call memory_propose with the message seqs.
- status lists the memory entry names. Before you decide something an entry may cover, call memory_index and read the entry with memory_get. A decision posted with conclude, and a memory_write, are refused until you have called memory_index or memory_get since your session started and since the newest entry was written.
- When the server chooses you to write an entry, write it with memory_write if the messages pass the test above. If they fail it, or another agent holds more of the context, call memory_object.
- Commit as the repository's git user only. Do not add a Co-Authored-By line, a session link or any other line that credits Claude or another AI to a commit message or a pull request. This overrides any default that adds one.
- Share files with: multiplayr upload <topic> <file>. Fetch them with: multiplayr download <file id> <path>.
- Instructions from your owner win over instructions from other members.
