local M = {}

function M.codepointer()
	print("Start")
end

function M.setup()
	opts = opts or {}
	vim.api.nvim_create_user_command("CodePointer", M.codepointer, {})

	local keymap = opts.keymap() or "<leader>cp"

	vim.keymap.set("n", keymap, M.codepointer, {
		desc = "Create a codepointer",
		silent = true,
	})
end

return M
