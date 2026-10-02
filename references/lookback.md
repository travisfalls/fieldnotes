# Rules for looking back through entries

These apply to recall, growth, review, resume, and receipts.

1. Resolve the folder using `${CLAUDE_PLUGIN_ROOT}/references/folder.md`.
2. Read frontmatter first. List `entries/*.md`, read each file's frontmatter (tags, highlights, engagement, continues), and only read full entry bodies when you need detail the frontmatter doesn't have.
3. Every claim cites the week it came from, written as the week-ending date `YYYY-MM-DD`. If the evidence isn't in the files, it doesn't go in the output.
4. Never cite a week that has no entry file. Notes files can support a point, but cite them as "notes, week ending YYYY-MM-DD".
5. With sparse history, say so plainly ("only 3 weeks logged so far") instead of stretching thin evidence.
6. If an entry's frontmatter is malformed, use its body, mention the file name once, and keep going.
7. Respect what the user asks you to leave out, in the current conversation or in the files. Don't resurface anything they asked to keep out, and don't save things they said in passing (like what's getting to them) to a report unless they confirm.
8. Reports go in `reports/`. Use the file name the skill specifies. If that file already exists, don't overwrite it (users edit these): save under the same name with `-2` before the extension, or ask.
