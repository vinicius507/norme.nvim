local norme = {}

local config = require('norme.config')

---Sets up Norme.nvim, if not called, the defaults will be used
---@param opts table: configuration for Norme.nvim
function norme.setup(opts)
	config.setup(opts)
end

return norme
