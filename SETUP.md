# New Mac Setup

> [!WARNING]
> **Untested.** This was written from a working Mac (Nov 2026), not by running it on a fresh one. Agent: if a step fails or something is missing, fix it, then update this file (or the README it links to) so it's right next time. Remove this warning once a full run goes through cleanly.

Sets up a Mac with this dev environment. Hand it to a Claude Code agent. This file only decides **what** gets installed and in **what order**. Each step links to the tool's README, which has the actual commands and settings. The READMEs are written for a human. The agent follows them **unattended**, using the [defaults](#defaults) below instead of asking.

**Target:** Apple Silicon Mac, macOS 15+, zsh. Re-running is safe (finished steps get skipped), so this also works for topping up an existing Mac.

## Up-front questions

Ask all of these in a single `AskUserQuestion` call (or one message), before doing anything else:

- **Git identity:** name and email
- **Install VoiceInk?** It's optional (see [step 15](#apps))

If the user says yes to VoiceInk, also ask them to **start the Xcode download from the App Store now**. It's large, and it can download while everything else installs.

## Steps

Everything is installed unless it's marked **Optional**.

### Initial setup

| # | Step | Follow | Notes |
| :--- | :--- | :--- | :--- |
| 1 | Homebrew | [system/homebrew](system/homebrew/) | **User runs the installer** (needs their password). Also installs Apple's Command Line Tools (`git`) |
| 2 | Git & GitHub (SSH) | [system/packages/git](system/packages/git/) | **User runs `gh auth login`** (browser login) |
| 3 | Clone this repo | `mkdir -p ~/Code && git clone git@github.com:scarere/devbox-handbook.git ~/Code/devbox-handbook` | Use the HTTPS URL if SSH isn't working (public repo) |

**If you're reading this from a local clone, skip step 3.** Otherwise, read the linked READMEs from GitHub (same path under `https://github.com/scarere/devbox-handbook/blob/main/`) until the clone exists. Keep the clone where it is afterwards: Claude Code's custom skills are symlinked into it.

### Shell & terminal

| # | Step | Follow | Notes |
| :--- | :--- | :--- | :--- |
| 4 | Nerd Font | [system/packages/fonts](system/packages/fonts/) | cmux, starship and the Claude status line use it |
| 5 | zsh config | [shells/zsh](shells/zsh/) | |
| 6 | Antidote | [shells/zsh/antidote](shells/zsh/antidote/) | Installed but not loaded until there are plugins |
| 7 | Starship prompt | [system/packages/starship](system/packages/starship/) | |
| 8 | eza | [system/packages/eza](system/packages/eza/) | |
| 9 | cmux | [terminal_emulators/cmux](terminal_emulators/cmux/) | Includes the cmux skills for Claude Code |

### Dev tools

| # | Step | Follow | Notes |
| :--- | :--- | :--- | :--- |
| 10 | nano | [system/packages/nano](system/packages/nano/) | |
| 11 | VS Code | [apps/vscode](apps/vscode/) | |
| 12 | Bun + global packages | [javascript/bun](javascript/bun/) | Then install [ccusage](javascript/packages/ccusage/) and the [skills CLI](javascript/packages/vercel-skills/) with it |
| 13 | Python tools (uv, ruff, ty) | [system/packages/astral](system/packages/astral/) | |
| 14 | Claude Code config | [claude](claude/) | Copy the settings and status line, symlink the custom skills |

### Apps

| # | Step | Follow | Notes |
| :--- | :--- | :--- | :--- |
| 15 | VoiceInk | [apps/voiceink](apps/voiceink/) | **Optional.** **User runs** the `sudo` commands, grants permissions and imports the personal settings |

Then [wrap up](#wrap-up).

To add a tool: give it a README with its install commands, and add a row here. Only add tools that belong on every machine. Mark it **Optional** if not always, and add a question for it to the [up-front questions](#up-front-questions). If it has steps the agent can't do, say so in Notes.

## Wrap up

1. Report: installed / already done / skipped / failed, configs that were left alone because they differ from the repo (with a short diff), and anything the user still has to do.
2. Tell the user to open a **new** cmux window so the new `.zshrc` and font load, and to restart Claude Code so it picks up the new settings and skills.
3. If anything in this repo was wrong or missing, fix it and offer to commit.

## Notes for the agent

**Work unattended.** After the up-front questions, don't check in between steps or ask for confirmation. Use the defaults below. Only stop for a hand-off.

**Show progress.** Don't narrate ("Now installing starship…"). Work quietly and keep the user updated in two ways:

1. **Once, right after the up-front questions:** the full plan as a markdown checklist, grouped like the tables above.

   ```markdown
   **Setup plan · 15 steps**

   **Initial setup**
   - [ ] 1 Homebrew
   - [ ] 2 Git & GitHub (SSH)
   - [ ] 3 Clone this repo

   **Shell & terminal**
   - [ ] 4 Nerd Font
   - …
   ```

2. **Then one line per step**, posted when you start it, always in this format:

   `<icon> <step>/<total> · <section> · <step name>` plus ` · <status>` when it isn't a normal run

   ```
   ▶ 7/15 · Shell & terminal · Starship prompt
   ⏭ 8/15 · Shell & terminal · eza · already done
   ⏳ 15/15 · Apps · VoiceInk · waiting on you
   ✗ 12/15 · Dev tools · Bun + global packages · failed: brew tap timed out
   ```

   Icons: `▶` running, `⏭` already done or skipped, `⏳` waiting on you, `✗` failed. Anything else (hand-off instructions, errors, diffs) goes on the lines below it, never inside it.

**Hand-offs.** These are the only times to stop: anything needing the user's password (`sudo`, the Homebrew installer), a browser login (`gh auth login`), or a GUI (App Store, permission dialogs, in-app settings). Give the user the exact command or clicks, ask them to run commands in their own terminal window, wait for them to say done, then check it worked. Where you can, group hand-offs so the user is interrupted as few times as possible.

**Repo paths.** Paths in the READMEs (like `shells/zsh/.zshrc`) are relative to the repo root, so run README commands from there. Never assume where the clone lives.

**Each step.** First check whether it's already set up (installed, config in place). If so, mark it "already done" and move on. Otherwise follow the README, then verify it worked (e.g. `<tool> --version`, the config file is in place).

**Shell.** Your Bash calls don't share state. Until `~/.zshrc` is in place, start commands with `eval "$(/opt/homebrew/bin/brew shellenv)" &&`. You can batch `brew install`s from several steps into one command.

### Defaults

| Situation | Do this, without asking |
| :--- | :--- |
| A step is already done | Skip it, mark "already done" |
| Where to clone code repositories (this repo, VoiceInk, …) | `~/Code/<repo-name>`. Create `~/Code` if it doesn't exist. Repos that are really config, like `~/.nano` in the nano README, go where their README says |
| A config file already exists and differs from the repo | Leave it alone and list it in the report. Exception: `~/.claude/settings.json` (Claude Code creates it on login): merge the repo's keys into it |
| A README step is interactive for a human (prompts, "press enter") | Use the non-interactive form, e.g. `ssh-keygen -t ed25519 -C "<email>" -f ~/.ssh/id_ed25519 -N ""` |
| SSH key | No passphrase (`-N ""`). If `~/.ssh/id_ed25519` already exists, use it, don't make a new one |
| A step fails | Try to fix it. If you can't, mark it failed, carry on with steps that don't depend on it, and include it in the report |
