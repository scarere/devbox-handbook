
# Terminal Emulators

There are some options for which terminal emulator to use beyond the defaults (terminal.app for OSX and gnome terminal for ubuntu).

## Terminal.app
*OSX Only, CPU-Based, No True Color*

The default terminal for OSX. Honestly pretty great starting point, supports multiple tabs, multiple profiles, and since its the builtin default no need to set anything up. Furthermore it has a really nice looking and clear GUI for setting up the different profiles. The major downside is that it doesn't support **True Color** which basically makes having certain fancy shell prompts or color schemes not work.

## Gnome Terminal
*Ubuntu, CPU-Based*
The default for Ubuntu. Similar to terminal.app except it actually does support True Color. The UI for setting up different profiles isn't as nice. Supports multiple tabs.

## iTerm2
*OSX, CPU-Based*
Supposed to be a better version of terminal.app, but seems heavier than the lightweight, easily configurable alternatives.

## Kitty
*OSX, Linux, GPU-Based*
Lightweight and configured via a file which means transferring settings between systems easy. Runs on GPU which apparently makes things run real smooth. Supports multiple tabs. The config file doesn't have a UI, but this is also a pro for transferring settings easily between machines.

## Ghostty
Basically a newer more modern version of kitty, and way easier to configure. `ghostty +list-themes` opens a TUI that previews all the built-in themes.

## CMUX
Built on top of Ghostty (technically on top of `libghostty`). Adds organizational features and integrations that are really useful for agentic development. It's still new and gets lots of updates, but it's stable now (no real bug concerns) and the top choice. It comes with a bunch of pre-configured themes you can pick from its UI, so no custom theme setup is needed. You can use the same `config.ghostty` that you would use for Ghostty, so easy to switch between the two.
