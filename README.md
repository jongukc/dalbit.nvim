# dalbit.nvim · 달빛

A warm-accent, high-contrast dark colorscheme for Neovim.
Inspired by [gruber-darker](https://github.com/rexim/gruber-darker-theme)
and the night view of Seoul across the Han River.

## Requirements

- Neovim ≥ 0.8 (tree-sitter captures use `@capture` format)
- `termguicolors` (enabled automatically)
- A true-color terminal. For italics/bold to render, a font that supports them
  (e.g. JetBrains Mono).

## Install

### lazy.nvim

```lua
{
  "jongukc/dalbit.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("dalbit")
  end,
}
```

With options:

```lua
{
  "jongukc/dalbit.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,
    styles = {
      comments  = { italic = true },
      keywords  = { bold = true },
      functions = {},
      types     = {},
      variables = {},
    },
  },
  config = function(_, opts)
    require("dalbit").setup(opts)
    vim.cmd.colorscheme("dalbit")
  end,
}
```

### packer.nvim

```lua
use({
  "jongukc/dalbit.nvim",
  config = function()
    require("dalbit").setup()
    vim.cmd.colorscheme("dalbit")
  end,
})
```

### Manual

Clone into your `runtimepath`:

```bash
git clone https://github.com/jongukc/dalbit.nvim \
  ~/.local/share/nvim/site/pack/colors/start/dalbit.nvim
```

Then `:colorscheme dalbit`.

## Configuration

All options with their defaults:

```lua
require("dalbit").setup({
  transparent = false,           -- transparent Normal / NormalFloat / SignColumn
  styles = {
    comments  = { italic = true },
    keywords  = { bold = true },
    functions = {},
    types     = {},
    variables = {},
  },
  palette_overrides = {},        -- { green = "#XXXXXX", ... }
  overrides = nil,               -- table or function(c) returning { Group = {...} }
})
```

### Overriding individual palette colors

```lua
require("dalbit").setup({
  palette_overrides = {
    green  = "#88e048",   -- brighten the signature green
    orange = "#cc7a48",   -- warmer rust
  },
})
```

### Overriding highlight groups

```lua
require("dalbit").setup({
  overrides = function(c)
    return {
      CursorLine = { bg = "#1a1a1a" },
      MyCustomGroup = { fg = c.teal_br, bold = true },
    }
  end,
})
```

## Using the palette in your config

```lua
local c = require("dalbit.palette")
vim.api.nvim_set_hl(0, "MyGroup", { fg = c.yellow_br, bg = c.bg_soft })
```

## Palette

### Surfaces

| role    | hex       |
| ------- | --------- |
| bg0     | `#151515` |
| bg_soft | `#1c1c1c` |
| bg1     | `#222222` |
| bg2     | `#2c2c2c` |
| bg3     | `#383838` |
| bg4     | `#474747` |

### Foregrounds (cool off-white, B > R)

| role    | hex       |
| ------- | --------- |
| fg0     | `#ced0d6` |
| fg1     | `#b8bac0` |
| fg2     | `#909298` |
| fg_mute | `#66686e` |

### Accents

| role      | hex       | used for                     |
| --------- | --------- | ---------------------------- |
| red       | `#e04a2a` | errors, exceptions           |
| orange    | `#bc6838` | keywords, constants (rust)   |
| yellow    | `#d9a82e` | types                        |
| yellow_br | `#edc14a` | function names               |
| green     | `#74bc42` | **signature** · strings, ok  |
| teal      | `#4fa8a0` | numbers, cyan                |
| blue      | `#7eb0cc` | fields, paths                |
| rose      | `#d07878` | `self`, macros, special      |
| comment   | `#9e988c` | comments (warm gray, italic) |

## Included highlight coverage

- Classic `:h group-name` groups
- Tree-sitter captures (`@variable`, `@function`, `@keyword`, `@type`, etc.)
- LSP diagnostics + underline
- Diff highlight groups
- Git signs (gitsigns.nvim, vim-signify)
- Telescope
- `:terminal` ANSI 16 colors

## License

MIT.
