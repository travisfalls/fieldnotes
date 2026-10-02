---
name: recall
description: Search the user's Fieldnotes work journal to answer "when did I..." questions, such as when something happened, when they worked on a topic, or what they did about a problem. Use when someone asks about their own past work, wants to find a week, or says "search my fieldnotes".
argument-hint: "[question]"
---

# Recall

Answer a question about the user's past work from their Fieldnotes entries. Don't write any files.

Read `${CLAUDE_PLUGIN_ROOT}/references/lookback.md` and follow it. The question is: $ARGUMENTS (or the user's message if that's empty).

1. Resolve the folder (folder.md). If it's not found, suggest `/fieldnotes:setup` and stop.
2. Search frontmatter first: tag evidence, highlight text and impact, and categories. Then search entry bodies and notes files with Grep, using the question's key terms plus close synonyms (for example "flaky deploys" → flaky, deploy, CI, pipeline, failing, release).
3. Follow `continues` links so a thread is reported from start to resolution.
4. Answer with:
   - The week or weeks, as week-ending dates (`2026-05-22`), oldest first, with one line each on what happened.
   - A short quote from the entry for the most relevant week.
   - The file names, so the user can open them. If a match is only in a notes file for a week with no entry, cite it as "(notes, week ending YYYY-MM-DD)".
5. If nothing matches, say so plainly. You can mention related entries if you label them as related, not as a match. Never imply the user did something the entries don't show.
