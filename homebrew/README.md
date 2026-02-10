# Homebrew

Preferred package manager. Install it with the install script

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Make sure to add the following to your `.bashrc`/`.zshrc` in order for it to work properly. The homebrew prefix will depend on your platform (zsh vs bash, osx vs linux).

```bash
# Sets up a bunch of stuff for homebrew, adds it to path, tab completion, etc.
eval "$({Insert Homebrew Prefix}bin/brew shellenv)"
```