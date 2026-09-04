# CMUX

[cmux](https://cmux.com/) is a terminal emulator built on [ghostty](https://ghostty.org/) which basically adds features that are useful for agentic development.

I am still figuring out my configuration and setup for this emulator, but the main config files are the ghostty config (lower level ghostty type settings) and the cmux settings json which has higher level cmux specific settings (such as custom shortcuts).

Note useful to install the cmux skills so that your agent can properly use cmux

Install with install script

```
curl -fsSL https://raw.githubusercontent.com/manaflow-ai/cmux/main/skills.sh | bash
```

You can also install with the vercel skills cli, but there is an error where promptscript skills can't be installed globally? Idk why promptscript skills cant be installed globally, the install script installs them all globally. Not sure I fully understand whats going on here.
