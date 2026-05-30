local M = {}

function M.create(opts)
    opts = opts or {}
    assert(opts.buf, "buf is required")
    assert(opts.config, "config is required")

    return vim.api.nvim_open_win(opts.buf, true, opts.config)
end

return M
