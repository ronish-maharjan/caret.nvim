local M = {}

function M.paste(text, callback)
    vim.system(
        { "curl", "-s", "--data-binary", "@-", "https://paste.rs" },
        { text = true, stdin = text },
        function(result)
            if result.code ~= 0 then
                vim.schedule(function()
                    vim.notify(result.stderr or "error", vim.log.levels.WARN)
                end)
                return
            end
            vim.schedule(function()
                callback(result.stdout)
            end)
        end
    )
end

return M
