# Neovim Codepointers

A simple plugin for generating codepointers in repositories.

## Installation

Install with Neovim's native package manager.

```lua
vim.pack.add({"https://github.com/KanielDasper/nvim-codepointer"})
```

## Usage

After installation:

1. Run `:CodePointer` command in Neovim
2. Or use the keymapping (default `<leader>cp`)

To change default keymapping, add this to your config:

```lua
require("codepointer").setup({ keymap = "..." })
```
