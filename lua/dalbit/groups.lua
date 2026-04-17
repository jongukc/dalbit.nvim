-- dalbit · highlight groups

local M = {}

---@param c table   palette (lua/dalbit/palette.lua)
---@param cfg table user configuration
function M.get(c, cfg)
  cfg = cfg or {}
  local s = cfg.styles or {}
  local comment_style  = s.comments  or { italic = true }
  local keyword_style  = s.keywords  or { bold = true }
  local function_style = s.functions or {}
  local type_style     = s.types     or {}
  local variable_style = s.variables or {}

  local transparent = cfg.transparent
  local bg_norm  = transparent and "NONE" or c.bg0
  local bg_float = transparent and "NONE" or c.bg_soft
  local bg_sign  = transparent and "NONE" or c.bg0
  local bg_stat  = c.bg1

  -- merge a style table onto a base { fg = ... } spec
  local function with(base, style)
    return vim.tbl_extend("force", base, style or {})
  end

  return {
    -- Editor chrome
    Normal          = { fg = c.fg0,  bg = bg_norm },
    NormalNC        = { fg = c.fg1,  bg = bg_norm },
    NormalFloat     = { fg = c.fg0,  bg = bg_float },
    FloatBorder     = { fg = c.bg4,  bg = bg_float },
    FloatTitle      = { fg = c.green, bg = bg_float, bold = true },
    ColorColumn     = {              bg = c.bg1 },
    Cursor          = { fg = c.bg0,  bg = c.green },
    CursorLine      = {              bg = c.cursor_line },
    CursorColumn    = {              bg = c.cursor_line },
    CursorLineNr    = { fg = c.yellow, bold = true },
    LineNr          = { fg = c.fg_mute },
    SignColumn      = {              bg = bg_sign },
    FoldColumn      = { fg = c.fg_mute, bg = bg_sign },
    Folded          = { fg = c.fg2,  bg = c.bg1 },
    VertSplit       = { fg = c.bg3 },
    WinSeparator    = { fg = c.bg3 },
    NonText         = { fg = c.fg_mute },
    EndOfBuffer     = { fg = c.bg0 },
    SpecialKey      = { fg = c.fg_mute },
    Whitespace      = { fg = c.bg3 },
    MatchParen      = { fg = c.yellow, bold = true, underline = true },
    Conceal         = { fg = c.fg2 },

    -- Search / visual
    Search          = { fg = c.search_fg, bg = c.search_bg },
    IncSearch       = { fg = c.bg0,       bg = c.yellow_br },
    CurSearch       = { fg = c.bg0,       bg = c.yellow_br },
    Visual          = { bg = c.bg3 },
    VisualNOS       = { bg = c.bg2 },

    -- Popup
    Pmenu           = { fg = c.fg1, bg = c.bg1 },
    PmenuSel        = { fg = c.fg0, bg = c.bg3, bold = true },
    PmenuSbar       = { bg = c.bg2 },
    PmenuThumb      = { bg = c.bg4 },

    -- Tabs / status
    TabLine         = { fg = c.fg2, bg = c.bg_soft },
    TabLineFill     = { bg = c.bg_soft },
    TabLineSel      = { fg = c.fg0, bg = bg_norm, bold = true },
    StatusLine      = { fg = c.fg1, bg = bg_stat },
    StatusLineNC    = { fg = c.fg2, bg = c.bg_soft },

    -- Messages / links
    ErrorMsg        = { fg = c.red, bold = true },
    WarningMsg      = { fg = c.yellow },
    MoreMsg         = { fg = c.green },
    Question        = { fg = c.teal },
    ModeMsg         = { fg = c.green, bold = true },
    Title           = { fg = c.yellow_br, bold = true },
    Directory       = { fg = c.blue },
    Underlined      = { fg = c.blue, underline = true },

    -- Diff
    DiffAdd         = { fg = c.green,     bg = c.diff_add_bg },
    DiffChange      = { fg = c.yellow,    bg = c.diff_chg_bg },
    DiffDelete      = { fg = c.red,       bg = c.diff_del_bg },
    DiffText        = { fg = c.yellow_br, bg = c.diff_chg_bg, bold = true },

    -- Spell
    SpellBad        = { sp = c.red,    undercurl = true },
    SpellCap        = { sp = c.yellow, undercurl = true },
    SpellLocal      = { sp = c.teal,   undercurl = true },
    SpellRare       = { sp = c.rose,   undercurl = true },

    -- Classic syntax groups
    Comment         = with({ fg = c.comment }, comment_style),
    Constant        = { fg = c.rose },
    String          = { fg = c.green },
    Character       = { fg = c.green },
    Number          = { fg = c.teal },
    Boolean         = { fg = c.orange, bold = true },
    Float           = { fg = c.teal },

    Identifier      = with({ fg = c.fg0 }, variable_style),
    Function        = with({ fg = c.yellow_br }, function_style),

    Statement       = with({ fg = c.orange }, keyword_style),
    Conditional     = with({ fg = c.orange }, keyword_style),
    Repeat          = with({ fg = c.orange }, keyword_style),
    Label           = { fg = c.orange },
    Operator        = { fg = c.fg1 },
    Keyword         = with({ fg = c.orange }, keyword_style),
    Exception       = { fg = c.red, bold = true },

    PreProc         = { fg = c.rose },
    Include         = with({ fg = c.orange }, keyword_style),
    Define          = with({ fg = c.orange }, keyword_style),
    Macro           = { fg = c.rose },
    PreCondit       = { fg = c.rose },

    Type            = with({ fg = c.yellow }, type_style),
    StorageClass    = with({ fg = c.orange }, keyword_style),
    Structure       = with({ fg = c.yellow }, type_style),
    Typedef         = with({ fg = c.yellow }, type_style),

    Special         = { fg = c.rose },
    SpecialChar     = { fg = c.rose },
    Tag             = { fg = c.teal },
    Delimiter       = { fg = c.fg2 },
    SpecialComment  = { fg = c.teal_br, italic = true },
    Debug           = { fg = c.red },

    Todo            = { fg = c.yellow_br, bg = c.bg2, bold = true },
    Error           = { fg = c.red, bold = true, underline = true },

    -- LSP diagnostics
    DiagnosticError = { fg = c.red },
    DiagnosticWarn  = { fg = c.yellow },
    DiagnosticInfo  = { fg = c.blue },
    DiagnosticHint  = { fg = c.teal },
    DiagnosticOk    = { fg = c.green },
    DiagnosticUnderlineError = { sp = c.red,    undercurl = true },
    DiagnosticUnderlineWarn  = { sp = c.yellow, undercurl = true },
    DiagnosticUnderlineInfo  = { sp = c.blue,   undercurl = true },
    DiagnosticUnderlineHint  = { sp = c.teal,   undercurl = true },

    -- Tree-sitter (Nvim 0.8+ captures)
    ["@comment"]                 = { link = "Comment" },
    ["@variable"]                = with({ fg = c.fg0 }, variable_style),
    ["@variable.builtin"]        = { fg = c.rose, italic = true },
    ["@variable.parameter"]      = { fg = c.fg1 },
    ["@variable.member"]         = { fg = c.blue },
    ["@field"]                   = { fg = c.blue },
    ["@property"]                = { fg = c.blue },
    ["@constant"]                = { fg = c.rose },
    ["@constant.builtin"]        = { fg = c.rose, bold = true },
    ["@constant.macro"]          = { fg = c.rose },
    ["@string"]                  = { fg = c.green },
    ["@string.escape"]           = { fg = c.rose },
    ["@string.regex"]            = { fg = c.teal_br },
    ["@number"]                  = { fg = c.teal },
    ["@boolean"]                 = { fg = c.orange, bold = true },
    ["@function"]                = with({ fg = c.yellow_br }, function_style),
    ["@function.builtin"]        = with({ fg = c.yellow_br, italic = true }, function_style),
    ["@function.call"]           = with({ fg = c.yellow_br }, function_style),
    ["@function.macro"]          = { fg = c.rose },
    ["@method"]                  = with({ fg = c.yellow_br }, function_style),
    ["@method.call"]             = with({ fg = c.yellow_br }, function_style),
    ["@constructor"]             = { fg = c.yellow },
    ["@keyword"]                 = with({ fg = c.orange }, keyword_style),
    ["@keyword.function"]        = with({ fg = c.orange }, keyword_style),
    ["@keyword.operator"]        = with({ fg = c.orange }, keyword_style),
    ["@keyword.return"]          = with({ fg = c.orange }, keyword_style),
    ["@conditional"]             = with({ fg = c.orange }, keyword_style),
    ["@repeat"]                  = with({ fg = c.orange }, keyword_style),
    ["@type"]                    = with({ fg = c.yellow }, type_style),
    ["@type.builtin"]            = with({ fg = c.yellow }, type_style),
    ["@type.definition"]         = with({ fg = c.yellow }, type_style),
    ["@namespace"]               = { fg = c.fg1 },
    ["@module"]                  = { fg = c.fg1 },
    ["@operator"]                = { fg = c.fg1 },
    ["@punctuation.delimiter"]   = { fg = c.fg2 },
    ["@punctuation.bracket"]     = { fg = c.fg2 },
    ["@punctuation.special"]     = { fg = c.rose },
    ["@tag"]                     = { fg = c.teal },
    ["@tag.attribute"]           = { fg = c.yellow },
    ["@tag.delimiter"]           = { fg = c.fg2 },

    -- Markup (markdown, help, etc.)
    ["@markup.heading"]   = { fg = c.yellow_br, bold = true },
    ["@markup.strong"]    = { fg = c.fg0, bold = true },
    ["@markup.italic"]    = { fg = c.fg0, italic = true },
    ["@markup.link"]      = { fg = c.blue, underline = true },
    ["@markup.link.url"]  = { fg = c.blue, underline = true },
    ["@markup.raw"]       = { fg = c.green },
    ["@markup.raw.block"] = { fg = c.fg2 },
    ["@markup.quote"]     = { fg = c.fg2, italic = true },
    ["@markup.list"]      = { fg = c.orange },

    -- Per-level markdown headings (distinct colors; also seeds Markview palette derivation)
    markdownH1 = { fg = c.red,    bold = true },
    markdownH2 = { fg = c.yellow_br, bold = true },
    markdownH3 = { fg = c.yellow, bold = true },
    markdownH4 = { fg = c.green,  bold = true },
    markdownH5 = { fg = c.blue,   bold = true },
    markdownH6 = { fg = c.rose,   bold = true },
    ["@markup.heading.1.markdown"] = { link = "markdownH1" },
    ["@markup.heading.2.markdown"] = { link = "markdownH2" },
    ["@markup.heading.3.markdown"] = { link = "markdownH3" },
    ["@markup.heading.4.markdown"] = { link = "markdownH4" },
    ["@markup.heading.5.markdown"] = { link = "markdownH5" },
    ["@markup.heading.6.markdown"] = { link = "markdownH6" },

    -- Diff (tree-sitter) — used inside ```diff code blocks, :Gdiffsplit, etc.
    ["@diff"]       = { fg = c.fg2 },
    ["@diff.plus"]  = { fg = c.green },
    ["@diff.minus"] = { fg = c.red },
    ["@diff.delta"] = { fg = c.yellow },

    -- Git signs / diff fallback
    GitSignsAdd        = { fg = c.green },
    GitSignsChange     = { fg = c.yellow },
    GitSignsDelete     = { fg = c.red },
    SignifySignAdd     = { fg = c.green },
    SignifySignChange  = { fg = c.yellow },
    SignifySignDelete  = { fg = c.red },
    diffAdded          = { fg = c.green },
    diffChanged        = { fg = c.yellow },
    diffRemoved        = { fg = c.red },

    -- Telescope
    TelescopeBorder       = { fg = c.bg4, bg = c.bg_soft },
    TelescopeNormal       = { fg = c.fg1, bg = c.bg_soft },
    TelescopePromptBorder = { fg = c.bg4, bg = c.bg1 },
    TelescopePromptNormal = { fg = c.fg0, bg = c.bg1 },
    TelescopeSelection    = { fg = c.fg0, bg = c.bg3, bold = true },
    TelescopeMatching     = { fg = c.yellow_br, bold = true },

    -- which-key
    WhichKey          = { fg = c.green },
    WhichKeyGroup     = { fg = c.orange },
    WhichKeyDesc      = { fg = c.fg1 },
    WhichKeySeparator = { fg = c.fg_mute },
    WhichKeyFloat     = { bg = c.bg_soft },
  }
end

return M
