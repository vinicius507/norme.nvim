# Norme.nvim

A Neovim Linter for the École 42 Norme.

Requirements
---

- NeoVim `v0.5+`.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Executable `norminette` in your PATH ([version 3](https://github.com/42School/norminette) specifically).

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

Norme.nvim attaches itself to Neovim's native LSP. An example setup:

```lua
local nvim_lsp = require('lspconfig')

nvim_lsp.clangd.setup({
	on_attach = require('norme').on_attach,
})
```

> Note: if your language server was installed using `kabouzeid/nvim-lspinstall`
> you should change `nvim_lsp.clangd.setup` to `nvim_lsp.cpp.setup`.

Warnings
---

For now Norme.nvim will **only** run if the 42 École header is in the file.
Future implementations will have an option to ignore files in `.gitignore`.

Due to how `norminette` parses hfiles, Norme.nvim is not checking header
protections(for now). Will be fixed in a later update.

Author
---

Vinícius Gonçalves de Oliveira(vgoncalv)

Cadet at 42 São Paulo
