-- OPTIONS
local set = vim.opt

--line nums
-- set.relativenumber = true
set.number = true

-- indentation and tabs
set.tabstop = 2
set.shiftwidth = 2
set.autoindent = true
set.expandtab = true

-- search settings
set.ignorecase = true
set.smartcase = true

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- cursor line
set.cursorline = true

-- 80th column
-- set.colorcolumn = "80"

-- clipboard
set.clipboard:append("unnamedplus")

-- backspace
set.backspace = "indent,eol,start"

-- split windows
set.splitbelow = true
set.splitright = true

-- dw/diw/ciw works on full-word
set.iskeyword:append("-")

-- keep cursor at least 8 rows from top/bot
set.scrolloff = 8

-- undo dir settings
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- set.undofile = true

-- incremental search
set.incsearch = true

-- faster cursor hold
set.updatetime = 50

-- vim.cmd("colorscheme vscode")
--[[ vim.o.tabline = "%!v:lua.TabLine()"

function _G.TabLine()
    local s = ''
    for i = 1, vim.fn.tabpagenr('$') do
        local winnr = vim.fn.tabpagewinnr(i)
        local buflist = vim.fn.tabpagebuflist(i)
        local bufnr = buflist[winnr]
        local path = vim.fn.bufname(bufnr)

        local display
        if path == '' then
            display = '[No Name]'
        else
            local dir = vim.fn.fnamemodify(path, ':h:t') -- último directorio
            local file = vim.fn.fnamemodify(path, ':t')  -- nombre del archivo
            display = dir .. '/' .. file
        end

        if i == vim.fn.tabpagenr() then
            s = s .. '%#TabLineSel#'
        else
            s = s .. '%#TabLine#'
        end
        s = s .. '%' .. i .. 'T' .. ' ' .. i .. ': ' .. display .. ' '
    end
    s = s .. '%#TabLineFill#'
    return s
end

vim.o.hidden = false
vim.o.autowrite = false
-- Al cerrar la tab, elimina los buffers que estaban en esa tab
vim.api.nvim_create_autocmd("TabClosed", {
    pattern = "*",
    command = "bwipeout",
})
local previous_buf = nil
local previous_was_nvimtree = false
local previous_tab = nil

vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        previous_buf = buf
        previous_was_nvimtree = vim.bo[buf].filetype == "NvimTree"
        previous_tab = vim.api.nvim_get_current_tabpage()
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        local new_buf = args.buf
        local current_tab = vim.api.nvim_get_current_tabpage()

        if previous_buf and previous_was_nvimtree and previous_tab == current_tab then
            if vim.api.nvim_buf_is_loaded(previous_buf) then
                vim.cmd("silent! bwipeout " .. previous_buf)
            end
        end

        previous_buf = new_buf
        previous_was_nvimtree = false
        previous_tab = current_tab
    end
}) ]]
