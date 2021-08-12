local config = require('norme.config')
local utils = require('norme.utils')

local M = {}

M.setup = function(opts)
	local ok, null_ls = pcall(require, 'null-ls')

	if not ok then
		error(
			'[Norme.nvim] requirement null-ls is missing. Install it with your plugin manager.'
		)
		return
	end

	if not utils.check_norminette() then
		return
	end

	opts = opts or {}
	config.set(opts)

	local cfile = require('norme.cfile')
	local hfile = require('norme.hfile')

	null_ls.register({
		name = 'norminette',
		sources = { cfile, hfile },
	})
end

return M
