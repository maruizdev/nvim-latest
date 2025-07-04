return {
    { -- This helps with php/html for indentation
        'captbaritone/better-indent-support-for-php-with-html',
    },
    { -- This helps with ssh tunneling and copying to clipboard
        'ojroques/vim-oscyank',
    },
    { -- This generates docblocks
        'kkoomen/vim-doge',
        build = ':call doge#install()'
    },
    { -- Show historical versions of the file locally
        'mbbill/undotree',
    },
    { -- Show CSS Colors
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            -- 'famiu/bufdelete.nvim'
        },
        config = function()
            require('bufferline').setup {}
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup {
            }
        end
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
            vim.keymap.set("n", "<leader>th", function()
                vim.cmd("ToggleTerm direction=horizontal")
            end)
            vim.keymap.set("n", "<leader>tv", function()
                vim.cmd("ToggleTerm direction=vertical")
            end)
            vim.keymap.set("n", "<leader>tf", function()
                vim.cmd("ToggleTerm direction=float")
            end)
        end
    }
}
