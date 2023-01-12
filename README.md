# Norme.nvim
A null-ls source for École 42 [`norminette`](https://github.com/42School/norminette)

## Requirements
- NeoVim `v0.8+`.
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Executable `norminette` in your `PATH`


## Installation

<details><summary>Using lazy.nvim</summary>
Norme.nvim LazySpec:

```lua
local spec = {
	"vinicius507/norme.nvim",
	dependencies = { "jose-elias-alvarez/null-ls.nvim" }
}
```
</details>

<details><summary>Using Packer</summary>
```lua
use({
	"vinicius507/norme.nvim",
	requires = { "jose-elias-alvarez/null-ls.nvim" }
})
```
</details>

## Setup
You can pass your configuration via the `setup` function.

> **Warning**
> Remember to setup the plugin only after setting up null-ls!

```lua
require("null-ls").setup({ ... })
require("norme").setup({
	-- Your configuration
	cmd = os.getenv('HOME') .. '/.local/bin/norminette'
})
```

Norme.nvim comes with the following defaults:

```lua
---@type NormeConfig
local defaults = {
	cmd = "norminette",
}
```
