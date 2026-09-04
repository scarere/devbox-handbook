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

### Tools to check out
- [pixi](https://pixi.prefix.dev/latest/): another package manager
- [pydantic](https://pydantic.dev/)
    - Has a bunch of stuff:
    - [pydantic-validation](https://pydantic.dev/docs/validation/latest/get-started/): Better data version of dataclasses
    - [pydantic-logfire](https://pydantic.dev/docs/logfire/get-started/): Telemetry, ie matric logging, logs, etc.
    - [Pydantic-AI](https://pydantic.dev/docs/ai/overview/): Not sure exactly what this is but looks like an SDK for creating agent harnesses?
- [polars](https://pola.rs/): Pandas but written in rust so its faster
- mlflow vs wandb: I feel like mlflow is probably better bc wandb was annoying and a headache when i used it. also mlflow is more open-source.
- [Numba](https://numba.pydata.org/): compile python/numpy code for faster runtimes
- [kauldron](https://kauldron.readthedocs.io/en/latest/): ML research framework
- [pi](https://pi.dev/): Looks cool but no mcp support out of the box
- [oh-my-claude-code](https://github.com/yeachan-heo/oh-my-claudecode): Multi-agent orchestration for claude code.
- [fastai](https://github.com/fastai/fastai): Another ml framwork, doesn't look that good tbh
- rust: I want to learn this probably
- [rich](https://rich.readthedocs.io/en/latest/introduction.html): Makes it easy to render "rich" text to terminal. Ie colors, markdown, loading bars, etc.
- [mise](https://mise.jdx.dev/): Another package manager, but manages all your env vars, cli's, etc. Polyglot env and runtime manager for reproducible projects.
- [eza](https://eza.rocks/): Replacement for `ls` command
- [atuin](https://atuin.sh/): Save and backup shell history to an sql databse to make search easier? Has a built in AI agent to ask why commands failed, that seems useful!
- [btop](https://github.com/aristocratos/btop): TUI to view and monitor machine resource usage (just processor, memory, disks, network, etc. No gpu)
- [grill-with-docs](https://www.aihero.dev/skills-grill-with-docs): Agent skill like superpowers but better apparently?
