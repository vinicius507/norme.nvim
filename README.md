# Norme.nvim

A Neovim Linter for the École 42 Norme.

Requirements
---

- NeoVim `v0.5+` (nightly release).
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint).
- Executable `norminette` in your PATH ([version 3](https://github.com/42School/norminette) specifically).

Roadmap
---

- [X] Try to run `norme.nvim` with contents of the current buffer(HACK, for now).
- [ ] Add the option to parse a `.normeignore` file.

Installation
---

Use the package manager of your choice.

`Packer.nvim`:

```lua
use { 'vinicius507/norme.nvim', requires = { 'mfussenegger/nvim-lint' } }
```

`vim-plug`

```vim
Plug 'mfussenegger/nvim-lint'
Plug 'vinicius507/norme.nvim'
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

To add it to your `init.vim`, create a lua file and add the code above. Then source it to your `init.vim` using:

```vim
luafile ~/path/to/luafile.lua
```

If you use `init.lua`, just place your plugin configuration file in the folder in `$HOME/.config/nvim/lua` and source it in your `init.lua` using:
```lua
require('filename') -- without the .lua extension
```

Usage
---

Add the following `autocmd`'s:

```vim
autocmd BufEnter *.c,*.h lua require('lint').try_lint()
autocmd BufWritePost *.c,*.h lua require('lint').try_lint()
autocmd InsertLeave *.c,*.h lua require('lint').try_lint()
autocmd TextChanged *.c,*.h lua require('lint').try_lint()
```

Author
---

Vinícius Gonçalves de Oliveira(vgoncalv)

Cadet at 42 São Paulo
