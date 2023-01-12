local M = {}

function M.enable()
	require("null-ls").enable({ name = "norme.nvim" })
end

function M.disable()
	require("null-ls").disable({ name = "norme.nvim" })
end

function M.toggle()
	require("null-ls").toggle({ name = "norme.nvim" })
end

return M
