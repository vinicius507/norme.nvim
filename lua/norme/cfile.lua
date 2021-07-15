local M = {}

local null_ls = require('null-ls')

M.filetypes	= {'c'}

M.method	= null_ls.methods.DIAGNOSTICS

M.generator	= require('null-ls.helpers').generator_factory({
	command			= 'norminette',
	args			= { '--cfile', '$TEXT' },
	format			= 'line',
	to_stdin		= false,
	to_stderr		= true,
	ignore_errors	= false,
	on_output		= function (line, _)
		local pattern = 'Error:%s+([%a+_?]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.*)$'
		local  code, lineno, offset, msg = string.match(line, pattern)

		if code == nil or lineno == nil or offset == nil or msg == nil then
			return nil
		end

		msg = 'NORME: ' .. msg:sub(1,1):upper() .. msg:sub(2) .. '('.. code .. ')'

		return {
			col			= offset,
			row			= lineno,
			message 	= msg,
			severity	= 1,
			source		= 'norminette',
		}
	end
})

return M
