# Norme.nvim

A Neovim Linter for the École 42 Norme.

Requirements
---

- NeoVim `v0.5+` (nightly release).
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint).
- Executable `norminette` in your PATH ([version 3](https://github.com/42School/norminette) specifically).

Roadmap
---

- [ ] Try to run `norme.nvim` with contents of the current buffer.
- [ ] Make linter run only if the 42 header is present in the file.

Installation
---

Use the package manager of your choice.

E.g. with `Packer.nvim`:

```lua
use { 'vinicius507/norme.nvim', requires = { 'mfussenegger/nvim-lint' } }
```

Configuration
---

In your `nvim-lint` configuration you just have to add:

```lua
local lint = require('lint')
local norme = require('norme').linter

lint.linters.norme = norme

require('lint').linters_by_ft = {
	c = { 'norme', },
	cpp = { 'norme', }, -- for header and C++ files
}
```

Usage
---

Add the following `autocmd`'s:

```vim
autocmd BufEnter *.c lua require('lint').try_lint()
autocmd BufWritePost *.c lua require('lint').try_lint()
```

Author
---

Vinícius Gonçalves de Oliveira(vgoncalv)

Cadet at 42 São Paulo
