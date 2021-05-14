# Norme.nvim

A Neovim Linter for the École 42 Norme.

> PS: The plugin is in development. Still not usable.

Requirements
---

- NeoVim `v0.5+`(nightly release)
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- Executable `norminette` in your PATH

Configuration
---

In your `nvim-lint` configuration you just have to add:

```lua
local lint = require('lint')
local norme = require('norme').linter

lint.linters.norme = norme

print(norme)

require('lint').linters_by_ft = {
	c = { 'norme', },
	cpp = { 'norme', }, -- for header and C++ files
}
```

Author
---

Vinícius Gonçalves de Oliveira(vgoncalv)

Cadet at 42 São Paulo
