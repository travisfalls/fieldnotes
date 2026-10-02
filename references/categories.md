# Categories and tagging

## Where categories come from

`fieldnotes.yml` holds the user's category list. Only tag with categories from that list.

Starter lists live in `${CLAUDE_PLUGIN_ROOT}/references/category-packs/`. Each file is one role pack:

| File | Pack |
|---|---|
| software-engineer.md | Software Engineer |
| engineering-manager.md | Engineering Manager |
| product-manager.md | Product Manager |
| designer.md | Designer |
| data-analytics.md | Data & Analytics |
| consultant.md | Consultant (a context pack, meant to stack with a role pack) |
| general-professional.md | General Professional |

When combining packs, merge categories with the same name and keep the first description.

## Custom categories

If no pack fits, draft 8–12 categories from the user's description of their job. Model the level of detail on the packs: each category is a skill area someone could grow in, named in 1–4 words, with a one-line description. Always include Leadership & Mentoring and Learning & Growth unless the list already covers them. Set `role_packs: [custom]`.

## Tagging an entry

- Tag only what the entry shows the user actually did that week.
- Pick the strength honestly: 1 = touched it, 2 = did meaningful work, 3 = led it or owned the outcome.
- Evidence is a short phrase from the entry, not a summary.
- Usually 2–5 tags per entry. Don't tag a category just because it was mentioned.
