local window = require("caret.window")
local buffer = require("caret.buffer")
local state = require("caret.state")
local paster = require("caret.paste")
local config = require("caret.config")

local M = {}

----------------
-- Utils function 
----------------

local function getTextFromBuffer(buf)
    local lines = vim.api.nvim_buf_get_lines(buf,0,-1,false)
    local text = table.concat(lines, "\n")
    return text
end

local function setDefaultKeyMaps(buf)
    vim.keymap.set("n","q",M.close,{buffer=state.buf})
    vim.keymap.set("n","<CR>",M.paste,{buffer=state.buf})
end


-----------------------
-- Open function  
-----------------------

function M.Open()
    --check if the window is already open
    if state.win ~= nil and vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_set_current_win(state.win)
        return
    else
        if state.buf ~= nil and vim.api.nvim_buf_is_valid(state.buf) then
            state.win = window.create({buf=state.buf,config = config.options})
        else
            state.buf = buffer.create()

            -- some default keymaps
            setDefaultKeyMaps(state.buf)

            -- create the window
            state.win = window.create({buf = state.buf,config = config.options})
        end
    end
end


-----------------------
-- close function  
-----------------------

function M.close()
    if vim.api.nvim_buf_is_valid(state.buf) then
        vim.api.nvim_buf_delete(state.buf,{force = true})
        state.buf = nil
    end
    if vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_close(state.win,true)
        state.win = nil
    end
end


-----------------------
-- paste function  
-----------------------
local function pasteCallback(url)
    if not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
        return
    end
        vim.api.nvim_buf_set_lines(state.buf, 0, -1, false, { url })
end

function M.paste()
    local text = getTextFromBuffer(state.buf)
    vim.api.nvim_buf_set_lines(state.buf,0,-1,false,{"loading...."})
    paster.paste(text,pasteCallback)
end

return M


