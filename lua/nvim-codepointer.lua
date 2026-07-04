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

	local function get_linenum_pos()
		local cursor_tbl = vim.api.nvim_win_get_cursor(0)
		return cursor_tbl[1] -- { line_num, col_num }
	end

	local project_file_path = get_project_file_path()
	local line_number = get_linenum_pos()
	return project_file_path .. ":" .. line_number
end

function M.print_codepointer()
	vim.print(M.get_codepointer())
end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("CodePointer", M.print_codepointer, {})

	local keymap = opts.keymap or "<leader>cp"
	vim.keymap.set("n", keymap, M.get_codepointer, {
		desc = "Create a [C]ode[P]ointer for current file and line",
		silent = true,
	})
end

return M
