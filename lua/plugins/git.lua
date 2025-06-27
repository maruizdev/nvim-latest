return {

    { -- Git plugin
        'tpope/vim-fugitive',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add          = { text = '+' },
                    change       = { text = '+' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signs_staged = {
                    add          = { text = '+' },
                    change       = { text = '+' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
            })
        end
    },
    {
        --git diffview
        "sindrets/diffview.nvim"

    },
    {
        'f-person/git-blame.nvim',
        event = "VeryLazy",
        config = function()
            require('gitblame').setup {
            }
        end

    }

}
