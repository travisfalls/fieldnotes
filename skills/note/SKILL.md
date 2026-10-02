---
name: note
description: Jot a quick Fieldnotes note about something that happened at work this week, like a win, a fix, a decision, or thanks from someone. Use when the user wants to log, jot, or note something quickly for their weekly check-in, or says something like "note that..." or "add to my fieldnotes".
argument-hint: "[what happened]"
---

# Quick note

Capture one note in a few seconds. Don't ask follow-up questions. Those wait for the weekly check-in.

1. Resolve the folder using `${CLAUDE_PLUGIN_ROOT}/references/folder.md`. If it's not found, say Fieldnotes isn't set up here and suggest `/fieldnotes:setup`, then stop without creating any files.
2. The note text is: $ARGUMENTS. If that's empty, use what the user said in their message. If there's still no text, ask "What do you want to note?" (the only allowed question).
3. Work out today's date and its week ending (folder.md, Dates). For the time, use one the user stated, or run `date +%H:%M` if you can run shell commands. If neither works, leave the time out. Never guess it.
4. If the note is recognition from someone else (thanks, praise, a shout-out), add `(kudos)` after the time (or after the date if there's no time).
5. Append one line to `notes/<week-ending>.md` in the format from `${CLAUDE_PLUGIN_ROOT}/references/entry-format.md`: `- YYYY-MM-DD HH:MM <text>`, or `- YYYY-MM-DD <text>` without a time (step 3). If the file doesn't exist, create it with the header `# Notes for week ending <week-ending>` and a blank line first. Keep every existing line.
6. Keep the user's wording. Fix only obvious typos.
7. Confirm in one line using the actual week ending, e.g. "Noted for the week ending Sep 25."
