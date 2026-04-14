-- dalbit · palette (single source of truth)
-- See https://github.com/jongukc/dalbit for the unified colorscheme project.

return {
  -- surfaces (pure neutral gray, R = G = B)
  bg0     = "#151515",
  bg_soft = "#1c1c1c",
  bg1     = "#222222",
  bg2     = "#2c2c2c",
  bg3     = "#383838",
  bg4     = "#474747",

  -- foregrounds (cool off-white, B > R)
  fg0     = "#ced0d6",
  fg1     = "#b8bac0",
  fg2     = "#909298",
  fg_mute = "#66686e",

  -- accents
  red         = "#e04a2a",
  red_bright  = "#ff6a42",
  orange      = "#bc6838",   -- rust · keywords, constants
  yellow      = "#d9a82e",   -- types · honey amber
  yellow_br   = "#edc14a",   -- function names · soft gold
  green       = "#74bc42",   -- signature · strings · natural green (desaturated from the lime-y gruber-darker green)
  green_dim   = "#569828",
  teal        = "#4fa8a0",   -- numbers
  teal_br     = "#70c8bc",
  blue        = "#7eb0cc",   -- fields, paths
  rose        = "#d07878",   -- self, macros, special
  comment     = "#9e988c",   -- warm gray

  -- signals
  diff_add_bg = "#19281a",
  diff_add_fg = "#a9d979",
  diff_del_bg = "#2a1614",
  diff_del_fg = "#ef6a4a",
  diff_chg_bg = "#24221a",
  diff_chg_fg = "#d9a82e",
  search_bg   = "#403820",
  search_fg   = "#ffe08a",
  cursor_line = "#1d1d1d",
}
