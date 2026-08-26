return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup()

        local parsers = {
            -- Angular
            "typescript",
            "tsx",
            "html",
            "css",
            "scss",
            "javascript",
            "json",

            -- Config
            "yaml",

            -- Shell
            "bash",

            -- Editor
            "lua",
            "vim",
            "vimdoc",

            -- Git
            "gitignore",

            -- Markdown
            "markdown",
            "markdown_inline",

            -- Otros
            "php",
            "c",
            "go",
            "python",
            "dockerfile",
        }

        require("nvim-treesitter")
            .install(parsers)

        vim.api.nvim_create_autocmd(
            "FileType",
            {
                callback = function(args)
                    pcall(
                        vim.treesitter.start,
                        args.buf
                    )
                end,
            }
        )
    end
}
