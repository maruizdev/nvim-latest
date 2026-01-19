return {
    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.lightline = {}
            -- vim.cmd("colorscheme gruvbox-material")
        end
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
                style = 'warmer'
            }
            -- Enable theme
            -- require('onedark').load()
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd("colorscheme kanagawa")
        end
    }
}
