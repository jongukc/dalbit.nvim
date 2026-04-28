-- dalbit-mono colorscheme entry point.
-- Invoked by Neovim when the user runs `:colorscheme dalbit-mono`.
-- Grayscale syntax · one warm-red error accent · low strain.

for _, m in ipairs({ "dalbit", "dalbit.palette", "dalbit.groups" }) do
	package.loaded[m] = nil
end

require("dalbit").load("mono")
