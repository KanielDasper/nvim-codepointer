vim.api.nvim_create_user_command("CodePointerInfo", function()
  vim.notify("Plugin is loaded!", vim.log.levels.WARN)
end, { desc = "Show info about codepointer plugin status" })
