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
            'famiu/bufdelete.nvim'
        },
        config = function()
            require('bufferline').setup({
                options = {
                    offsets = {
                        {
                            -- filetype = "neo-tree",
                            filetype = "NvimTree",
                            text = "File Explorer", -- puedes cambiar esto
                            highlight = "Directory",
                            text_align = "center", -- o "left"
                            separator = true
                        }
                    },
                    separator_style = "slant", -- o "padded_slant", "thick", "thin"
                },
            })
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
            require("toggleterm").setup({

                size = function(term)
                    if term.direction == "horizontal" then
                        return 15       -- alto de la terminal horizontal en líneas
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.25 -- 35% del ancho de la ventana para vertical
                    end
                end,
                persist_size = false, -- <--- importante
            })

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
        -- branch = "nvim-0.11",
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
                    "Variable"
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
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
        }
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("rainbow-delimiters.setup")()
        end
    },
    {
        "folke/zen-mode.nvim",
        opts = {
        }
    }

}
