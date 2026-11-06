# Git & GitHub CLI

Install homebrew's `git` (newer than Apple's) and the [GitHub CLI](https://cli.github.com/):

```bash
brew install git gh
git config --global user.name "<name>"
git config --global user.email "<email>"
```

Use an SSH key for GitHub:

```bash
ssh-keygen -t ed25519 -C "<email>"
gh auth login -h github.com -p ssh    # logs in through the browser and uploads the key
```

`ssh -T git@github.com` should say *"Hi \<username\>! You've successfully authenticated"*.
