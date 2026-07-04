# Neovim Codepointers

A simple plugin for generating codepointers in repositories.

## Installation

Install with Neovim's native package manager.

```lua
vim.pack.add({"https://github.com/KanielDasper/nvim-codepointer"})
```

Remember to add the following option to your `init.lua`

```lua
vim.opt.clipboard:append("unnamedplus")
```

## Usage

After installation:

1. Run `:CodePointer` command in Neovim to save current file and line number to the '+' register
2. Or use the keymapping (default `<leader>cp`)

To change default keymapping, add this to your config:

```lua
require("codepointer").setup({ keymap = "..." })
```
