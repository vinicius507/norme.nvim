local M = {}

---@class NormeConfig
local defaults = {
	---@type string?
	cmd = "norminette",
}

---@type NormeConfig
local settings

local function create_user_commands()
	vim.api.nvim_create_user_command("NormeEnable", require("norme.api").enable, {})
	vim.api.nvim_create_user_command("NormeDisable", require("norme.api").disable, {})
	vim.api.nvim_create_user_command("NormeToggle", require("norme.api").toggle, {})
end

---@type fun(opts: NormeConfig?)
function M.setup(opts)
	settings = vim.tbl_extend("force", defaults, opts or {})
	create_user_commands()
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
