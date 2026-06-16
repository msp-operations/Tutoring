/* ==========================================================================
   CONFIGURE ME  —  the only file you normally need to edit.
   --------------------------------------------------------------------------
   1. Create a free project at https://supabase.com (choose an EU region,
      e.g. Frankfurt, so tutor data stays in the EU).
   2. In the Supabase dashboard go to:  Project Settings > API
   3. Copy the "Project URL" and the "anon public" key below.
   4. The anon key is SAFE to publish — it can only do what the database's
      Row-Level-Security rules allow (read availability; never read who
      registered). See app/supabase/schema.sql.

   Leave these as the placeholder values to run the site in offline PREVIEW
   mode (it shows the real catalogue but cannot take live registrations).
   ========================================================================== */
window.MSP_CONFIG = {
  SUPABASE_URL: "YOUR_SUPABASE_URL_HERE",
  SUPABASE_ANON_KEY: "YOUR_SUPABASE_ANON_KEY_HERE",

  // Cosmetic only.
  ACADEMIC_YEAR: "2026 / 2027",
  CONTACT_EMAIL: "s.dufour@maastrichtuniversity.nl"
};
