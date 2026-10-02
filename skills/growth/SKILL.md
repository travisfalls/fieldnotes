---
name: growth
description: Show how the user's skills have grown over time from their Fieldnotes work journal, covering which skill areas grew or faded, the engagement trend, and evidence from specific weeks, with an optional visual chart. Use for "skill growth", "how have I grown", "growth report", "skill trends", or "what am I getting better at".
argument-hint: "[period]"
---

# Skill growth

Read `${CLAUDE_PLUGIN_ROOT}/references/lookback.md` and follow it.

1. **Period.** From $ARGUMENTS or the user's message. Default: the last 3 months. Use monthly buckets (`YYYY-MM`) for periods up to 12 months, and quarterly buckets (`YYYY-QN`) for longer ones.
2. **Data.** From each entry's frontmatter in the period, collect tags (category and strength), engagement, and evidence. For a malformed entry, use its body for engagement and skip its tags. If an entry has `engagement: null`, leave it out of the engagement series and chart. Notes-only weeks can add evidence, cited as "(notes, week ending YYYY-MM-DD)".
3. **Compute, per category:** total strength per bucket; first and last appearance; highest strength reached. Trend: `grew` if later buckets are clearly higher or the max strength rose, `faded` if the category dropped off or fell, otherwise `steady`. Look for "then vs. now" arcs: a category that first showed up as a `learning` highlight or strength 1 and later reached strength 3.
4. **Engagement:** the score for every week in order (skipping `null`), with any dips (4 or lower) and recoveries.
5. **Write `reports/<today>-growth.md`:**
   - Opening: 2–3 sentences on the biggest shifts.
   - **Grew:** each category with how it changed and 2–3 evidence quotes with weeks.
   - **Steady** and **Faded:** one line each.
   - **Engagement:** the trend, dips, and recoveries, with weeks.
   - If the history is short (under 12 weeks), state it in the opening sentence, for example "This covers 8 weeks, since late July."
6. **Chart (only if the user asked for it, or says yes when you offer):** read `${CLAUDE_PLUGIN_ROOT}/templates/growth-report.html`, replace the token `/*FIELDNOTES_DATA*/{}` with a single JSON object in the exact shape documented in the "Data shape" section below, and write it to `reports/<today>-growth.html`. Change nothing else in the template. Tell the user to open it in a browser.
7. Summarize the highlights in chat and give the file names. If you didn't make the chart, offer it in one line.

## Data shape

{"title": "Growth: <start> – <end>", "name": "<name>", "buckets": ["2026-04", ...], "categories": [{"name": "<category>", "values": [<sum of strengths per bucket>], "trend": "grew|steady|faded", "evidence": [{"week": "YYYY-MM-DD", "quote": "<evidence>"}]}], "engagement": [{"week": "YYYY-MM-DD", "score": <1-10>}]}

Include only categories with at least one tag in the period. `values` has one number per bucket. Use at most 3 evidence items per category. Write JSON with `"key": value` spacing as shown.
Only weeks with an entry file go in the HTML `evidence` (the chart links to ../entries/<week>.md). Notes-only citations stay in the markdown report.
Inside JSON strings, write `<` as `\u003c` so a quote can never close the script tag early.
`name` comes from fieldnotes.yml.
