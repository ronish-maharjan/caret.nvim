local M = {}

M.defaults = {
    relative="editor",
    width = 80,
    height = 10,
    border = "rounded",
    title = "caret",
    title_pos = "center"
}

M.options = {}


-- Setup function 

function M.setup(opts)
    opts = opts or {}
    local editor_height = vim.o.lines
    local editor_width = vim.o.columns
    M.options = vim.tbl_extend("force",M.defaults,opts)
    M.options.row = math.floor((editor_height - M.options.height)/2)
    M.options.col = math.floor((editor_width - M.options.width)/2)
end

M.setup({row = 33})

vim.print(M.options)

return M
