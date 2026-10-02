# Finding and using the Fieldnotes folder

## Resolve the folder

Resolve the user's Fieldnotes folder in this order and stop at the first match:

1. **Working folder.** If `fieldnotes.yml` exists in the current working directory, or in a folder the user attached to this task, use that folder.
2. **Pointer file.** Read `~/.config/fieldnotes/config.json`. It looks like `{"folder": "/absolute/path/to/Fieldnotes"}`. If that folder contains `fieldnotes.yml`, use it.
3. **Not found.** Tell the user Fieldnotes isn't set up here and offer to run `/fieldnotes-setup`. Don't guess a location, and don't create files.

If the pointer file names a folder you can't read (common in the Claude desktop app, where a task only sees folders the user adds), tell the user the path and ask them to add that folder to this task.

## Layout

```
<Fieldnotes folder>/
  fieldnotes.yml               # settings and categories
  fieldnotes-reminder.ics      # optional calendar reminder
  entries/YYYY-MM-DD.md        # one weekly entry, named by the week's Friday
  notes/YYYY-MM-DD.md          # quick notes for the week ending that Friday
  reports/                     # outputs: reviews, resume bullets, growth reports
```

Create `entries/`, `notes/`, or `reports/` if a skill needs one that doesn't exist yet.

## Dates

- Weeks are identified by their Friday ("week ending"), written `YYYY-MM-DD`.
- If the user states today's date, use it. Otherwise use the current date from your context.
- Week ending for a date: Monday through Friday map to that week's Friday. Saturday and Sunday map to the Friday just before them. Example: Thursday 2026-09-24 → 2026-09-25; Sunday 2026-09-27 → 2026-09-25.
- The Monday of a week is the week ending minus 4 days.

## Pointer file

`setup` writes `~/.config/fieldnotes/config.json` (creating `~/.config/fieldnotes/` if needed) with the absolute folder path. If writing it fails, say so and continue. The user can still work by opening Claude in their Fieldnotes folder.
