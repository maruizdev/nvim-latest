local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end
return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme tokyonight")
            enable_transparency()
        end
    },
    {
        'sainnhe/gruvbox-material',
        config = function()
            -- vim.cmd("colorscheme gruvbox-material")
            vim.g.gruvbox_material_background = "hard"
            vim.g.lightline = {}
            -- enable_transparency()
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
