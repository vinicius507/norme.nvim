local norme = {}

local h = require('null-ls.helpers')
local DIAGNOSTICS = require('null-ls.methods').internal.DIAGNOSTICS

local config = require('norme.config')
local helpers = require('norme.helpers')

---Sets up Norme.nvim, if not called, the defaults will be used
---@param opts table: configuration for Norme.nvim
function h.setup(opts)
	config.set(opts)
end

---Diagnostics source for null-ls
norme.diagnostics = h.make_builtin({
	method = DIAGNOSTICS,
	filetypes = { 'c', 'cpp' },
	generator_opts = {
		command = config.cmd,
		args = { '--stdin', '--filename', '$FILENAME' },
		to_stdin = true,
		from_stderr = true,
		timeout = 200,
		format = 'line',
		on_output = h.diagnostics.from_pattern(
			[[Error:%s+([%a+_?]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.*)$]],
			{ 'code', 'row', 'col', 'message' }
		),
	},
	factory = h.generator_factory,
	runtime_condition = helpers.check_header,
})

return norme
