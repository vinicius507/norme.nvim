local M = {}

local defaults =  {
	cmd = 'norminette',
}

local config = vim.deepcopy(defaults)

function M.setup(cfg)
	vim.tbl_extend('force', config, cfg)
end

function M.cmd()
	return config.cmd
end

return M
