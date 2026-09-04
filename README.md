# devbox-handbook
Personal documentation on setting up my preferred dev environment

For now it will be pretty focused on unix based machines.

## Quick Start:

1. [Pick a Terminal Emulator](terminal_emulators)
2. [Install Homebrew](system/homebrew)
3. [Install nano](system/packages/nano)
3. [Set up starship prompt](system/packages/starship)
4. [Copy `.zshrc`](shells/zsh)

## Shawn's Current Stack

*Last Updated: Sept 4th 2026*

### System

| Tool | Category |
| :--- | :--: |
| Terminal Emulator | [cmux](terminal_emulators/cmux) |
| System Package Manager | [homebrew](system/homebrew/) |
| Javascript Package Manager | [bun](javascript/bun/) |
| Zsh Plugin Manager | [antidote](shells/zsh/antidote/) |
| Shell Text Editor | [nano](system/packages/nano/) |
| Shell Prompt | [starship](system/packages/starship/) |

### Python

| Tool | Category |
| :--- | :--: |
| Package Manager | [uv](system/packages/astral/) |
| Linter & Formatter | [ruff]((system/packages/astral/) ) |
| Type Checker | [ty]((system/packages/astral/) ) |


## TO-DO:

- Look into useful js packages such as vercel skills cli, etc.
- Add alternate options even if I don't use them?
- Check out best tool for creating an agent wiki and try it out
    - [OpenWiki](https://github.com/langchain-ai/openwiki)
        - Looks a little overly complicated and no connector for ingesting session history. Would need to write out own.
