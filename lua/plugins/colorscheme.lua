return {
    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.lightline = {}
            vim.cmd("colorscheme gruvbox-material")
        end
    },
}
