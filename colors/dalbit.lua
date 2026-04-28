-- dalbit colorscheme entry point.
-- Invoked by Neovim when the user runs `:colorscheme dalbit`.

-- Drop cached modules so a `:colo` after a plugin update picks up the new
-- palette immediately, without requiring a Neovim restart.
for _, m in ipairs({ "dalbit", "dalbit.palette", "dalbit.groups" }) do
	package.loaded[m] = nil
end

require("dalbit").load("dark")
