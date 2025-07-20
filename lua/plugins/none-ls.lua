return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local none_ls = require("null-ls")
        local formatting = none_ls.builtins.formatting

        none_ls.setup({
            sources = {
                formatting.prettier.with({
                    filetypes = {
                        "html",
                        "htmlangular",
                        "typescript",
                        "typescriptreact",
                        "css",
                        "scss",
                        "javascript",
                        "jsx"
                    },
                }),
            },
        })
    end,
}
