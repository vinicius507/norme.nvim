local norme = {}

local h = require('null-ls.helpers')
local DIAGNOSTICS = require('null-ls.methods').internal.DIAGNOSTICS

local helpers = require('norme.helpers')

-- We build the diagnostics source via null-ls itself
norme.diagnostics = h.make_builtin({
	method = DIAGNOSTICS,
	filetypes = { 'c', 'cpp' },
	generator_opts = {
		command = 'norminette',
		args = { '--stdin', '--filename', '$FILENAME' },
		to_stdin = true,
		from_stderr = true,
		timeout = 200,
		format = 'line',
		on_output = h.diagnostics.from_pattern(
			[[Error:%s+([%a+_?]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.*)$]],
			{ 'code', 'row', 'col', 'message' }
		),
		runtime_condition = helpers.check_header,
	},
	factory = h.generator_factory,
})

return norme
