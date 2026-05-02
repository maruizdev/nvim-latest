return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true

        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
            -- vim.keymap.set('n', 't', api.node.open.tab, opts('Open'))
            vim.keymap.set('n', 's', api.node.open.vertical, opts('Open'))
            vim.keymap.set('n', '<s-s>', api.node.open.horizontal, opts('Open'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        end


        -- empty setup using defaults
        require("nvim-tree").setup({
            on_attach = my_on_attach,
            filters = { dotfiles = false },
            disable_netrw = true,
            hijack_cursor = true,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            view = {
                width = 40,
                preserve_window_proportions = true,
                float = {
                    enable = true,
                    quit_on_focus_loss = true,
                    open_win_config = {
                        relative = "editor",
                        border = "rounded",
                        width = 40,
                        height = 30,
                        row = 2,
                        col = 2,
                    },
                },
            },
            actions = {
                open_file = {
                    quit_on_open = true
                }
            },
            renderer = {
                root_folder_label = false,
                highlight_git = true,
                indent_markers = { enable = false },
                icons = {
                    glyphs = {
                        default = "󰈚",
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                        },
                        git = { unmerged = "" },
                    },
                },
            },
        })
    end
}
