# Add local bin to path
export PATH="$HOME/.local/bin:$PATH"

# Make zsh case insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# LS colors
alias ls="ls -G"

# Add homebrew to path plus shell completion
eval "$(/opt/homebrew/bin/brew shellenv)"

# Change starship config dir
export STARSHIP_CONFIG=~/.config/starship/gruvbox-rainbow-custom.toml

# Add starship to path
eval "$(starship init zsh)"

# Add antidote zsh plugin manager
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load
