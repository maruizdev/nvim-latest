return {

    { -- Git plugin
        'tpope/vim-fugitive',
        cmd = { "G", "Git" },
        keys = {
            { "<leader>ga", ":Git fetch --all -p<cr>", desc = "Git fetch" },
            { "<leader>gl", ":Git pull<cr>",           desc = "Git pull" }
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                current_line_blame = true,

                current_line_blame_opts = {
                    delay = 1000,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                },

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

                --[[ vim.keymap.set('n', '<leader>gi', function()
                    require('gitsigns').blame_line({ full = false})
                end),
                { desc = 'Git Blame linea actuadl' } ]]
            })
        end
    },
    {
        --git diffview
        "sindrets/diffview.nvim"

    },
    --[[ {
        'f-person/git-blame.nvim',
        event = "VeryLazy",
        config = function()
            require('gitblame').setup ({

            })
        end

    } ]]

}
