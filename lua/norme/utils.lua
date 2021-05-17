local M = {}

local file_exists = function(file)
	local f = io.open(file)
	if f then f:close() end
	return f ~= nil
end

M.should_lint = function ()
	local count = 1
	local pattern = "/%*%s+By:%s(%w+)%s<(.+)>%s+%+#%+%s+%+:%+%s+%+#%+%s+%*/"
	local file_path = vim.fn.expand('%:p')
	if file_exists(file_path) then
		for line in io.lines(file_path) do
			if count == 6 then
				local user, email = string.match(line, pattern)
				if user and email then
					return true
				else
					return false
				end
			end
			count = count + 1
		end
	end
	return false
end

return M
