local M = {}

local config = require("norme.config")

---@param opts NormeConfig
M.setup = function(opts)
	local normels = require("norme.null-ls")

	config.setup(opts)
	require("null-ls").register(normels.source)
end

return M
