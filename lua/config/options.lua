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

-- vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme vscode")
-- compile gcc
local Terminal = require("toggleterm.terminal").Terminal
--[[ vim.keymap.set("n", "<F5>", function()
    vim.cmd("w") -- guardar el archivo
    local filename = vim.fn.expand("%:t")
    local output = vim.fn.expand("%:t:r")
    vim.cmd("!gcc " .. filename .. " -o " .. output .. " && ./" .. output)
end, { noremap = true, silent = true }) ]]

vim.keymap.set("n", "<F5>", function()
    vim.cmd("w")                          -- Guarda el archivo
    local ft = vim.bo.filetype
    local filepath = vim.fn.expand("%:t") -- Ruta completa del archivo
    local output = vim.fn.expand("%:r")   -- Ruta del ejecutable (sin .c)

    -- local compile_cmd = string.format("gcc \"%s\" -o \"%s\"", filepath, output)
    -- local run_cmd = string.format("\"%s\"", output)
    -- local full_cmd = string.format("%s && %s", compile_cmd, run_cmd)

    local cmd = ""
    if ft == "c" then
        cmd = string.format("gcc \"%s\" -o \"%s\" && \"%s\"", filepath, output, output)
    elseif ft == "cpp" then
        cmd = string.format("g++ \"%s\" -o \"%s\" && \"%s\"", filepath, output, output)
    elseif ft == "java" then
        cmd = string.format("javac \"%s\" && java -cp \"%s\" %s", filepath, vim.fn.expand("%:p:h"), basename)
    elseif ft == "go" then
        cmd = string.format("go run \"%s\"", filepath)
    elseif ft == "python" then
        cmd = string.format("python3 \"%s\"", filepath)
    elseif ft == "ruby" then
        cmd = string.format("ruby \"%s\"", filepath)
    elseif ft == "sh" then
        cmd = string.format("bash \"%s\"", filepath)
    elseif ft == "lua" then
        cmd = string.format("lua \"%s\"", filepath)
    else
        vim.notify("Language not soported")
    end
    local term = Terminal:new({
        -- cmd = full_cmd,
        cmd = cmd,
        direction = "float",
        close_on_exit = false,
        hidden = true
    })
    term:toggle()
end, { noremap = true, silent = true })
