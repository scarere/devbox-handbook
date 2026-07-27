# Antidote

[Antidote](https://antidote.sh/) is a lightweight zsh plugin manager.

It can be installed with homebrew: `brew install antidote`

List plugins you want to install in `~/.zsh_plugins.txt` and activate antidote by adding the following to your `.zshrc`

```bash
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh  # Only works if you installed with brew, otherwise path is different
antidote load
```
