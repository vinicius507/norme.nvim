local M = {}

local null_ls = require('null-ls')
local config = require('norme.config').config

M.filetypes = { 'cpp' }

M.method = null_ls.methods.DIAGNOSTICS

M.generator = require('null-ls.helpers').generator_factory({
	command = config.cmd,
	args = { '--filename', '$FILENAME', '--hfile', '$TEXT' },
	format = 'line',
	to_stdin = false,
	from_stderr = true,
	timeout = 500,
	on_output = function(line, _)
		local pattern =
			'Error:%s+([%a+_?]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.*)$'
		local code, lineno, offset, msg = string.match(line, pattern)

		if code == nil or lineno == nil or offset == nil or msg == nil then
			return nil
		end

		msg = 'NORME: '
			.. msg:sub(1, 1):upper()
			.. msg:sub(2)
			.. '('
			.. code
			.. ')'

		return {
			col = offset,
			row = lineno,
			message = msg,
			severity = 1,
			source = 'norminette',
		}
	end,
	runtime_condition = function(params)
		if not params.bufname:match('.*%.h') then
			return false
		end

		if
			params.content[6] == nil
			or not params.content[6]:match(
				'/%*%s+By:%s+.+%s+<.+>%s+%+#%+%s+%+:%+%s+%+#%+%s+%*/'
			)
		then
			return false
		end
		return true
	end,
})

return M
