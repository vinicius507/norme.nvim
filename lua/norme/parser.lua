local M = {}

local ERROR = vim.lsp.protocol.DiagnosticSeverity.Error
local pattern = 'Error:%s+([%a+_?]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.*)$'
local diagnostic_skeleton = { source = 'norminette', severity = ERROR }

M.parser = function(output)
	local result = vim.fn.split(output, "\n")
	local diagnostics = {}

	for idx, message in ipairs(result) do
		if idx == 1 then goto continue end -- Jump first line of Norminette output. E.g: "File.c: OK!"
		local  code, lineno, offset, msg = string.match(message, pattern)
		lineno = tonumber(lineno or 1) - 1
		offset = tonumber(offset or 1) - 1
		local d = vim.deepcopy(diagnostic_skeleton)
		-- HACK: Need a better idea to ignore norminette errors.
		if msg == nil then  goto continue end
		table.insert(diagnostics, vim.tbl_deep_extend('force', d, {
			code = code,
			range = {
				['start'] = {line = lineno, character = offset},
				['end'] = {line = lineno, character = offset + 1}
			},
			message = 'NORME: ' .. msg .. '(' .. code .. ')',
		}))
		::continue::
	end
	return diagnostics
end

return M
