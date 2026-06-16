# MSP Tutor Registration

A live, first-come-first-served tool for recruiting and allocating MSP course
tutors. Prospective tutors pick the course tutorial group(s) they want; once a
group is claimed it disappears for everyone, so no group is ever double-booked.
The MSP office manages everything from a private dashboard.

Built to sit alongside the BTR project tool, with the same MSP look and feel.

---

## What's here

```
app/
├─ index.html            Landing page (what tutoring is, who's eligible)
├─ register.html         Tutor flow: browse → pick groups → confirm (the core)
├─ admin.html            Office dashboard (login, registrations, manage groups)
├─ assets/
│   ├─ config.js         ← THE ONE FILE YOU EDIT (your Supabase keys)
│   ├─ styles.css        Shared MSP styling
│   ├─ supabase.js       Data layer (live Supabase + offline preview)
│   └─ demo-data.js      Auto-generated catalogue for offline preview
└─ supabase/
    ├─ schema.sql        Database tables, atomic claim, privacy rules
    └─ seed.sql          Courses & groups generated from the source spreadsheet
```

## Preview it right now (no setup)

Open `app/index.html` in a browser. With no Supabase configured it runs in
**preview mode**: the real 2026/2027 catalogue is shown, but live sign-ups are
off. Good for showing Linzi/Panos the look and flow.

> A tiny local web server avoids browser file-access quirks:
> `cd app && python3 -m http.server 8000` → visit http://localhost:8000

---

## Going live (≈15 minutes)

### 1. Create the database
1. Sign up at [supabase.com](https://supabase.com) and create a project.
   **Choose an EU region (e.g. Frankfurt)** so tutor data stays in the EU.
2. In the project, open **SQL Editor** and run, in order:
   - the contents of `supabase/schema.sql`
   - the contents of `supabase/seed.sql`

### 2. Make yourself an admin
In the SQL Editor run (use your real MSP email):
```sql
insert into admin_user (email) values ('s.dufour@maastrichtuniversity.nl');
```
Add as many office emails as you like. Only these can see registrations.

### 3. Connect the site
In **Project Settings → API**, copy the **Project URL** and the **anon public**
key into `app/assets/config.js`. (The anon key is safe to publish — the
database's security rules stop it from ever reading tutor names/emails.)

### 4. Publish
Any static host works. Easiest is **GitHub Pages**: push this repo, then in
the repo's *Settings → Pages* serve from the `app/` folder. Send the resulting
`…/register.html` link to candidate tutors.

> Add `…/admin.html` to your bookmarks — that's the office dashboard. Sign in
> with a one-time link emailed to your address (no password).

---

## How "first come, first served" is guaranteed

Claiming runs inside one database function (`claim_groups`) that **locks** each
chosen group, re-checks it is still open, and only then records the
registration — all in a single transaction. If two people submit the same group
in the same instant, exactly one wins; the other is told to pick again. Picking
several groups is all-or-nothing.

## Privacy by design

- The public site can read **availability only** (counts, open/closed).
- Tutor names, emails and notes live in a table the public **cannot read at
  all** — enforced by PostgreSQL Row-Level Security, not just the UI.
- Sign-ups are inserted only through the locked claim function, never directly.
- Data can be EU-hosted and deleted at any time.

## Where the catalogue data comes from

Tutorial groups, days and times come from `Info for tutor registration tool.xlsx`.
The full course information shown on the register page — coordinator + email,
level, prerequisites, co-requisites, recommended courses, objectives,
description, instructional format, assessment, literature and the generative-AI
policy — is pulled from `2026-2027 MSP Course Catalogue April.pdf`. The flat
fields live in their own columns; everything else is stored in a `details`
JSONB column on `course`. Both feed `seed.sql` and the offline preview data.

## Updating the catalogue for a new year

Re-generate `seed.sql` from a new spreadsheet (see the parser used to create
it), or edit courses/groups directly from the **Groups & capacity** section of
the admin dashboard. Re-running `seed.sql` rebuilds the catalogue and re-seeds
the pre-assigned tutors; it leaves live registrations untouched.

## Admin dashboard at a glance

- Open / close registration for everyone (with an optional banner message).
- Live stats: groups filled vs open, confirmed registrations, distinct tutors.
- Searchable, filterable table of every registration; **export to CSV**.
- Per-group controls: change how many tutors a group needs, open/close a group,
  or **release** a tutor (which instantly reopens their group).
