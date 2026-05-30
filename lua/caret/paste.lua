local M = {}

function M.paste(text, callback)
    vim.system( { "curl", "-s", "-X", "POST", "--data-binary", text, "https://paste.rs" }, { text = true }, function(result)
        if result.code ~= 0 then
            vim.schedule(function()
                vim.notify(result.stderr or "error", vim.log.levels.WARN)
            end)
            return
        end
        vim.schedule(function()
            callback(result.stdout)
        end)
    end)
end

return M
