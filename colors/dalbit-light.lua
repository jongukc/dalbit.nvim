-- dalbit-light colorscheme entry point.
-- Invoked by Neovim when the user runs `:colorscheme dalbit-light`.
-- Neutral-cool light surfaces (no ivory) · darkened warm accents.

for _, m in ipairs({ "dalbit", "dalbit.palette", "dalbit.groups" }) do
	package.loaded[m] = nil
end

require("dalbit").load("light")
