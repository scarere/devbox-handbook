# Starship Prompt

Starship prompt is a tool for having configurable terminal prompts. I consider this essential now in order to have information presented to me in a clean way.

This directory contains a couple custom prompts. I will try to keep them updated until I have a set of ultimate prompts that present the info most relevant to me. Most of them are just small edits to the defaults.

## Installation Tips

Follow the installation instructions in their [documentation](https://starship.rs/guide/). Preferably install with homebrew.

### Install script

, most likely you'll be using curl to download their install script and run it. By default starship will be installed to /usr/local/bin. If you need to modify parts of the install the script does accept flags. You can either write the install script to disk or use the `-s --` flags to add flags if piping it from the curl command.

```bash
# Add flags to piped command
curl -sS https://starship.rs/install.sh | sh -s -- --help
# Save install script and run
curl -sS https://starship.rs/install.sh > ~/install.sh
sh ~/install.sh --help
```

To install starship locally:

```bash
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin
```

You can change `~/.local/bin` to any path you want. Just make sure that the path is in your `$PATH` variable or your terminal won't be able to find the local install.
