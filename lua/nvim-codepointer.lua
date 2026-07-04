local M = {}

function M.get_codepointer()
	local function get_project_file_path()
		local current_file = vim.fs.basename(vim.api.nvim_buf_get_name(0))
		local codepointer_path_tbl = { current_file }

		for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
			table.insert(codepointer_path_tbl, 1, "/")
			table.insert(codepointer_path_tbl, 1, vim.fs.basename(dir))

			if vim.fn.isdirectory(dir .. "/.git") == 1 then
				break
			end
		end
		return table.concat(codepointer_path_tbl)
	end

	local function get_cursor_linenum()
		local cursor_tbl = vim.api.nvim_win_get_cursor(0)
		return cursor_tbl[1] -- { line_num, col_num }
	end

	return get_project_file_path() .. ":" .. get_cursor_linenum()
end

function M.set_codepointer_to_register()
	local codepointer = M.get_codepointer()
	vim.fn.setreg("+", codepointer)
	vim.print("CodePointer saved to the '+' register!")
end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("CodePointer", M.set_codepointer_to_register, {})

	local keymap = opts.keymap or "<leader>cp"
	vim.keymap.set("n", keymap, M.set_codepointer_to_register, {
		desc = "Create a [C]ode[P]ointer for current file and line",
		silent = true,
	})
end

return M
