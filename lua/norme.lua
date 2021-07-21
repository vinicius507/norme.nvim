local ok, null_ls = pcall(require, 'null-ls')
local utils = require('norme.utils')

local M = {}

local cfile = require('norme.cfile')
local hfile = require('norme.hfile')

M.on_attach = function (_, _)
	if not ok then
		print('[Norme.nvim] requirement null-ls is missing. Install it with your plugin manager.')
		return
	end

	if not utils.check_norminette() then
		print('[Norme.nvim] norme.nvim requires norminette version 3.3.0 or higher.')
		return
	end

	null_ls.setup()
	null_ls.register({
		name = 'norminette-c',
		sources = { cfile, hfile }
	})
end

-- Exposes norminette sources for setup with lspconfig
M.norminette_c = cfile
M.norminette_h = hfile

M.lint = function ()
	print('[Norme.nvim] new version of norme.nvim uses null-ls instead of nvim-lint. Refer to the Setup section on the README.')
end

return M
