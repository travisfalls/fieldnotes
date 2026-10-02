---
name: fieldnotes-setup
description: Set up or reconfigure Fieldnotes, a private weekly work journal kept in your own files. Use when someone wants to start using Fieldnotes, start a work journal, change their Fieldnotes folder, role, categories, or check-in reminder, or migrate older weekly check-in files into Fieldnotes.
---

# Fieldnotes setup

Set up the user's Fieldnotes folder, or change an existing setup. Keep it quick and friendly.

If the user's message already answers a question below, use that answer and don't ask again. If they say not to ask anything, use their answers plus the defaults here.

Before starting, read:
- `${CLAUDE_PLUGIN_ROOT}/references/folder.md`
- `${CLAUDE_PLUGIN_ROOT}/references/entry-format.md`
- `${CLAUDE_PLUGIN_ROOT}/references/categories.md`
- `${CLAUDE_PLUGIN_ROOT}/references/privacy.md`

## If Fieldnotes is already set up

Resolve the folder using folder.md. If one is found, offer to change the folder location, role and categories, or reminder (and to migrate old files, below). Change only what the user asks for. Never modify or delete entries or notes.

- **Moving the folder:** copy it with `cp -R -n` to the new location, check the copy has the same files, update the pointer file, and leave the old folder for the user to delete. Never use `mv` on the whole folder.
- **Adding a role pack:** append the new pack's categories to the existing list (merging duplicates). Keep the old categories, since old entries use them.
- If the folder the user picks already contains `fieldnotes.yml`, treat it as already set up and don't overwrite it.

## New setup

1. **Privacy.** Show the privacy note from privacy.md, word for word.

2. **Folder.** Ask where to keep the folder. Suggest `~/Library/Mobile Documents/com~apple~CloudDocs/Fieldnotes` (iCloud Drive) on macOS, `~/OneDrive/Fieldnotes` on Windows, and `~/Fieldnotes` otherwise. Accept any path the user gives, including relative paths like `./Fieldnotes`. If a folder is already attached to this task (in the desktop app, folders the user adds to a task), use that one and don't ask. Create the folder plus `entries/`, `notes/`, and `reports/` inside it.

3. **Name.** Use the name the user gives, or ask what to call them.

4. **Role and categories.**
   - Show the packs listed in categories.md and ask which fit. More than one is fine. Consultant is meant to stack with a role pack.
   - If none fit, ask them to describe their job in a sentence or two and draft custom categories following categories.md.
   - Read the chosen pack files from `${CLAUDE_PLUGIN_ROOT}/references/category-packs/`, merge them, and show the final list. Let the user keep, rename, add, or remove categories.

5. **Reminder.** Ask what day and time they want a weekly check-in reminder. Default: Friday 2:00pm. They can also say no reminder.
   - **Scheduled task (preferred):** if you have a tool for creating scheduled tasks (for example `create_scheduled_task`) and the user didn't ask for a calendar file, create a weekly task at that day and time, in the user's local time zone, titled "Fieldnotes check-in reminder", with this prompt: `It's time for your weekly Fieldnotes check-in. Ask me if I want to start now. If I say yes, tell me to start a new task with my Fieldnotes folder added and run /fieldnotes-checkin there. Don't read or summarize any files.` The task must not try to read the Fieldnotes folder. Tell the user it's set and how to change it. If creating it fails, fall back to the calendar file.
   - **Calendar file:** otherwise, read `${CLAUDE_PLUGIN_ROOT}/templates/reminder.ics`, fill every `{{PLACEHOLDER}}` as described below, and write it to `<folder>/fieldnotes-reminder.ics`. Tell them to open that file to add the event to their calendar. If they are changing an earlier calendar reminder, tell them to delete the old event, since the new one is added alongside it.
   - `{{UID}}`: `fieldnotes-<YYYYMMDDHHMMSS>@fieldnotes.local` using the current time.
   - `{{DTSTAMP}}`: current UTC time, `YYYYMMDDTHHMMSSZ`.
   - `{{DTSTART}}`: the next date on or after today that falls on the chosen weekday, at the chosen local time, written `YYYYMMDDTHHMMSS` with no `Z`.
   - `{{BYDAY}}`: MO, TU, WE, TH, FR, SA, or SU.
   - If they don't want a reminder, set `reminder.enabled: false`, still record `day` and `time` (the defaults if they didn't choose), omit `method`, and don't create a task or a file.
   - Record which one you used as `reminder.method: scheduled-task` or `reminder.method: calendar` in fieldnotes.yml. When re-running setup to change the reminder, update or remove the existing scheduled task instead of creating a second one.

6. **Save settings.** Write `<folder>/fieldnotes.yml` following entry-format.md, including `name`, `reminder` (day as a lowercase weekday name, time as 24-hour `"HH:MM"`), `role_packs` (pack file names without `.md`, or `[custom]`), and every category with its description.

7. **Pointer file.** Write `~/.config/fieldnotes/config.json` as `{"folder": "<absolute folder path>"}`. If that fails, say so briefly and explain they can open Claude with the Fieldnotes folder instead.

8. **Older check-ins.** If the user mentions older weekly check-in files, or you notice files named like `*_weekly-checkin.md` near the folder they chose, follow "Migrate older check-ins" below.

9. **Wrap up.** In a few lines: where the folder is, how many categories they have, the reminder (or none), and the two commands to start with: `/fieldnotes-note` for quick notes during the week and `/fieldnotes-checkin` for the weekly check-in. In the desktop app, remind them to add their Fieldnotes folder to a task before running Fieldnotes commands, and to do that with a folder they create first if they don't have one yet.

## Migrate older check-ins

Use this when the user has weekly check-in files from before Fieldnotes, such as files named `YYYY-MM-DD_weekly-checkin.md` with Accomplishments, Challenges & Learnings, Engagement Check-in, and Looking Ahead sections.

1. Find the old files in the folder the user names (don't search subfolders), or ask where they are. List what you found: the weekly check-ins, and every other dated file by name.
2. **Weekly check-ins:** for each one, oldest first:
   - Week ending = the date in the file name, adjusted to its Friday if needed (folder.md, Dates). If two files map to the same week, migrate the first and skip the second, listing it in the summary.
   - Read the engagement score from the `**Level:** N/10` line. If there isn't one, ask the user for the score; if they said to accept everything or not to ask, use `engagement: null` and list the file in the summary. Never guess a score.
   - Propose tags and highlights following entry-format.md and categories.md, using only the user's categories. Mark recognition from others as `kudos`. Set `continues` when an entry clearly follows up on an earlier one.
   - Show proposals in batches of about 4 weeks for the user to confirm or edit (skip confirmation if they said to accept everything).
3. **Prepare folders.** Before moving anything, create `entries/`, `reports/`, and the old folder's `migrated/` with `mkdir -p` if they are missing. Run `cp`, `mv`, and `mkdir` as separate simple commands.
4. **Write each entry without retyping the body.** If the old file already starts with a `---` frontmatter block, skip it and list it in the summary (don't add a second frontmatter). Otherwise check the destination `<folder>/entries/<week-ending>.md` doesn't exist (Read or `ls`), then copy with `cp -n "<old file>" "<folder>/entries/<week-ending>.md"`. The `-n` is only a backstop: on macOS it skips silently, so the check comes first. Then use the Edit tool with the copied file's first line as `old_string` and, as `new_string`, the frontmatter block, a blank line, and that same first line. Never rewrite the body with Write. Then read the new entry back and confirm everything after the frontmatter is identical to the original file. If it isn't, stop and tell the user.
5. **Other dated files** (1:1 prep, review prep, anything matching `YYYY-MM-DD_*.md` that isn't a weekly check-in): show the list by name and get an explicit yes before moving any of them, even if the user said to accept everything. Then check each destination in `reports/` doesn't exist and move the file unchanged with `mv -n`, keeping its name.
6. **Move originals only after their entry is verified.** Check the destination in `migrated/` doesn't exist, then use `mv -n` into the `migrated/` subfolder of the old location, so nothing is deleted or overwritten. Tell the user they can delete `migrated/` once they're happy. After every `mv` (here and in step 5), confirm the source is gone and the destination exists. If not, stop and tell the user.
7. **Never overwrite.** If a destination file already exists in `entries/`, `reports/`, or `migrated/`, ask the user what to do. If they said to accept everything or not to ask, skip that file and list it in the summary.
8. Summarize: how many entries migrated, how many files moved to `reports/`, and anything skipped and why.
