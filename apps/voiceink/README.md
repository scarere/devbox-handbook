# VoiceInk

[VoiceInk](https://github.com/Beingpax/VoiceInk) is an open-source macOS dictation app. It runs speech-to-text models **locally**, so it's basically a free [Wispr Flow](https://wisprflow.ai) replacement.

- 🎙️ Hold a key, talk, and the text gets typed into whatever app is focused
- 🔒 Speech recognition runs on your Mac (Parakeet, Whisper, etc.)
- 🤖 Optional AI cleanup, routed through Claude Code to format `code_terms`, `CamelCase` and file names
- 💸 Free if you build from source (prebuilt app is $25+)

## Install (build from source)

*Apple Silicon, macOS 15+*

1. Install **Xcode** (App Store, or the `.xip` from [developer.apple.com/download](https://developer.apple.com/download/all/?q=xcode))
2. One-time setup:

```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch
xcodebuild -downloadComponent MetalToolchain
brew install cmake
```

3. Build:

```bash
git clone https://github.com/Beingpax/VoiceInk.git
cd VoiceInk && make local
mv ~/Downloads/VoiceInk.app /Applications/
```

To update: `git pull && make local`. There are no auto-updates when you build from source.

## Restore my settings

`voiceink-settings.json` in this folder has my modes, prompts, vocabulary and general settings.

**VoiceInk → Settings → Import Settings** → pick `voiceink-settings.json`

The export doesn't include these, so set them by hand:

| Setting | Where | Value |
| :--- | :--- | :--- |
| CLI Provider command | AI Models → Local → Local Enhancement Services | [see below](#claude-code-as-the-ai-cleanup) |
| Skip short transcriptions | AI Models → ⚙ → Enhancement Settings | On, 8 words |

## Claude Code as the AI cleanup

No API key needed: it uses your existing Claude Code login.

```bash
CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 /Users/<you>/.local/bin/claude -p --model claude-sonnet-5-5 --effort low --tools '' --strict-mcp-config --disable-slash-commands --no-session-persistence --setting-sources '' "$VOICEINK_FULL_PROMPT"
```

- Use the **absolute path** to `claude` (`which -a claude`). GUI apps don't read `~/.zshrc`
- The extra flags cut startup from ~6s to ~1.5s
- `--bare` would be faster still, but it only works with an API key

## My settings

| Setting | Value |
| :--- | :--- |
| Model | **Parakeet Ultra** (fast, accurate English) |
| Record shortcut | `fn` + `⌥`, Hybrid (hold to talk, or tap to start and tap again to stop) |
| Paste Last Transcription (Enhanced) | `fn` + `V` |
| Paste Method | **Direct Typing** (so Claude Code doesn't collapse it to "Pasted N lines") |
| Auto Send | Global: `Shift + Return` · Code mode: None |

| Mode | Used in | AI cleanup |
| :--- | :--- | :--- |
| **Code** | cmux, VS Code | Local CLI (Claude), "Cleanup for Code Agent" prompt, Screen context on |
| **Dictation** (default) | Everything else | Off |

## Extra: model downloads blocked?

If a firewall blocks the in-app downloads, get the weights some other way and copy them into place **before first launch**. VoiceInk only checks that the files exist.

| Model | Hugging Face repo | Copy to `~/Library/Application Support/` |
| :--- | :--- | :--- |
| VAD (required) | `FluidInference/silero-vad-coreml` | `FluidAudio/Models/silero-vad/` |
| Parakeet V3 (onboarding needs it) | `FluidInference/parakeet-tdt-0.6b-v3-coreml` | `FluidAudio/Models/parakeet-tdt-0.6b-v3/` |
| Parakeet Ultra | `FluidInference/parakeet-ultra-coreml` | `FluidAudio/Models/parakeet-ultra/` |
| Whisper | `ggerganov/whisper.cpp` (`ggml-*.bin`) | `com.prakashjoshipax.VoiceInk/WhisperModels/` |

*Mapped against VoiceInk 2.22. These paths are hardcoded and can change between versions.*

## Tips

- Stay in the target window until the text appears. It types wherever focus is when it finishes
- Add jargon under **Dictionary**
- **History** shows the raw transcript next to the cleaned version
