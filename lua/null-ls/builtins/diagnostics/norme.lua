local h = require('null-ls.helpers')
local DIAGNOSTICS = require('null-ls.methods').internal.DIAGNOSTICS

local config = require('norme.config')
local helpers = require('norme.helpers')

return h.make_builtin({
	method = DIAGNOSTICS,
	filetypes = { 'c', 'cpp' },
	generator_opts = {
		command = config.cmd(),
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
