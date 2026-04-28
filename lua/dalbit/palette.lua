-- dalbit · palette (single source of truth)
-- Four variants share the same slot names so highlight groups stay variant-agnostic.
-- Mirrors ~/playground/colortheme/dalbit/palette.toml.
--
-- Each palette table carries `is_mono` / `is_light` flags that groups.lua reads
-- to apply emphasis (bold/italic) where chromatic differentiation is missing.

local M = {}

-- ----------------------------------------------------------------------------
-- DARK · the canonical dalbit
-- ----------------------------------------------------------------------------
local DARK = {
	is_mono = false,
	is_light = false,

	-- surfaces (pure neutral gray)
	bg0 = "#151515",
	bg_soft = "#1c1c1c",
	bg1 = "#222222",
	bg2 = "#2c2c2c",
	bg3 = "#383838",
	bg4 = "#474747",

	-- foregrounds (cool off-white, B > R)
	fg0 = "#ced0d6",
	fg1 = "#b8bac0",
	fg2 = "#909298",
	fg_mute = "#66686e",

	-- accents
	red = "#e04a2a",
	red_bright = "#ff6a42",
	orange = "#bc6838",
	yellow = "#d9a82e",
	yellow_br = "#edc14a",
	green = "#74bc42",
	green_dim = "#569828",
	teal = "#4fa8a0",
	teal_br = "#70c8bc",
	blue = "#7eb0cc",
	rose = "#d07878",
	comment = "#9e988c",

	-- signals
	diff_add_bg = "#1e2a1a",
	diff_add_fg = "#74bc42",
	diff_del_bg = "#2a1817",
	diff_del_fg = "#e04a2a",
	diff_chg_bg = "#24221a",
	diff_chg_fg = "#d9a82e",
	search_bg = "#403820",
	search_fg = "#ffe08a",
	cursor_line = "#1d1d1d",

	-- ANSI extras (terminal_color_12 / 13)
	bright_blue = "#8cc0de",
	bright_magenta = "#de8a88",
}

-- ----------------------------------------------------------------------------
-- MONO · grayscale syntax · one warm-red error accent
-- ----------------------------------------------------------------------------
local MONO = {
	is_mono = true,
	is_light = false,

	-- surfaces · unchanged from dark
	bg0 = "#151515",
	bg_soft = "#1c1c1c",
	bg1 = "#222222",
	bg2 = "#2c2c2c",
	bg3 = "#383838",
	bg4 = "#474747",

	-- foregrounds · unchanged from dark
	fg0 = "#ced0d6",
	fg1 = "#b8bac0",
	fg2 = "#909298",
	fg_mute = "#66686e",

	-- accents · collapsed onto fg ladder. only red survives.
	red = "#c47868", -- ★ errors
	red_bright = "#d68878",
	orange = "#ced0d6", -- → fg0 (keywords, bold via styling)
	yellow = "#b8bac0", -- → fg1 (types, bold)
	yellow_br = "#ced0d6", -- → fg0 (function names)
	green = "#a8aab0", -- → mid-gray (strings, italic)
	green_dim = "#909298", -- → fg2 (ok / NORMAL)
	teal = "#b8bac0", -- → fg1 (numbers)
	teal_br = "#ced0d6",
	blue = "#b8bac0", -- → fg1 (fields)
	rose = "#a8aab0", -- → mid-gray (self/macros, italic)
	comment = "#9295a0", -- comments — lifted to ~6.3:1 contrast (was fg_mute, only 3.5:1)

	-- signals · faint chromatic tints, fg shifted ~10 units toward tint
	diff_add_bg = "#1a201a",
	diff_add_fg = "#aab4a4",
	diff_del_bg = "#201818",
	diff_del_fg = "#b4a8a0",
	diff_chg_bg = "#1e1d18",
	diff_chg_fg = "#b4ac98",
	search_bg = "#3a3838",
	search_fg = "#ffffff",
	cursor_line = "#1d1d1d",

	bright_blue = "#a8b0b8",
	bright_magenta = "#b8a0a0",
}

-- ----------------------------------------------------------------------------
-- LIGHT · neutral-cool light surfaces · darkened warm accents (NO ivory)
-- ----------------------------------------------------------------------------
local LIGHT = {
	is_mono = false,
	is_light = true,

	-- surfaces · neutral cool (B>R by ~4) — explicitly NOT ivory/cream
	bg0 = "#f1f3f5",
	bg_soft = "#e9ebef",
	bg1 = "#dfe1e6",
	bg2 = "#d0d2d8",
	bg3 = "#b8bac0",
	bg4 = "#888a90",

	-- foregrounds · dark cool grays
	fg0 = "#1a1c22",
	fg1 = "#2e3038",
	fg2 = "#5a5c64",
	fg_mute = "#80828a",

	-- accents · v2 — darkened to clear ~6:1 against bg0 (was 3.5–5:1).
	-- yellow_br especially: was #b88828 (3.6:1, sub-AA) → #806010 (~5.3:1).
	-- yellow:        was #a07000 (4.7:1)              → #6e4c00 (~7.1:1).
	red = "#b02410",
	red_bright = "#c83820",
	orange = "#803a10",
	yellow = "#6e4c00",
	yellow_br = "#806010",
	green = "#2a5e08",
	green_dim = "#1c4406",
	teal = "#1a5044",
	teal_br = "#266660",
	blue = "#0e3a64",
	rose = "#7a3030",
	comment = "#5e5848",

	-- signals · light tinted bgs (fg darkened to match v2 accents)
	diff_add_bg = "#dcefcd",
	diff_add_fg = "#1c4406",
	diff_del_bg = "#fadccd",
	diff_del_fg = "#80200a",
	diff_chg_bg = "#f4e8c2",
	diff_chg_fg = "#5a4008",
	search_bg = "#ffe580",
	search_fg = "#1a1c22",
	cursor_line = "#e6e8ec",

	bright_blue = "#366c8a",
	bright_magenta = "#9a5050",
}

-- ----------------------------------------------------------------------------
-- MONO_LIGHT · grayscale syntax on neutral-cool light · warm-red errors only
-- ----------------------------------------------------------------------------
local MONO_LIGHT = {
	is_mono = true,
	is_light = true,

	-- surfaces · same as light
	bg0 = "#f1f3f5",
	bg_soft = "#e9ebef",
	bg1 = "#dfe1e6",
	bg2 = "#d0d2d8",
	bg3 = "#b8bac0",
	bg4 = "#888a90",

	-- foregrounds · same as light
	fg0 = "#1a1c22",
	fg1 = "#2e3038",
	fg2 = "#5a5c64",
	fg_mute = "#80828a",

	-- accents · collapsed onto fg ladder. only warm red survives.
	red = "#a8401e", -- ★ errors
	red_bright = "#c45028",
	orange = "#1a1c22", -- → fg0 (keywords, bold)
	yellow = "#2e3038", -- → fg1 (types, bold)
	yellow_br = "#1a1c22", -- → fg0 (function names)
	green = "#44464c", -- → mid-gray (strings, italic)
	green_dim = "#5a5c64", -- → fg2 (ok)
	teal = "#2e3038", -- → fg1 (numbers)
	teal_br = "#1a1c22",
	blue = "#2e3038", -- → fg1 (fields)
	rose = "#44464c", -- → mid-gray (self/macros, italic)
	comment = "#5e606a", -- comments — lifted to ~5.7:1 contrast (was fg_mute, only 4.5:1)

	-- signals · barely-tinted light bgs
	diff_add_bg = "#e8efe0",
	diff_add_fg = "#3a4828",
	diff_del_bg = "#f4e6dc",
	diff_del_fg = "#5a3024",
	diff_chg_bg = "#efe8d2",
	diff_chg_fg = "#544428",
	search_bg = "#d0d2d8", -- pure neutral gray (no warm yellow)
	search_fg = "#1a1c22",
	cursor_line = "#e6e8ec",

	bright_blue = "#6e7e90",
	bright_magenta = "#8e7070",
}

-- ----------------------------------------------------------------------------
-- public API
-- ----------------------------------------------------------------------------

---Return a fresh copy of the palette for the given variant.
---@param variant? "dark"|"mono"|"light"|"mono-light"
function M.get(variant)
	variant = variant or "dark"
	if variant == "dark" then
		return vim.deepcopy(DARK)
	elseif variant == "mono" then
		return vim.deepcopy(MONO)
	elseif variant == "light" then
		return vim.deepcopy(LIGHT)
	elseif variant == "mono-light" or variant == "mono_light" then
		return vim.deepcopy(MONO_LIGHT)
	else
		error("dalbit: unknown variant '" .. tostring(variant) .. "'")
	end
end

-- back-compat: callers like `require("dalbit.palette").bg0` continue to read
-- the canonical (dark) palette directly off the module.
for k, v in pairs(DARK) do
	M[k] = v
end

return M
