#!/usr/bin/env bash
# Hook script for Claude Code  notifications.
# Sends a desktop notification via kitty's kitten notify.

# Add the following to ~/.claude/settings.json to enable:
# "hooks": {
#     "KittyNotification": [
#       {
#         "hooks": [
#           {
#             "type": "command",
#             "command": "bash /Users/scarere/.claude/hooks/kitten-notify.sh",
#             "async": true
#           }
#         ]
#       }
#     ]

set -euo pipefail

# Read hook input JSON from stdin
input=$(cat)

message=$(echo "$input" | jq -r '.message // "KittyNotification"')
transcript_path=$(echo "$input" | jq -r '.transcript_path // empty')
cwd=$(echo "$input" | jq -r '.cwd // empty')

# Try to get the session name from the transcript's custom-title entry
session_name=""
if [[ -n "$transcript_path" && -f "$transcript_path" ]]; then
    session_name=$(grep '"type":"custom-title"\|"type": "custom-title"' "$transcript_path" 2>/dev/null \
        | tail -1 \
        | jq -r '.customTitle // empty' 2>/dev/null || true)
fi

# Fall back to directory name
if [[ -z "$session_name" && -n "$cwd" ]]; then
    session_name=$(basename "$cwd")
fi

title=$(echo "$input" | jq -r '.title // "Claude Code"')

kitten notify --app-name "Claude Code" "$title: $session_name" "$message"
