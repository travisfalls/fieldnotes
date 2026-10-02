---
name: review
description: Prepare for a 1:1, quarterly review, annual review, or self-assessment from the user's Fieldnotes work journal, covering wins with impact, challenges and learnings, growth, and themes, with every point tied to a specific week. Use for "prep for my review", "1:1 notes", "self-review", "performance review", or "what did I do this quarter".
argument-hint: "[1:1 | quarterly | annual | custom] [date range]"
---

# Review prep

Turn the user's entries into review material they can trust and paste. Read `${CLAUDE_PLUGIN_ROOT}/references/lookback.md` and follow it.

## 1. Type and range

Work out the type and date range from $ARGUMENTS or the user's message. Ask only if you really can't tell.

| Type | Default range | Report file |
|---|---|---|
| 1:1 | the last 2 weeks, or since the last `*1on1*` report | `reports/<today>-1on1.md` |
| quarterly | the named calendar quarter, or the current one | `reports/<YYYY>-Q<N>-review.md` |
| annual | the calendar year | `reports/<YYYY>-annual-review.md` |
| custom | the dates given | `reports/<start>_to_<end>-review.md` |

Include entries whose week-ending date falls in the range.

## 2. Gather

Start from confirmed highlights and tags in frontmatter. Use entry bodies for context, especially Challenges & Learnings. Include notes from weeks with no entry, and notes lines written after a week's entry was logged, cited as "(notes, week ending YYYY-MM-DD)", never as a bare date. If the range has few entries, say so up front (lookback.md, rule 5).

## 3. Write

**1:1:** a skimmable list a manager can read in 30 seconds. Use up to 3 short sections: Wins, Blockers or asks, Coming up. Under about 150 words. Cite weeks inline.

**Quarterly, annual, or custom:**
- **Summary:** 2–3 sentences on the period's main story.
- **Key wins:** each with impact and the week it happened.
- **Challenges & what I learned:** honest, including setbacks, with what changed afterward. Don't drop hard weeks.
- **Growth:** categories that grew, using tag strengths over time.
- **Recognition:** kudos, with weeks.
- **Looking ahead:** themes from recent Looking Ahead sections.

Write in the first person so the user can paste it. Cite weeks inline as `(2026-07-31)`. Never cite a week without an entry file.

## 4. Save and share

Save the report to the file from the table and show it in chat (or a summary of it, if it's long). Tell the user the file name.
