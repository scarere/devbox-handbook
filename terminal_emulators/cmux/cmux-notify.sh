#!/bin/bash

# This script was copied from: https://cmux.com/docs/notifications
# Add the following to ~/.claude/settings.json to enable:
# "hooks": {
#     "Stop": [
#       {
#         "matcher": "",
#         "hooks": [
#           {
#             "type": "command",
#             "command": "~/.claude/hooks/cmux-notify.sh"
#           }
#         ]
#       }
#     ],
#     "PostToolUse": [
#       {
#         "matcher": "Task",
#         "hooks": [
#           {
#             "type": "command",
#             "command": "~/.claude/hooks/cmux-notify.sh"
#           }
#         ]
#       }
#     ]
#   }

# Skip if not in cmux
[ -S /tmp/cmux.sock ] || exit 0

EVENT=$(cat)
EVENT_TYPE=$(echo "$EVENT" | jq -r '.hook_event_name // "unknown"')
TOOL=$(echo "$EVENT" | jq -r '.tool_name // ""')

case "$EVENT_TYPE" in
    "Stop")
        cmux notify --title "Claude Code" --body "Session complete"
        ;;
    "PostToolUse")
        [ "$TOOL" = "Task" ] && cmux notify --title "Claude Code" --body "Agent finished"
        ;;
esac
