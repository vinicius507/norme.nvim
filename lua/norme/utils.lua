local M = {}

M.check_norminette = function()
	local ok, job = pcall(require, 'plenary.job')

	if not ok then
		error('[Norme.nvim] requirement plenary is not met.')
	end

	local result = job
		:new({
			command = 'norminette',
			args = { '--v' },
		})
		:sync()

	local version
	if
		type(result) == 'table'
		and result[1]
		and result[1]:match('norminette .*')
	then
		version = result[1]:match('norminette (.*)')
		return (version >= '3.3.2')
	end

	error(
		'[Norme.nvim] norme.nvim requires norminette version 3.3.2 or higher.'
	)

	return false
end

return M
