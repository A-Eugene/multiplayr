#!/usr/bin/env bash
# Copies the core script, instructions and commands or skill into every platform folder.
set -euo pipefail
cd "$(dirname "$0")"
for dir in platforms/*/; do
  name=$(basename "$dir")
  mkdir -p "$dir/bin"
  cp core/multiplayr "$dir/bin/multiplayr"
  { cat core/instructions.md; [[ ! -f core/wake-$name.md ]] || cat "core/wake-$name.md"; } > "$dir/instructions.md"
  if [[ $name == claude-code ]]; then
    mkdir -p "$dir/commands"
    cp core/commands/*.md "$dir/commands/"
    { echo; sed 's/^# Multiplayr$/## Rules/' "$dir/instructions.md"; } >> "$dir/commands/join.md"
  else
    mkdir -p "$dir/skills/multiplayr"
    { cat "core/skill-$name.md"; echo; sed 's/^# Multiplayr$/## Rules/' "$dir/instructions.md"; } > "$dir/skills/multiplayr/SKILL.md"
  fi
done
chmod +x platforms/*/bin/multiplayr
