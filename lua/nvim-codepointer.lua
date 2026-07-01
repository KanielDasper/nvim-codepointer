local M = {}

function M.codepointer(opts)
	local full_path = vim.fn.expand("%:p")
	local project_root = vim.fn.finddir(".git", full_path)
	vim.print(full_path)
end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("CodePointer", M.codepointer, {})

	local keymap = opts.keymap() or "<leader>cp"
	vim.keymap.set("n", keymap, M.codepointer, {
		desc = "Create a codepointer",
		silent = true,
	})
end

return M
