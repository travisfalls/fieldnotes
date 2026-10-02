---
name: resume
description: Turn the user's Fieldnotes work journal into resume bullets with real impact and source weeks, optionally tailored to a target role. Use for "resume bullets", "update my resume", "LinkedIn accomplishments", or "what should go on my resume".
argument-hint: "[period] [target role or focus]"
---

# Resume bullets

Read `${CLAUDE_PLUGIN_ROOT}/references/lookback.md` and follow it. Never include anything the user asked to keep out of their files or reports (`${CLAUDE_PLUGIN_ROOT}/references/privacy.md`).

1. Work out the period (default: the last 12 months) and any target role or focus from $ARGUMENTS or the user's message. Include entries whose week-ending date falls in the period, and nothing outside it.
2. Collect `resume` and `win` highlights in the period, with their impact and weeks. Use entry bodies only to clarify context. Never add numbers or outcomes that aren't in the entries. Also read notes files in the period. A notes line can support a bullet or the 'Also worth mentioning' list, cited as (notes, week ending YYYY-MM-DD), but never supplies a metric the user didn't write. Keep qualifiers from the source, such as "about" or "in staging", so a bullet never overstates the result.
3. Merge highlights about the same piece of work across weeks into one bullet, crediting the final outcome and citing every source week.
4. Write each bullet as: strong action verb + what you did + impact. One line, past tense, no "I". Example: `- Diagnosed and fixed a flaky CI integration stage, raising deploy success from 70% to 98% (2026-05-08, 2026-05-15, 2026-05-22)`
5. Order by strength of impact. If there's a target role, lead with the most relevant bullets and leave out ones that don't fit (fewer than 4 bullets is fine for a narrow target).
6. Aim for 4-8 bullets. Add a short "Also worth mentioning" list for good items that didn't make the cut, citing weeks the same way as bullets.
7. Save to `reports/<today>-resume.md` with a heading naming the period and focus, show the bullets in chat, and give the file name.

Cite weeks as `YYYY-MM-DD` week-ending dates of entry files. If a point rests only on a notes file, cite it as "(notes, week ending YYYY-MM-DD)", never a bare date. If the period has few entries, say so up front.
