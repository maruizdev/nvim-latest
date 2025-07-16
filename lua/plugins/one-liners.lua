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
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            theme = 'gruvbox-material'
        }

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
    },
    {
        'stevearc/aerial.nvim',
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require('aerial').setup({
                icons = {
                    -- Puedes personalizar iconos por tipo si quieres
                    Function = '󰊕',
                    Method = '󰆧',
                    Class = '󰠱',
                    Variable = '󰫧',
                    Interface = '',
                    Module = '',
                    Namespace = '󰌗',
                },
                filter_kind = {
                    "Function",
                    "Method",
                    "Constructor",
                    "Interface",
                    "Class",
                    "Module",
                },
                show_guides = true,
                layout = {
                    max_width = { 40, 0.2 },
                    min_width = 20,
                    default_direction = "right",
                },
            })
        end
    },

}
