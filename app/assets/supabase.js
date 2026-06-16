/* ==========================================================================
   MSP Tutor Registration — data layer (window.MSP)
   --------------------------------------------------------------------------
   One small API used by index / register / admin pages. It runs in two modes:
     • "live"    — talks to Supabase (real first-come-first-serve + admin).
     • "preview" — config not filled in yet; reads app/assets/demo-data.js so
                    the site is fully browsable offline. Claims are disabled.
   ========================================================================== */
(function () {
  const cfg = window.MSP_CONFIG || {};
  const configured =
    cfg.SUPABASE_URL && cfg.SUPABASE_ANON_KEY &&
    !cfg.SUPABASE_URL.includes("YOUR_") && !cfg.SUPABASE_ANON_KEY.includes("YOUR_");

  let client = null;
  if (configured && window.supabase) {
    client = window.supabase.createClient(cfg.SUPABASE_URL, cfg.SUPABASE_ANON_KEY);
  }

  const MSP = {
    mode: client ? "live" : "preview",
    isLive: !!client,
    client,
    config: cfg,
  };

  // ---- helpers ------------------------------------------------------------
  function shapeError(error) {
    const raw = (error && (error.message || error.error_description || String(error))) || "Unknown error";
    const code = (raw.split(":")[0] || "").trim();
    const detail = raw.includes(":") ? raw.split(":").slice(1).join(":").trim() : "";
    return { code, detail, raw };
  }

  // ---- public catalogue ---------------------------------------------------
  MSP.getSettings = async function () {
    if (!client) return { registration_open: true, banner_message: null };
    const { data } = await client.from("app_settings").select("*").eq("id", 1).maybeSingle();
    return data || { registration_open: true, banner_message: null };
  };

  // Returns: [{ id, code, title, period, department, groups:[{id,label,day1,...,capacity,claimed,is_open}] }]
  MSP.getCatalogue = async function () {
    if (!client) {
      // preview mode — synthesise ids from the bundled dataset
      const demo = window.MSP_DEMO_DATA || [];
      return demo.map((c, ci) => ({
        id: "demo-c-" + ci, code: c.code, title: c.title, period: c.period, department: c.department,
        groups: c.groups.map((g, gi) => ({
          id: "demo-g-" + ci + "-" + gi, label: g.label,
          day1: g.day1, start1: g.start1, end1: g.end1, day2: g.day2, start2: g.start2, end2: g.end2,
          capacity: g.capacity, claimed: g.claimed, is_open: g.is_open,
        })),
      }));
    }
    const [{ data: courses, error: ce }, { data: groups, error: ge }] = await Promise.all([
      client.from("course").select("*").order("sort"),
      client.from("tutorial_group").select("*").order("sort"),
    ]);
    if (ce) throw ce; if (ge) throw ge;
    const byCourse = {};
    (groups || []).forEach((g) => {
      (byCourse[g.course_id] = byCourse[g.course_id] || []).push({
        id: g.id, label: g.label, day1: g.day1, start1: g.start1, end1: g.end1,
        day2: g.day2, start2: g.start2, end2: g.end2,
        capacity: g.capacity, claimed: g.claimed_count, is_open: g.is_open,
      });
    });
    return (courses || []).map((c) => ({
      id: c.id, code: c.code, title: c.title, period: c.period,
      department: c.department, coordinator: c.coordinator, groups: byCourse[c.id] || [],
    }));
  };

  // ---- the claim (first-come-first-serve) ---------------------------------
  MSP.claim = async function (groupIds, info) {
    if (!client) {
      const e = new Error("PREVIEW_MODE"); e.code = "PREVIEW_MODE"; throw e;
    }
    const { data, error } = await client.rpc("claim_groups", {
      p_group_ids: groupIds,
      p_tutor_name: info.name,
      p_tutor_email: info.email || null,
      p_tutor_type: info.type || null,
      p_affiliation: info.affiliation || null,
      p_phone: info.phone || null,
      p_motivation: info.motivation || null,
    });
    if (error) { const s = shapeError(error); const e = new Error(s.raw); e.code = s.code; e.detail = s.detail; throw e; }
    return data;
  };

  // ---- realtime -----------------------------------------------------------
  MSP.subscribe = function (onChange) {
    if (!client) return () => {};
    const ch = client
      .channel("msp-live")
      .on("postgres_changes", { event: "*", schema: "public", table: "tutorial_group" }, onChange)
      .on("postgres_changes", { event: "*", schema: "public", table: "app_settings" }, onChange)
      .subscribe();
    return () => client.removeChannel(ch);
  };

  // ---- admin --------------------------------------------------------------
  MSP.admin = {
    async signIn(email) {
      if (!client) throw new Error("Supabase not configured.");
      const { error } = await client.auth.signInWithOtp({
        email, options: { emailRedirectTo: window.location.href },
      });
      if (error) throw error;
    },
    async signOut() { if (client) await client.auth.signOut(); },
    async session() {
      if (!client) return null;
      const { data } = await client.auth.getSession();
      return data.session;
    },
    onAuth(cb) { if (client) client.auth.onAuthStateChange((_e, s) => cb(s)); },
    async isAllowed() {
      if (!client) return false;
      const { data, error } = await client.rpc("is_admin");
      if (error) return false;
      return !!data;
    },
    async listRegistrations() {
      const { data, error } = await client
        .from("registration")
        .select("*, tutorial_group(label, course(code,title,period))")
        .order("created_at", { ascending: false });
      if (error) throw error;
      return data || [];
    },
    async updateGroup(id, patch) {
      const { error } = await client.from("tutorial_group").update(patch).eq("id", id);
      if (error) throw error;
    },
    async withdraw(regId) {
      const { error } = await client.from("registration").update({ status: "withdrawn" }).eq("id", regId);
      if (error) throw error;
    },
    async setRegistrationOpen(open, banner) {
      const patch = { registration_open: open };
      if (banner !== undefined) patch.banner_message = banner;
      const { error } = await client.from("app_settings").update(patch).eq("id", 1);
      if (error) throw error;
    },
  };

  // human-readable messages for claim failures
  MSP.CLAIM_MESSAGES = {
    GROUP_FULL: (d) => `Group ${d} was just taken by someone else. It has been removed from your selection — please pick another.`,
    GROUP_CLOSED: (d) => `Group ${d} has been closed by the office. Please pick another.`,
    REGISTRATION_CLOSED: () => "Registration is currently closed. Please contact the MSP office.",
    NAME_REQUIRED: () => "Please enter your full name.",
    NO_GROUPS: () => "Please select at least one tutorial group.",
    GROUP_NOT_FOUND: () => "One of the selected groups no longer exists. Please refresh and try again.",
    PREVIEW_MODE: () => "This is a preview. Connect Supabase (see app/assets/config.js) to take live registrations.",
  };

  window.MSP = MSP;
})();
