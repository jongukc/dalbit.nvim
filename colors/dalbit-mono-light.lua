-- dalbit-mono-light colorscheme entry point.
-- Invoked by Neovim when the user runs `:colorscheme dalbit-mono-light`.
-- Grayscale syntax on neutral-cool light · warm-red errors only.

for _, m in ipairs({ "dalbit", "dalbit.palette", "dalbit.groups" }) do
	package.loaded[m] = nil
end

require("dalbit").load("mono-light")
