# MSP Tutor Registration

A live, first-come-first-served web tool for recruiting and allocating tutors to
course tutorial groups at the **Maastricht Science Programme** (Faculty of Science
& Engineering, Maastricht University). Eligible PhD candidates, MSP alumni and
staff see which tutorial groups are open right now and claim one before anyone
else - when a group is claimed it disappears for everyone, so no group is ever
double-booked. The MSP office manages everything from a private dashboard.

**Live site:** https://beebzoo.github.io/Tutoring/

## Repository layout

```
.
├─ index.html        Root redirect -> /app/ (required by GitHub Pages)
├─ app/              The website (this is what gets deployed)
│   ├─ index.html        Landing page
│   ├─ register.html     Tutor flow: browse open groups -> pick -> confirm
│   ├─ admin.html        Office dashboard (login, registrations, manage groups)
│   ├─ assets/           config.js (your Supabase keys), styles, data layer, images
│   ├─ supabase/         schema.sql, seed.sql (catalogue), update-course-details.sql
│   └─ README.md         Full setup / "going live" guide  <- start here to deploy
├─ reference/        Curated 2026/27 context (catalogue, coordinators, schedule,
│                    procedures) + source files. Not deployed; for maintainers.
└─ .github/workflows/pages.yml   Auto-deploy: every push to main rebuilds the site
```

## Quick start

- **Not a coder? Want to change wording, dates, colours, or run the office dashboard?**
  see [`EDITING-INSTRUCTIONS.md`](EDITING-INSTRUCTIONS.md) (a plain-language guide).
- **Run it locally / deploy it:** see [`app/README.md`](app/README.md).
- **Course data & background context:** see [`reference/`](reference/).

## How it works (in one line)

Plain HTML/CSS/JS frontend on GitHub Pages; **Supabase** (Postgres, EU-hosted)
backend where claiming a group runs in a single locked database function so
simultaneous clicks can't double-book, and Row-Level Security keeps tutor
names/emails private (the public only ever sees availability counts).

## Deploying

The site auto-deploys: **any push to `main`** triggers
[`.github/workflows/pages.yml`](.github/workflows/pages.yml), which publishes
`index.html` + `app/` to GitHub Pages. Nothing else in the repo is served.
