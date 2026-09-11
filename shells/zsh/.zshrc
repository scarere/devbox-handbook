# Path
# ============================================================

# Add local bin to path
export PATH="$HOME/.local/bin:$PATH"

# Add bun to path
export PATH="$HOME/.bun/bin:$PATH"

# Add homebrew to path and shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Completions
# ============================================================

# Add Docker CLI completions
fpath=($HOME/.docker/completions $fpath)

# Initialize completion system (once per day)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Make completion case insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Prompt
# ============================================================

# Fix starship prompt showing wrong case for directories (e.g. ~/code instead of ~/Code)
_fix_pwd_case() { PWD=$(realpath .) }
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _fix_pwd_case

# Set starship config and initialize prompt
export STARSHIP_CONFIG=~/.config/starship/gruvbox-rainbow-custom.toml
eval "$(starship init zsh)"

# Aliases
# ============================================================

# LS colors
# Use eza if installed, otherwise fall back to ls -G
if command -v eza &>/dev/null; then
    alias ls="eza"
    alias ll="eza -lh --git"
else
    alias ls='ls -G'
    alias ll="ls -G -l"
fi

# Cisco web filtering toggle
alias cisco-off='(sudo launchctl bootout system/com.cisco.secureclient.vpn.service.agent 2>/dev/null || sudo launchctl bootout system/com.cisco.secureclient.vpnagentd 2>/dev/null) && sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo "Cisco filtering disabled"'
alias cisco-on='sudo launchctl bootstrap system "/opt/cisco/secureclient/bin/Cisco Secure Client - AnyConnect VPN Service.app/Contents/Resources/com.cisco.secureclient.vpnagentd.plist" && echo "Cisco filtering enabled"'

# Plugins (antidote)
# ============================================================

# Disabled — no plugins in .zsh_plugins.txt, was costing ~180ms
# source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# antidote load
