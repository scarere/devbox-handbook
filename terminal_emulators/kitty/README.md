# Kitty

Kitty is a terminal alternative for OSX and Linux. 

It has several features that are missing in Terminal.app and additionally it uses GPU-rendering which is supposed to make the terminal "smoother". It also can be entirely configured using a conf file which makes it easy to transfer
preferences between machines.

Currently I'm exploring switching to kitty from the Terminal.app and Gnome Terminal, this page will contain my notes on that process.

## Create or copy kitty.conf

You can either create `~/.config/kitty/kitty.conf` or copy one over. You can edit the file as usual, see the kitty documentation for details. 

After making edits to `kitty.conf` use `ctrl+shift+f5` (`ctrl+cmd+,` on osx) to reload the config and have those changes reflected. `ctrl+shift+f2` (`ctrl+,` on osx) is a shortcut for opening the kitty.conf from anywhere (might want to ensure you have set the `editor` parameter to your preferred editor first though).

## Add syntax highlighting for kitty.conf

I have created a custom `nanorc` file to add syntax highlighting to kitty with `nano`. Copy the nanorc file (I prefer to copy it into the kitty config directory: `~/.config/kitty/kitty.nanorc`). Then add the following to `~/.nanorc`

```bash
include "~/.config/kitty/kitty.nanorc"
```

Make sure it is one of the final includes. Any includes that match the `kitty.conf` file will overwrite the settings from `kitt.nanorc` if they are included after. For example the set of `nanorc` files that can be installed through `homebrew` include a simple syntax file for `.conf` files.

## Add a theme
The easiest way to change the theme of kitty is to use the `kitten themes` command. Select a theme and the press `M` to have it automatically update `kitty.conf`. The theme can be changed again at any time using this command.

## Shortcuts

TODO: These are linux specific, create a table with linux/osx shortcuts

- `ctrl+shift+t`: Open new tab
- `ctrl+shift+,`: Shift tab to the left
- `ctrl+shift+.`: Shift tab to the right
- `ctrl+shift+f5`: reload kitty.conf
- `ctrl+shift+f2`: Open kitty.conf


