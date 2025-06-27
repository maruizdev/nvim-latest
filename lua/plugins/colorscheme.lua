return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.lightline = {}
        end
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
}
