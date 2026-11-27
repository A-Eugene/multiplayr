#!/usr/bin/env bash
# Checks the multiplayr script's JSON parsing, version comparison, install linking and token handling. Run: tests/test.sh
unset CLAUDE_CONFIG_DIR CODEX_HOME GEMINI_CONFIG_DIR XDG_CONFIG_HOME
source "$(dirname "$0")/../core/multiplayr"
fails=0
check() { [[ $2 == "$3" ]] || { printf 'FAIL %s\n  got:  %q\n  want: %q\n' "$1" "$2" "$3"; fails=$((fails + 1)); }; }
is() { "$@" && echo yes || echo no; }

check "newer patch over minor-looking" "$(is newer 0.4.24 0.4.9)" yes
check "older is not newer" "$(is newer 0.4.9 0.4.24)" no
check "same is not newer" "$(is newer 0.4.24 0.4.24)" no
check "empty counts as oldest" "$(is newer 0.4.1 '')" yes

check "escaped quotes stay in the value" "$(json_field message <<<'{"message":"Run \"npm test\"?","session_id":"s1"}')" 'Run \"npm test\"?'
check "a key after an escaped quote" "$(json_field session_id <<<'{"message":"a\"b","session_id":"s1"}')" s1
check "a key inside a string value is ignored" "$(json_field session_id <<<'{"session_id":"real","tool_input":{"command":"echo \"session_id\": \"fake\""}}')" real
check "unescape" "$(json_unescape 'a\"b\\c\nd\txé\/')" $'a"b\\c\nd\txé/'

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
api() { printf '%s' "$*" >"$tmp/sent"; printf "%s\n" "$fake_reply"; }
fake_reply='{"jsonrpc":"2.0","id":1,"result":{"content":[{"type":"text","text":"You are x.\nSay \"hi\""},{"type":"text","text":"Update note"}]}}'
check "every content item is printed" "$(call_tool status)" $'You are x.\nSay "hi"\n\nUpdate note'
call_tool status >/dev/null
check "no arguments sends an empty object" "$(grep -o '"arguments":[^}]*}}}' "$tmp/sent")" '"arguments":{}}}'
call_tool post '{"a":1}' >/dev/null
check "arguments are sent as given" "$(grep -o '"arguments":{"a":1}}}' "$tmp/sent")" '"arguments":{"a":1}}}'
unset -f api

TOKEN_FILE=$tmp/token
printf 'tok123' >"$TOKEN_FILE"
check "token goes in a curl config" "$(auth_config)" 'header = "Authorization: Bearer tok123"'

HOME=$tmp
for v in 0.4.9 0.4.24; do
  d=$tmp/.claude/plugins/cache/multiplayr/multiplayr/$v
  mkdir -p "$d/bin" "$d/.claude-plugin"
  printf '{\n  "version": "%s"\n}\n' "$v" >"$d/.claude-plugin/plugin.json"
  printf '#!/bin/sh\n' >"$d/bin/multiplayr" && chmod +x "$d/bin/multiplayr"
done
# macOS mv has no -T, so the link must be replaced with options both versions share.
mv() { [[ $* == *-T* ]] && { echo "mv: illegal option -- T" >&2; return 1; }; command mv "$@"; }
link_newest /nowhere
link_newest /nowhere
unset -f mv
check "link points at the newest install" "$(readlink "$HOME/.local/bin/multiplayr")" "$tmp/.claude/plugins/cache/multiplayr/multiplayr/0.4.24/bin/multiplayr"
check "client version follows the link" "$(client_version)" 0.4.24

(( fails )) && { echo "$fails failed"; exit 1; }
echo "all passed"
