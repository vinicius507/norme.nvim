local ok, null_ls = pcall(require, 'null-ls')
local utils = require('norme.utils')

local M = {}

M.on_attach = function ()
	if not ok then
		print('[Norme.nvim] new version of norme.nvim uses null-ls instead of nvim-lint.')
		return
	end

	if not utils.check_norminette() then
		print('[Norme.nvim] norme.nvim requires norminette version 3.3.0 or higher.')
		return
	end
	local cfile = require('norme.cfile')

	if not utils.should_lint() then
		return
	end
	null_ls.setup()
	null_ls.register({ name = 'norminette', filetypes = { 'c', 'cpp' }, sources = { cfile } })
end

return M
