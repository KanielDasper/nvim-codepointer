local M = {}

function M.codepointer()
	local full_path = vim.fn.expand("%:p")
	local project_root = vim.fn.finddir(".git", full_path)
	vim.print(full_path .. project_root)
end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("CodePointer", M.codepointer, {})

	local keymap = opts.keymap or "<leader>cp"
	vim.keymap.set("n", keymap, M.codepointer, {
		desc = "Create a codepointer for current file and line",
		silent = true,
	})
end

return M
