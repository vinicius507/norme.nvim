local M = {}

---@class NormeConfig
local defaults = {
	---@type string?
	cmd = "norminette",
}

---@type NormeConfig
local settings

---@param opts NormeConfig?
function M.setup(opts)
	settings = vim.tbl_extend("force", defaults, opts or {})
end

setmetatable(M, {
	__index = function(_, key)
		if key == nil then
			return
		end

		if settings == nil then
			M.setup()
		end

		---@cast settings NormeConfig
		return settings[key]
	end,
})

return M
