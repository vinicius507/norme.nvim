local M = {}

M.check_norminette = function()
	local job = require('plenary.job')
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
	return false
end

return M
