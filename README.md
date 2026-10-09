# Fieldnotes

A private weekly work journal for Claude. Log your week in a few minutes, then turn it into 1:1 notes, review prep, resume bullets, skill-growth reports, and a reminder of what you've accomplished when you need one.

Your entries are plain markdown files in a folder you choose. There's no server and no account to create.

## Requirements

Claude desktop app or Claude Code. No Python or Node needed.

## Install

**Claude desktop app:** Customize → Plugins → Add marketplace → `travisfalls/fieldnotes`, then install **Fieldnotes**.

**Claude Code:**

    claude plugin marketplace add travisfalls/fieldnotes
    claude plugin install fieldnotes@travisfalls-plugins

## Quick start

1. Run `/fieldnotes-setup`. Pick a folder, your role, and a reminder time. In the desktop app the reminder is a scheduled task that asks if you're ready to check in. If Claude can't schedule tasks, you get a calendar event to add.
2. During the week, jot things down: `/fieldnotes-note shipped the migration, QA unblocked`
3. On Friday, run `/fieldnotes-checkin`.

In the desktop app, create a folder for your notes first (or pick one), and add it to the task before running a command. Setup will use that folder.

## Commands

Type `/fieldnotes` in the message box to see them all. In Claude Code the full form includes the plugin name, for example `/fieldnotes:fieldnotes-checkin`.

| Command | What it does |
|---|---|
| `/fieldnotes-setup` | Create or change your folder, role, categories, and reminder. Can import check-ins from the original weekly-checkin skill. |
| `/fieldnotes-note` | Save a quick note for the current week. |
| `/fieldnotes-checkin` | Weekly guided check-in. Saves an entry with highlights and skill tags. |
| `/fieldnotes-recall` | "When did I...?" Searches your history. |
| `/fieldnotes-review` | 1:1, quarterly, annual, or custom review prep. |
| `/fieldnotes-resume` | Resume bullets with impact and source weeks. |
| `/fieldnotes-growth` | Skill trends over time, with an optional chart. |
| `/fieldnotes-receipts` | Evidence of your good work, for rough days. |
| `/fieldnotes-achievement` | A just-for-fun bonus: your week as snarky "New Achievement!" announcements. |

## Privacy

Your entries are files on your computer, in a folder you choose. Nobody else can see them unless you share them. Conversations with Claude happen in whatever Claude account you're signed into. If that's a company-provided Claude plan, your organization's settings may give admins access to conversation history. If that matters to you, use a personal account.

## What an entry looks like

See [references/entry-format.md](references/entry-format.md).

## Roles

Fieldnotes ships with role packs for software engineers, engineering managers, product managers, designers, data and analytics, and consultants, plus a general pack. Any other role can describe its job during setup, and Claude drafts categories for it. To add a pack, add a markdown file to `references/category-packs/` and open a pull request.

## Development

    claude plugin validate . --strict
    claude plugin eval . --scaffold --trust-plugin --allow-tools Write Edit Bash --no-publish

Evals use synthetic fixtures in `evals/fixtures/`. Never commit real entries.

## License

MIT
