local M = {
	parser = require('norme/parser').parser,
	should_lint = require('norme/utils').should_lint,
}

local stdin_parser = '../utils/stdin-parser'

-- HACK: Need a better idea to get contents of current buffer.
local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)") or "."
end

M.linter =  {
	cmd = script_path() .. stdin_parser,
	stdin = true,
	args = {},
	stream = 'stdout',
	ignore_exitcode = true,
	parser = M.parser,
}

M.lint = function()
	if M.should_lint() then
		local filename = vim.fn.expand('%:t')
		local lint = require('lint')
		lint.linters.norme.args = { filename }
		lint.try_lint()
	end
end

return M
