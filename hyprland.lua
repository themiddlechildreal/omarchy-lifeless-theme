-- ============================================================
-- LIFELESS — Hyprland config (Omarchy / Lua format)
-- Author: @the2middlechild
-- Aesthetic: deep slate surfaces, muted teal borders,
--            greenish/teal with hints of blue.
-- ============================================================
--
-- HOW TO EDIT:
--   - Border colors  → change activeBorderColor / inactiveBorderColor
--   - Corner rounding → decoration.rounding (px)
--   - Window gaps    → general.gaps_in / gaps_out (px)
--   - Blur strength  → decoration.blur.size + passes
--   - Animation feel → hl.curve bezier points
--   - Animation speed → hl.animation speed
-- ============================================================

-- ── Border colors ────────────────────────────────────────────
-- Muted teal → deep slate: subtle, stays true to the muted
-- greenish aesthetic. The borders whisper rather than shout.
local activeBorderColor = {
  colors = { "#7EC2B2", "#294842"},
  angle  = 45,
}

-- Inactive: barely visible cool outline
local inactiveBorderColor = "#306953"

local shellSurfaces = "^(omarchy-bar|omarchy-menu|omarchy-image-selector|omarchy-emojis|omarchy-clipboard|omarchy-keyboard-panel|omarchy-notifications|omarchy-osd|omarchy-polkit|omarchy-reminders|omarchy-network-qr|omarchy-network-speedtest|omarchy-disk-speedtest|omarchy-speed-test)$"

-- ── Window layout and decoration ─────────────────────────────
hl.config({
  general = {
    col = {
      active_border   = activeBorderColor,
      inactive_border = inactiveBorderColor,
    },
    border_size = 3,    -- thin: keeps the clean, airy look
    gaps_in     = 2,
    gaps_out    = 4,
  },
  group = {
    col = {
      border_active   = activeBorderColor,
      border_inactive = inactiveBorderColor,
    },
  },
  decoration = {
    rounding       = 6,  -- generous rounding for a soft feel
    rounding_power = 2,
    --active_opacity = 0.92,
    --inactive_opacity = 0.82,
    blur = {
      enabled = true,
      size    = 6,    -- lighter blur: lifeless is muted, not heavy glass
      passes  = 2,
      noise = 0.03,
      contrast = 0.92,
      brightness = 0.86,
      vibrancy = 0.08,
      vibrancy_darkness = 0.74,
      ignore_opacity = true,
      new_optimizations = true,
    },
    shadow = {
      enabled        = true,
      range          = 4,    -- subtle shadow: doesn't dominate the light palette
      render_power   = 3,
      color          = "rgba(1a1f2bb5)",
      color_inactive = "rgba(12151ed8)",
    },
  },
  animations = {
    enabled = true,
  },
})

-- ── Bezier curves ─────────────────────────────────────────────
-- Calm, rolling curves — matches the still, quiet aesthetic.
hl.curve("stillSmooth", { type = "bezier", points = { { 0.24, 0.9 }, { 0.2, 1.0 } } })
hl.curve("stillSettle", { type = "bezier", points = { { 0.2,  1.0 }, { 0.3, 1.0 } } })
hl.curve("stillFade",   { type = "bezier", points = { { 0.18, 0.0 }, { 0.12, 1.0 } } })

-- ── Animations ───────────────────────────────────────────────

-- General window resize / move
hl.animation({ leaf = "windows",     enabled = true, speed = 5, bezier = "stillSmooth" })

-- Window opening: gentle pop-in
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 5, bezier = "stillSettle", style = "popin 8%" })

-- Window closing: soft shrink-out
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4, bezier = "stillFade",   style = "popin 82%" })

-- Dragging windows
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "stillSmooth" })

-- Border gradient
hl.animation({ leaf = "border",      enabled = true, speed = 6, bezier = "stillFade" })

-- Opacity transitions
hl.animation({ leaf = "fade",        enabled = true, speed = 5, bezier = "stillFade" })

-- Shell layers (bar, launcher, notifications)
hl.animation({ leaf = "layers",      enabled = true, speed = 5, bezier = "stillSettle", style = "slidefade" })
hl.animation({ leaf = "layersIn",    enabled = true, speed = 5, bezier = "stillSettle", style = "slidefade" })
hl.animation({ leaf = "layersOut",   enabled = true, speed = 4, bezier = "stillFade",   style = "fade" })

-- Workspace switching: smooth horizontal slide
hl.animation({ leaf = "workspaces",  enabled = true, speed = 4, bezier = "stillSmooth", style = "slidefade" })


hl.layer_rule({
  name = "lifeless-shell-blur",
  match = { namespace = shellSurfaces },
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.20,
})