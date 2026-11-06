# CMUX

[cmux](https://cmux.com/) is a terminal emulator built on [ghostty](https://ghostty.org/) which basically adds features that are useful for agentic development.

Install with homebrew: `brew install --cask cmux`

The main config files are the ghostty config (lower level ghostty type settings) and the cmux settings json which has higher level cmux specific settings (such as custom shortcuts). Copy `config.ghostty` to `~/.config/ghostty/config` and `cmux.json` to `~/.config/cmux/cmux.json`.

It's useful to install the cmux skills so that your agent can properly use cmux

Install with install script (it defaults to `~/.codex/skills`, so point it at Claude's skills folder)

```
curl -fsSL https://raw.githubusercontent.com/manaflow-ai/cmux/main/skills.sh | bash -s -- --dest ~/.claude/skills
```

You can also install with the vercel skills cli, but it fails to install some of the skills globally. The install script installs them all globally.
