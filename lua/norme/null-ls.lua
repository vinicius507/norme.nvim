local M = {}

local nls = require("null-ls")
local config = require("norme.config")

M.source = {
	name = "norme.nvim",
	meta = {
		url = "https://github.com/42School/norminette",
		description = "École 42 norme checker",
	},
	method = nls.methods.DIAGNOSTICS,
	filetypes = {
		"c",
		"cpp",
	},
	can_run = function()
		return require("null-ls.utils").is_executable("norminette")
	end,
	generator = nls.generator({
		command = config.cmd,
		args = function(params)
			return {
				"--filename",
				"$FILENAME",
				params.ft == "c" and "--cfile" or "--hfile",
				"$TEXT",
			}
		end,
		format = "line",
		to_stdin = false,
		from_stderr = true,
		timeout = 500,
		on_output = function(line, _)
			local pattern = "Error:%s+([%a+_?]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.*)$"
			local code, lineno, offset, msg = string.match(line, pattern)

			if code == nil or lineno == nil or offset == nil or msg == nil then
				return nil
			end

			msg = msg:sub(1, 1):upper() .. msg:sub(2)

			return {
				col = offset,
				row = lineno,
				message = msg,
				severity = 1,
				source = "norminette",
			}
		end,
	}),
}

return M
