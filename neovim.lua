-- ============================================================
-- LIFELESS — Neovim colorscheme (via aether.nvim)
-- Author: @the2middlechild
-- Synchronized with colors.toml.
-- Teal/mint/green palette on deep slate.
-- ============================================================

return {
	{
		"bjarneo/aether.nvim",
		branch   = "v3",
		name     = "aether",
		priority = 1000,
		opts = {
			colors = {
				-- ── Backgrounds ──────────────────────────────────
				bg         = "#1a1f2b",   -- deep slate canvas
				dark_bg    = "#12151e",   -- statusline, inactive panes
				darker_bg  = "#0b0d13",   -- float bg, borders
				lighter_bg = "#242b3a",   -- sidebars, popup bg

				-- ── Foregrounds ──────────────────────────────────
				fg         = "#dcd6ce",   -- pale sage-white body text
				dark_fg    = "#948e91",   -- comments, secondary text
				light_fg   = "#e8e3da",   -- slightly brighter body
				bright_fg  = "#f5f1e8",   -- headings, selected text
				muted      = "#767084",   -- line numbers, fold marks

				-- ── Syntax hue palette ───────────────────────────
				red        = "#c26a5a",   -- errors — muted terracotta
				yellow     = "#d9b676",   -- warnings — warm ochre
				orange     = "#e0916a",   -- numbers, attributes — coral
				green      = "#7a9a8a",   -- strings — sage
				cyan       = "#6a9aa5",   -- types — teal
				blue       = "#6f88a8",   -- keywords — steel blue
				purple     = "#a683a0",   -- special — dusty mauve
				brown      = "#8a6a52",   -- umber

				-- ── Bright variants ──────────────────────────────
				bright_red    = "#d9836f",
				bright_yellow = "#ecc98c",
				bright_green  = "#96b8a4",
				bright_cyan   = "#85b7c0",
				bright_blue   = "#8ba5c4",
				bright_purple = "#c29ebd",

				-- ── Semantic roles ───────────────────────────────
				accent               = "#26AA8B",   -- teal accent
				cursor               = "#0E8162",   -- cursor color
				foreground           = "#dcd6ce",
				background           = "#1a1f2b",
				selection            = "#2c3547",
				selection_foreground = "#f5f1e8",
				selection_background = "#2c3547",
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "aether",
		},
	},
}
