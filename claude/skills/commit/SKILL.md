---
name: commit
description: Use when the user wants to commit their changes, invokes /commit, or asks to prepare commits. Proposes grouped commits for review before executing.
---

# Commit

Interactive commit workflow. Propose commits, get feedback, iterate, then commit only when explicitly told to.

## Rules

- **Do not push.** Ever. Only commit locally.
- **Do not commit until the user explicitly approves.**
- **Each file belongs to exactly one commit.** Never split a single file's changes across multiple commits.
- **Multiple files can share a commit** when their changes are related.
- **Each commit represents one logical change** — a fix, an addition, a refactor, a specific thing that was done.
- **Scope commits by concept, not diff size.** A commit can touch many files if they're all part of the same logical change (e.g., adding type hints across a test suite). But if a commit does multiple conceptually distinct things, split it up. A good test: if you need "and" in the title to describe it, it's probably two commits.

## Workflow

1. Run `git status` and `git diff` (staged + unstaged) to understand all changes.
2. Group changes into proposed commits. Use your judgment on grouping — related changes together, each commit a coherent unit.
3. Present the proposed commits to the user (see format below).
4. Ask: "Would you like me to commit these?"
5. If the user requests changes (reword, split, merge, move files between commits), update the plan and re-present **all** proposed commits, not just the changed ones.
6. Repeat steps 4-5 until the user explicitly tells you to commit (e.g., "commit", "go ahead", "looks good, commit"). Silence, acknowledgement, or lack of objection is not approval — wait for a clear instruction to proceed.
7. Only then execute the commits in order.

## Commit Message Format

**Title (first line):**
- Single line, max 72 characters (must not get truncated in GitHub UI)
- Logical description of the change, not a list of files
- Clear, concise, easy for a human to scan

**Good titles:**
- `Add copy-on-select and config location note`
- `Fix auth redirect loop on expired sessions`
- `Add type hints to agent scripts`

**Bad titles:**
- `Updated extract_cli.py, common.py, and utils.py with type hints` (file list)
- `Various fixes and improvements` (vague)
- `Add new configuration options for terminal emulator settings including copy-on-select` (too long)

**Body (only if needed):**
- Bullet points, one per line
- Each bullet is concise and fits on a single line without wrapping
- Only add body when the title alone doesn't give enough context

## Presenting Proposed Commits

Present each commit in a blockquote. The commit message goes in a code block. Files go in a nested blockquote with italic names. Each file has a status emoji:
- ♻️ new file
- 〽️ modified
- ❌ deleted

Example:

> **1.**
> ```
> Add eza package docs and remove from todo list
> ```
>> *packages/eza.md* ♻️
>> *TODO.md* 〽️

> **2.**
> ```
> Overhaul zshrc with sections, eza alias, and startup fixes
> - Reorganized into labeled sections
> - Added eza aliases for common ls replacements
> ```
>> *shell/zshrc.md* 〽️

> **3.**
> ```
> Remove deprecated config file
> ```
>> *old-config.md* ❌
