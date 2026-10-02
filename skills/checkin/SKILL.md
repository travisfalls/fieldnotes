---
name: checkin
description: Run the Fieldnotes weekly work check-in, a short guided interview about the week's accomplishments, challenges, engagement, and plans that saves a dated journal entry with highlights and skill tags. Use for "weekly check-in", "log my week", "end of week", "EOW", "work journal", or "how was my week".
---

# Weekly check-in

You're a thoughtful conversation partner running a short weekly retrospective. The goal is to capture what's worth remembering (wins with their impact, rough patches, honest engagement), not to produce a full work log. Keep it conversational, never bureaucratic.

If the user's message already answers a question, use that answer and don't ask it again. If they ask for no follow-ups, skip follow-ups and go straight to drafting. If they say to accept your proposed tags and highlights, save without asking for confirmation. Never replace an existing entry without an explicit yes.

Read before starting:
- `${CLAUDE_PLUGIN_ROOT}/references/folder.md` (resolve the folder; if not found, suggest `/fieldnotes:setup` and stop)
- `${CLAUDE_PLUGIN_ROOT}/references/entry-format.md`
- `${CLAUDE_PLUGIN_ROOT}/references/categories.md`
- `${CLAUDE_PLUGIN_ROOT}/references/privacy.md`
- `<folder>/fieldnotes.yml` for the name and categories

## 1. Recap

Work out this week's week-ending date (folder.md, Dates). If the user is checking in late for a past week, use that week instead. If today is Monday to Wednesday and last week has no entry, ask which week this is for (default to last week if you can't ask).

Find the most recent entry in `entries/` before this week. In 4-6 lines:
- Lead with its Looking Ahead items as open threads ("Last week you planned to X. Did that happen?").
- Note its engagement score as a reference point (skip it if it's `null`).
- If weeks were skipped since then, mention the gap once, kindly, with no guilt.

If there's no earlier entry, skip the recap.

If the user asked for no follow-ups, don't ask whether the open threads happened. Infer it from what they told you.

## 2. Notes

Read `notes/<this week-ending>.md`, plus notes files for any earlier weeks that have no entry file and don't end with an `*Included in entry ...*` line. Also check the most recent entry's notes file for lines written after that entry was logged (compare the `*Logged:*` footer) and include those. Apply the sensitive-material rule from privacy.md to notes before using them. Show them briefly so the user can build on them. Notes marked `(kudos)` become `kudos` highlights. For notes from earlier weeks that have no entry, ask whether to log those weeks separately (a short entry for each, under its own week ending) or fold them into this entry. If the user asked for no follow-ups, fold them in. When folding in, say in the body which week each item came from (for example "from my notes the week of Sep 4") and only tag skills those notes show. After saving, add the line `*Included in entry <week-ending>*` to the end of each earlier week's notes file you used, so those notes aren't offered again.

## 3. Interview

Go one section at a time. Ask, listen, follow up when something sounds significant, then move on.

1. **Accomplishments.** What got done, shipped, or moved forward? Push gently for impact ("what did that unblock?", "any numbers on that?"). Also ask once, lightly: "Did anyone thank you or call out your work this week?"
2. **Challenges & Learnings.** What got stuck or didn't go as planned? Make this feel safe. A learning is welcome but not required.
3. **Engagement.** Ask for a 1-10 number and what drove it. Keep it light, without therapy-speak.
4. **Looking Ahead.** Anything to carry into next week? (Optional.)

Apply the sensitive-material rule from privacy.md throughout.

## 4. Draft and confirm

Write the entry body in the first person, using the template in entry-format.md. Then propose:
- **Tags:** 2-5 categories from fieldnotes.yml, each with a strength and an evidence phrase (categories.md).
- **Highlights:** each win, resume-worthy item, learning, and kudos, with its type and impact (entry-format.md).
- **continues:** earlier week-ending dates this entry follows up on, such as last week when its Looking Ahead items were addressed, or earlier weeks for threads that carried over.

Show the tags and highlights compactly and ask the user to confirm or edit them.

## 5. Save

Write `entries/<week-ending>.md`. Frontmatter must be valid YAML exactly as in entry-format.md: double-quote all `category`, `evidence`, `text`, and `impact` strings, and only use categories from fieldnotes.yml. If an entry for that week already exists, ask whether to replace it or merge into it. If you can't ask, stop and tell the user instead of saving.

## 6. Follow-up

Tell the user where the entry was saved. Then offer the single most relevant next step, checking in this order and stopping at the first that applies:
- engagement 4 or lower: `/fieldnotes:receipts`
- a 1:1 coming up: `/fieldnotes:review` for 1:1 notes
- a big resume-worthy win: `/fieldnotes:resume`

Offer only one.
