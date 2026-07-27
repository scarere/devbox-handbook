#!/bin/bash
input=$(cat)

# ── Feature toggles ────────────────────────────────────────────
# Set STATUSLINE_GIT=0 in your environment to disable git branch info
STATUSLINE_GIT="${STATUSLINE_GIT:-1}"

# Extract fields from JSON input
MODEL=$(echo "$input" | jq -r '.model.display_name // empty')
MODEL_ID=$(echo "$input" | jq -r '.model.id // empty')
DIR=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

# ── Gruvbox Dark Palette (true color) ──────────────────────────
RESET='\033[0m'
BOLD='\033[1m'

FG_FG0='\033[38;2;251;241;199m'     # #fbf1c7 cream
FG_ORANGE='\033[38;2;214;93;14m'    # #d65d0e
FG_YELLOW='\033[38;2;215;153;33m'   # #d79921
FG_AQUA='\033[38;2;104;157;106m'    # #689d6a
FG_BLUE='\033[38;2;69;133;136m'     # #458588
FG_GREEN='\033[38;2;152;151;26m'    # #98971a
FG_RED='\033[38;2;204;36;29m'       # #cc241d
FG_BG3='\033[38;2;102;92;84m'       # #665c54

SEP="${FG_BG3}|${RESET}"

# ── Model name with version ────────────────────────────────────
model_display="$MODEL"
if ! printf '%s' "$model_display" | grep -qE '[0-9]'; then
    case "$MODEL_ID" in
        *opus-4-6*|*opus-4.6*)     model_display="Opus 4.6" ;;
        *sonnet-4-6*|*sonnet-4.6*) model_display="Sonnet 4.6" ;;
        *haiku-4-5*|*haiku-4.5*)   model_display="Haiku 4.5" ;;
    esac
fi

# ── Line 1: Model │ Directory │ Git branch ─────────────────────

# Model with macOS icon
printf "${FG_ORANGE}${BOLD}󰀵 ${model_display}${RESET}"

# Directory
dir_name="~"
[ -n "$DIR" ] && dir_name=$(basename "$DIR")
printf " ${SEP}${FG_YELLOW}${BOLD} 󰝰 ${dir_name}${RESET}"

# Git branch
if [ "${STATUSLINE_GIT}" = "1" ] && git -C "${DIR:-$(pwd)}" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -C "${DIR:-$(pwd)}" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || \
             git -C "${DIR:-$(pwd)}" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        # Dirty/modified (unstaged changes)
        dirty=""
        [ -n "$(git -C "${DIR:-$(pwd)}" --no-optional-locks diff --name-only 2>/dev/null)" ] && dirty="󰛄"

        # Staged changes
        staged=""
        [ -n "$(git -C "${DIR:-$(pwd)}" --no-optional-locks diff --cached --name-only 2>/dev/null)" ] && staged="󱇬"

        # Stashed entries
        stash=""
        [ -n "$(git -C "${DIR:-$(pwd)}" --no-optional-locks stash list 2>/dev/null)" ] && stash="≡"

        # Ahead / behind / diverged
        sync=""
        upstream=$(git -C "${DIR:-$(pwd)}" --no-optional-locks rev-parse --abbrev-ref '@{upstream}' 2>/dev/null)
        if [ -n "$upstream" ]; then
            ahead=$(git -C "${DIR:-$(pwd)}" --no-optional-locks rev-list --count "@{upstream}..HEAD" 2>/dev/null)
            behind=$(git -C "${DIR:-$(pwd)}" --no-optional-locks rev-list --count "HEAD..@{upstream}" 2>/dev/null)
            if [ "${ahead:-0}" -gt 0 ] && [ "${behind:-0}" -gt 0 ]; then
                sync="⇕"
            elif [ "${ahead:-0}" -gt 0 ]; then
                sync="⇡"
            elif [ "${behind:-0}" -gt 0 ]; then
                sync="⇣"
            fi
        fi

        git_suffix="${dirty}${staged}${stash}${sync}"
        [ -n "$git_suffix" ] && git_suffix=" ${git_suffix}"
        printf " ${SEP}${FG_AQUA}  ${branch}${git_suffix}${RESET}"
    fi
fi

# Context bar color (gruvbox: aqua → orange → red)
if [ "$PCT" -ge 90 ]; then BAR_COLOR="$FG_RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$FG_ORANGE"
else BAR_COLOR="$FG_BLUE"; fi

FILLED=$((PCT / 10))
EMPTY=$((10 - FILLED))
BAR=""
[ "$FILLED" -gt 0 ] && BAR=$(printf "%${FILLED}s" | tr ' ' '▰')
[ "$EMPTY" -gt 0 ] && BAR="${BAR}$(printf "%${EMPTY}s" | tr ' ' '▱')"

printf " ${SEP} ${BAR_COLOR}${BAR}${RESET} ${FG_BG3}${PCT}%%${RESET}"

# Time (12hr AM/PM matching starship %-l:%M %p format)
time_str=$(date +"%-l:%M %p")
printf " ${SEP}${FG_FG0}  ${time_str}${RESET}"
