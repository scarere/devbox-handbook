# Claude Code

Custom claude code settings, skills, hooks and tips

## Key BuiltIn Commands:

Here are some notable built in commands to remember

- `/btw`
    - Ask a side question whose output does not get added to context
    - Can be run while waiting for a response
    - Can not use tools or hooks etc.
- `/context`
    - Analysis of context usage
    - Useful for seeing how much of context is used up by tools, skills, the system prompt etc.
- `/diff`
    - Git diff to analyze changes in current branch
    - Must have `gh` CLI installed I think
- `/insights`
    - Generates a detailed insight report using all your session history
    - Recommends how to better use claude code based on insights
    - Use `open ~/path/to/report.html` to open insight report in browser
- `/agents`
    - View available subagents
- `/skills`
    - View available skills (not including the built in skills/commands)
- `/fork`
    - Copy current context over into a new session
- `/ide`
    - Enable ide integration in the CLI interface
- `/rename`
    - Rename the session
- `/rewind`
    - rewind context to a previous point. Useful for unanticipated sidequests
    - You can also rewind code changes. Useful for if you go down wrong path and want to undo stuff.
- `/tasks`
    - List and manage background tasks. Instruct Claude to run something in background and continue with other questions
    
