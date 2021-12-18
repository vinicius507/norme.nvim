# Norme.nvim

A Neovim Linter for the École 42 Norme.

Requirements
---

- NeoVim v0.5+.
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Executable [`norminette`](https://github.com/42School/norminette)

Installation
---

Use the package manager of your choice.

`Packer.nvim`:

```lua
use { 'vinicius507/norme.nvim', requires = 'jose-elias-alvarez/null-ls.nvim'}
```

`vim-plug`:

```vim
Plug 'vinicius507/norme.nvim'
```

Setup
---

Norme.nvim is a null-ls source, to register it:

```lua
local norme = require('norme')
local null_ls = require('null-ls')
null_ls.setup({
	sources = {
		norme.diagnostics,
	},
})
```

To configure the norminette command to be called, you need to use the `with` method:

```lua
null_ls.setup({
	sources = {
		norme.diagnostics.with({
			command = 'NORMINETTE_PATH',
		}),
	},
})
```

Warnings
---

For now Norme.nvim will **only** run if the 42 École header is in the file.
Future implementations will have an option to ignore files in `.gitignore`.

Author
---

Vinícius Gonçalves de Oliveira(vgoncalv)

Cadet at 42 São Paulo
