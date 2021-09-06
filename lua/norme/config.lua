local M = {}

M.config = {
	cmd = 'norminette',
}

M.set = function(cfg)
	M.config = vim.tbl_extend('force', M.config, cfg)
end

return M
