# Norme.nvim

A Neovim Linter for the École 42 Norme.

Requirements
---

- NeoVim `v0.5+`.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Executable `norminette` in your PATH ([version 3.3.2](https://github.com/42School/norminette) or higher).

Installation
---

Use the package manager of your choice.

`Packer.nvim`:

```lua
use { 'vinicius507/norme.nvim' }
```

`vim-plug`:

```vim
Plug 'vinicius507/norme.nvim'
```

Setup
---

You can setup everything via `require('null-ls').config` and
`require('lspconfig')['null-ls'].setup`.

```lua
local norme = require('norme')
local null_ls = require('null-ls')
local lspconfig = require('lspconfig')

lspconfig['null-ls'].setup({})
norme.setup()
```

Warnings
---

For now Norme.nvim will **only** run if the 42 École header is in the file.
Future implementations will have an option to ignore files in `.gitignore`.

Author
---

Vinícius Gonçalves de Oliveira(vgoncalv)

Cadet at 42 São Paulo
