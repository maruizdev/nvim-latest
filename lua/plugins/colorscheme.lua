--[[ local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end ]]
return {
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
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup {
                -- optional configuration here
                style = 'vulgaris',
                colors = {
                    bright_orange = '#ff8800', -- define a new color
                    green = '#00ffaa',         -- redefine an existing color
                },
            }
            require('bamboo').load()
        end,
    },
}
