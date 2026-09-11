# Nano

Install nano with homebrew (or linuxbrew on linux)

```bash
brew install nano
```

Add the following to `~/.nanorc`. Double check that it is the correct path for your system.

```bash
include "{Homebrew Prefix}/share/nano/*.nanorc"
```

See the .nanorc file in this directory for more configuration settings

## Extended Syntax Highlighting

The syntax files bundled with homebrew nano only cover ~43 languages. For broader coverage (~100+ languages including TypeScript, Dockerfile, TOML, Swift, Kotlin, and more), install [galenguyer/nano-syntax-highlighting](https://github.com/galenguyer/nano-syntax-highlighting).

This is a fork of [scopatz/nanorc](https://github.com/scopatz/nanorc), which is brew installable (`brew install nanorc`) but has been unmaintained for 2+ years. The galenguyer fork is actively maintained with more recent fixes and additions but is not yet brew installable.

### Install

```bash
git clone https://github.com/galenguyer/nano-syntax-highlighting.git ~/.nano
```

Then add this to your `~/.nanorc`:

```bash
include "~/.nano/*.nanorc"
```

### Update

```bash
cd ~/.nano && git pull
```
