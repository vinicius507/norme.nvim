local helpers = {}

---Checks if the École 42 header is present
---@param params table
---@return boolean
function helpers.check_header(params)
	-- Pattern used to check if the author line of the header is present
	local pattern = [[/%*%s+By:%s+.+%s+<.+>%s+%+#%+%s+%+:%+%s+%+#%+%s+%*/]]
	-- If the author line of the header is not present, the header is either
	-- missing or invalid
	if params.content[6] == nil or not params.content[6]:match(pattern) then
		return false
	end
	return true
end

return helpers
