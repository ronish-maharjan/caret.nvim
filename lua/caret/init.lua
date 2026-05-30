local M = {}
local config = require("caret.config")
local core = require("caret.core")

function M.setup(opts)
    config.setup(opts)
end


function M.open()
    core.Open()
end

return M
