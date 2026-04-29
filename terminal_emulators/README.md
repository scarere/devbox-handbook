
# Terminal Emulators

So we've got some options for which terminal emulator to use. Up until recently I've always used the defaults (terminal.app for OSX and gnome terminal for ubuntu), however there are some alternatives that I'm not considering.

## Terminal.app
*OSX Only, CPU-Based, No True Color*

The default terminal for OSX. Honestly pretty great starting point, supports multiple tabs, multiple profiles, and since its the builtin default no need to set anything up. Furthermore it has a really nice looking and clear GUI for setting up the different profiles. The only major downside I've found so far is that it doesn't support **True Color** which basically makes having certain fancy shell prompts or color schemes not work. Also at the time of writing I have not used anything other than gnome terminal, so not really aware of what missing features actually matter to me.

## Gnome Terminal
*Ubuntu, CPU-Based*
The default for Ubuntu. Similar to terminal.app except it actually does support True Color. The UI for setting up different profiles isn't as nice. Supports multiple tabs.

## iTerm2
*OSX, CPU-Based*
Supposed to be a better version of terminal.app, but seems heavier and I like my software lightweight and easily configurable.

## Kitty
*OSX, Linux, GPU-Based*
Lightweight and configured via a file which means transferring settings between systems easy. Runs on GPU which apparently makes things run real smooth. Supports multiple tabs. Only con I see is that the config file doesn't have a UI, but this is also a pro for transferring settings easily between machines.

## Ghostty
Basically a newer more modern version of kitty. I've never used it directly, but based on my experience with cmux, it sounds like it is way easier to configure. Only con is that it doesn't have fully fledged TUI's like kitty does for selecting themes. But the `ghostty +list-themes` command is similar enough, it previews the themes for you and you just have to type in the one you want manually after rather than hitting enter like with kitty. This is the main TUI I care about anyways and I consider that good enough.

## CMUX
Built on top of Ghostty (technically on top of `libghostty`). Adds organizational features and integrations that are really useful for agentic development. As of April 29th 2026, it is a bit buggy but defs still usable. Not so buggy that its annoying to use (so far, we'll see as time progresses). You can use the same `config.ghostty` that you would use for Ghostty, so easy to switch between the two.
