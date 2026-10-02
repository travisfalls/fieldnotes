# Fieldnotes file formats

## fieldnotes.yml

```yaml
schema: 1
name: Jordan
reminder:
  enabled: true
  day: friday            # monday..sunday
  time: "14:00"          # 24-hour local time
  method: calendar       # scheduled-task | calendar
role_packs: [software-engineer, consultant]   # pack file names, or [custom]
categories:
  - name: "Architecture"
    description: "System design, technical direction, trade-off decisions"
```

Double-quote every category `name` and `description`, so a colon or other punctuation can't break the file.

## Weekly entry: entries/YYYY-MM-DD.md

Frontmatter first, then the readable entry. Always double-quote every `category`, `evidence`, `text`, and `impact` string. Use `[]` for an empty list.

```markdown
---
schema: 1
week_ending: 2026-09-25
engagement: 7
tags:
  - category: "Architecture"
    strength: 2
    evidence: "Designed the retry strategy for the upload queue"
highlights:
  - type: resume
    text: "Redesigned retry logic for failed uploads"
    impact: "Cut failed uploads from ~40/week to near zero"
  - type: kudos
    text: "Client lead thanked me for the demo walkthrough"
    impact: ""
continues: [2026-09-18]
---

# Week of September 21–25, 2026

## Accomplishments
- ...

## Challenges & Learnings
- ...

## Engagement Check-in
**Level:** 7/10
...

## Looking Ahead
- ...

---
*Logged: 2026-09-25 14:12*
```

Field rules:

- `engagement`: an integer 1-10, or `null` when unknown (only from migration). Skills that use engagement skip `null` values.
- `tags[].category` must exactly match a `name` in `fieldnotes.yml`.
- `tags[].strength`: 1 = touched it, 2 = did meaningful work, 3 = led it or owned the outcome.
- `tags[].evidence`: a short phrase from this entry that justifies the tag.
- `highlights[].type`: `win` (went well), `resume` (a win with enough weight and impact for a resume), `learning` (a skill or lesson picked up), or `kudos` (recognition from someone else).
- `highlights[].impact`: the outcome or effect, with numbers when the user gave them. Use `""` when there isn't one.
- `continues`: earlier week-ending dates this entry follows up on. Omit it or use `[]` if there are none.
- Write the entry body in the first person, as if the user wrote it.

## Notes file: notes/YYYY-MM-DD.md

```markdown
# Notes for week ending 2026-09-25

- 2026-09-22 10:05 Fixed the query timeout in the status dashboard
- 2026-09-24 16:30 (kudos) Architect said the ADR was the clearest they'd read
```

One line per note: `- YYYY-MM-DD HH:MM <text>`, with `(kudos)` after the time when the note is recognition from someone else. The time is optional: if it isn't known, write `- YYYY-MM-DD <text>` (and `(kudos)` after the date). Never guess a time.

When a check-in folds an earlier week's notes into an entry, the check-in adds a last line `*Included in entry YYYY-MM-DD*` to that notes file, so those notes aren't offered again. Don't add, remove, or reword other lines.

## Reading entries safely

If an entry's frontmatter doesn't parse, read the body text instead, mention the file name to the user once, and keep going.
