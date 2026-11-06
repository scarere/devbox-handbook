# Fonts

[Nerd Fonts](https://www.nerdfonts.com/) are fonts patched with extra icons (git branch, folders, language logos, etc.). The ghostty config, starship prompts and Claude Code status line use them, otherwise the icons show up as empty boxes.

Install with homebrew:

```bash
brew install --cask font-iosevka-term-nerd-font
```

The ghostty config uses `IosevkaTerm Nerd Font Mono`. Run `ghostty +list-fonts` to see the exact names of installed fonts.
