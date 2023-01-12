local M = {}

local config = require("norme.config")

---@type fun(opts: NormeConfig?)
function M.setup(opts)
	local normels = require("norme.null-ls")

	config.setup(opts)
	require("null-ls").register(normels.source)
end

return M
