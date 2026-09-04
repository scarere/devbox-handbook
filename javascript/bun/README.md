# Bun

[Bun](https://bun.com/docs) is a Javascript package manager, runtime, etc. that is a drop in replacement for Node.js. It supports most Node API's and npm packages. It's also way faster. It serves as a package manager, test runner, bundler, typescript transpiler, and executor. Basically it replaces a bunch of things. For our purposes it mainly replaces `npm` (package manager) and `npx` (executor).

## Install

Install it with brew:
```zsh
brew install oven-sh/bun/bun
```

Make sure to add the bun bin to your path in order for packages that are installed globally to be available:

```zsh
# Add to .zshrc
export PATH="$HOME/.bun/bin:$PATH"
```

## Usage

Install Javascript packages with `bun` instead of `npm` for faster downloads. Always include the `--global` (`-g`) flag to have it installed globally. Otherwise it will only install into your local project/directory.

```zsh
bun install -g ccusage
```

Execute npm package executables without installing them using `bunx`. Similar to how uvx works.

```zsh
bunx ccusage
```