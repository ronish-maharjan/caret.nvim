local M = {}

function M.create()
    local buf = vim.api.nvim_create_buf(true,true)

    -- some default options for buffer
    vim.api.nvim_buf_set_lines(buf,0,-1,false,{})
    vim.api.nvim_set_option_value("buftype","nofile",{buf = buf})
    vim.api.nvim_set_option_value("modifiable",true,{buf = buf})
    vim.api.nvim_set_option_value("bufhidden","wipe",{buf = buf})
    vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
    vim.api.nvim_buf_set_name(buf, "caret.nvim")

    return buf

end

return M

