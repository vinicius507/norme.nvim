local M = {}

M.should_lint = function ()
	local count = 1
	local pattern = "/%*%s+By:%s(%w+)%s<(.+)>%s+%+#%+%s+%+:%+%s+%+#%+%s+%*/"
	for line in io.lines(vim.fn.expand('%:p')) do
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
	return false
end

return M
