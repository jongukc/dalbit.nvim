-- dalbit · Neovim colorscheme
-- https://github.com/jongukc/dalbit.nvim

local M = {}

---@class DalbitConfig
---@field transparent?       boolean
---@field variant?           "dark"|"mono"|"light"|"mono-light"
---@field styles?            table<string, table>
---@field palette_overrides? table<string, string>
---@field overrides?         table|fun(c: table): table

---Default configuration. Users override with `require("dalbit").setup({...})`.
M.config = {
	transparent = false,
	variant = "dark",
	styles = {
		comments = { italic = true },
		keywords = { bold = true },
		functions = {},
		types = {},
		variables = {},
	},
	palette_overrides = {},
	overrides = nil,
}

local NAME_FOR = {
	dark = "dalbit",
	mono = "dalbit-mono",
	light = "dalbit-light",
	["mono-light"] = "dalbit-mono-light",
	mono_light = "dalbit-mono-light",
}

local VARIANT_FOR = {
	dalbit = "dark",
	["dalbit-mono"] = "mono",
	["dalbit-light"] = "light",
	["dalbit-mono-light"] = "mono-light",
}

---@param opts? DalbitConfig
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	-- hot-reload if any dalbit variant is already active
	local current = vim.g.colors_name
	if current and VARIANT_FOR[current] then
		M.load(VARIANT_FOR[current])
	end
end

---Load a dalbit variant. Called by `colors/dalbit*.lua` entry points and
---also reachable directly via `require("dalbit").load("mono")` etc.
---@param variant? "dark"|"mono"|"light"|"mono-light"
function M.load(variant)
	variant = variant or M.config.variant or "dark"
	local colors_name = NAME_FOR[variant] or "dalbit"

	if vim.g.colors_name then
		vim.cmd("highlight clear")
	end
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.o.background = (variant == "light" or variant == "mono-light" or variant == "mono_light") and "light" or "dark"
	vim.g.colors_name = colors_name

	-- palette (+ user color overrides)
	local palette = vim.tbl_extend(
		"force",
		require("dalbit.palette").get(variant),
		M.config.palette_overrides or {}
	)

	-- highlight groups
	local groups = require("dalbit.groups").get(palette, M.config)

	-- user-defined group overrides (table or function)
	local user = M.config.overrides
	if type(user) == "function" then
		groups = vim.tbl_deep_extend("force", groups, user(palette) or {})
	elseif type(user) == "table" then
		groups = vim.tbl_deep_extend("force", groups, user)
	end

	for group, spec in pairs(groups) do
		vim.api.nvim_set_hl(0, group, spec)
	end

	-- :terminal ANSI palette
	local ansi = {
		[0] = palette.bg0,
		[1] = palette.red,
		[2] = palette.green_dim,
		[3] = palette.yellow,
		[4] = palette.blue,
		[5] = palette.rose,
		[6] = palette.teal,
		[7] = palette.fg1,
		[8] = palette.bg4,
		[9] = palette.red_bright,
		[10] = palette.green,
		[11] = palette.yellow_br,
		[12] = palette.bright_blue,
		[13] = palette.bright_magenta,
		[14] = palette.teal_br,
		[15] = palette.fg0,
	}
	for i = 0, 15 do
		vim.g["terminal_color_" .. i] = ansi[i]
	end
end

return M
