# How to edit the MSP Tutor Registration website

A plain-language guide for the MSP office. **You do not need coding experience for the common changes.** When in doubt, stop and ask (or re-open the project in Claude Code and describe what you want in normal English).

---

## 1. The 30-second version

- The website is just a set of text files stored on **GitHub**.
- When you change a file on GitHub and **"commit"** (save) it, the live website updates itself automatically in about **1 to 2 minutes**.
- The list of tutors who signed up, and which groups are full, live in a separate database (**Supabase**). You manage those by **clicking buttons in the Office Dashboard**, not by editing files.

Useful links:
- Live website: https://beebzoo.github.io/Tutoring/
- The files (the "repo"): https://github.com/Beebzoo/Tutoring
- Office Dashboard: https://beebzoo.github.io/Tutoring/app/admin.html

---

## 2. The two parts, in plain words

- **GitHub** holds the website's pages and text (what people see). Editing here changes how the site looks and reads. Think of it as the **poster**.
- **Supabase** is the database (who signed up, which groups exist, who is an office admin). Think of it as the **sign-up sheet**. You rarely touch it directly; the Office Dashboard is your window into it.

---

## 3. Golden rules

- Small **text** changes are safe.
- Anything in the `supabase/` folder, the `config.js` keys, or the `<script>` code is **not** a beginner change. Ask for help (or ask Claude) first.
- After any change, check the live site a minute or two later (refresh with **Ctrl+Shift+R**).
- You can always undo (see section 7). Nothing is ever truly lost.

---

## 4. The easiest way to make a change (nothing to install)

Edit directly on GitHub:

1. Go to https://github.com/Beebzoo/Tutoring and sign in.
2. Open the `app` folder, then click the file you want (for example `index.html`).
3. Click the **pencil icon** near the top right ("Edit this file").
4. Make your change.
5. Scroll down and click the green **"Commit changes"** button.
6. Wait 1 to 2 minutes, then refresh the live site.

That is the whole process. On this site, **committing = publishing**.

> For bigger changes (especially the course list), the safest option is to open the project in **VS Code with Claude Code** and just ask it in plain English. It will make the change and publish it.

---

## 5. "I want to change..." (where and how)

### The words on the Home, Register, or Privacy page
- **File:** `app/index.html`, `app/register.html`, or `app/privacy.html`
- **How:** find the sentence and edit the words. Leave the `< >` tags alone (e.g. in `<p>Hello</p>`, only change `Hello`).

### The "Questions?" email, or the academic year shown in the header
- **File:** `app/assets/config.js`
- **How:** change the text inside the quotes on the `CONTACT_EMAIL` or `ACADEMIC_YEAR` line. Keep the quotes and the comma.

### The period dates (e.g. "31 August - 16 October 2026")
- **File:** `app/register.html` (use the browser's find, search for `PERIOD_DATES`)
- **How:** change the text inside the quotes. Keep the `P1:` and `P2:` labels exactly as they are.

### A colour, or the overall look
- **File:** `app/assets/styles.css` (the `:root` block at the very top)
- **How:** change a hex colour code such as `--accent:#E84E10;`. Change one thing at a time and check.

### The logos or the browser-tab icon
- **Folder:** `app/assets/img/` (files `um-fse-logo.png` and `msp-logo.png`)
- **How:** replace an image with a new one **using exactly the same file name**.

### The privacy statement wording
- **File:** `app/privacy.html`
- **How:** edit the text in the paragraphs. Keep it accurate, and check important wording with UM privacy.

### The courses, tutorial groups, days or times for a NEW semester
This is the big one, so read carefully:
- **A few small tweaks** (change a group's capacity, open or close a group): do it in the **Office Dashboard**, no code needed.
- **A whole new semester's course list:** this rebuilds the catalogue from a spreadsheet plus a database script. **Ask for help or use Claude for this.**
  - There is a **safe** script (`app/supabase/update-course-details.sql`) that updates course info (titles, coordinators, descriptions) and does **not** touch sign-ups.
  - The **full rebuild** script (`app/supabase/seed.sql`) **erases existing sign-ups**. Only run it before a cycle starts, or after exporting the sign-ups first.

---

## 6. Things you do in the Office Dashboard (no code at all)

**Sign in:** open https://beebzoo.github.io/Tutoring/app/admin.html, type your MSP email, and click the one-time sign-in link sent to your inbox. (Only allow-listed emails work.)

Once in, you can:
- **Open or close registration** for everyone, with an optional banner message.
- See **live stats** (groups filled vs open, number of registrations, number of tutors).
- See **every registration**, search and filter it, and **Export CSV** (opens in Excel).
- Per group: **change how many tutors it needs**, **open/close** it, or **release** a tutor (which instantly reopens that group).
- Read **website feedback** and export it.

**Add another office admin** (so a colleague can sign in):
- This is one line in Supabase. In Supabase go to **SQL Editor** and run:
  `insert into admin_user (email) values ('their.email@maastrichtuniversity.nl');`
- If you are not comfortable doing this, ask or use Claude.

---

## 7. Oops - how to undo

- Every change is saved in GitHub's history, so nothing is lost.
- On GitHub, open the file and click **"History"** to see previous versions, or simply ask Claude to "undo the last change".
- If the live site ever looks broken, undo the most recent commit and it will heal itself in 1 to 2 minutes.

---

## 8. Do NOT change these without help

- The `app/supabase/` folder (the `.sql` files) - that is the database setup.
- The `<script>` sections inside the pages, and the `.js` files in `app/assets/` (`supabase.js`, `ui.js`, `disciplines.js`, `feedback.js`) - that is the app's logic.
- The keys in `app/assets/config.js` (`SUPABASE_URL`, `SUPABASE_ANON_KEY`).

Changing these can stop sign-ups from working. Ask first.

---

## 9. Getting help

- Re-open the project in **Claude Code** and describe, in plain English, what you want changed. It can make the change and publish it for you.
- More technical detail: `README.md` and `app/README.md` in the repo.
- This guide is in the repo as `EDITING-INSTRUCTIONS.md`, and as a PDF in the Tutoring folder.

---

## 10. Mini-glossary

- **Repo:** the folder of website files on GitHub.
- **Commit:** saving a change on GitHub (on this site, that also publishes it).
- **Push:** sending changes from your own computer up to GitHub (only relevant if you edit locally).
- **Supabase:** the database service that stores the sign-ups.
- **Dashboard / admin:** the office page where you manage everything by clicking.
- **RLS:** the database security that keeps tutor names and emails private.
