vim.api.nvim_create_user_command("Caret", function()
  require("caret").open()
end, {})

