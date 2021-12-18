local config = {
	cmd = 'norminette',
}

function config:set(cfg)
	self = vim.tbl_extend('force', self, cfg)
end

return config
