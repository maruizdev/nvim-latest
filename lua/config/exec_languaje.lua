local Terminal = require("toggleterm.terminal").Terminal

vim.keymap.set("n", "<F5>", function()
    vim.cmd("w")                          -- Guarda el archivo
    local ft = vim.bo.filetype
    local filepath = vim.fn.expand("%:t") -- Ruta completa del archivo
    local output = vim.fn.expand("%:r")   -- Ruta del ejecutable (sin .c)

    local cmd = ""
    if ft == "c" then
        -- cmd = string.format("gcc \"%s\" -o \"%s\" && \"%s\"", filepath, output, output)
        cmd = string.format("gcc \"%s\" -lm && ./a.out", filepath, output, output)
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
