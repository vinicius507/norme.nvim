local ERROR = vim.lsp.protocol.DiagnosticSeverity.Error
local pattern = 'Error:%s+([%a+_?]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.*)$'
local diagnostic_skeleton = { source = 'norminette', severity = ERROR }

local norminette_parser = function(output)
	local result = vim.fn.split(output, "\n")
	local diagnostics = {}

	for idx, message in ipairs(result) do
		if idx == 1 then goto continue end -- jump first line of norminette output
		local  code, lineno, offset, msg = string.match(message, pattern)
		lineno = tonumber(lineno or 1) - 1
		offset = tonumber(offset or 1) - 1
		local d = vim.deepcopy(diagnostic_skeleton)
		table.insert(diagnostics, vim.tbl_deep_extend('force', d, {
			code = code,
			range = {
				['start'] = {line = lineno, character = offset},
				['end'] = {line = lineno, character = offset + 1}
			},
			message = code .. ' ' .. msg,
		}))
		::continue::
	end
	return diagnostics
end

require('lint').linters.norme = {
	cmd = 'norminette',
	stdin = false,
	args = {},
	stream = 'stdout',
	ignore_exitcode = true,
	parser = norminette_parser,
}

require('lint').linters_by_ft = {
	c = { 'norme', },
}

vim.cmd "autocmd BufNew *.c lua require('lint').try_lint()"
vim.cmd "autocmd InsertLeave *.c lua require('lint').try_lint()"
vim.cmd "autocmd BufWritePost *.c lua require('lint').try_lint()"
