return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist
                            + actions.open_qflist,
                    },
                },
            },
        })

        --------------------------------------------------
        -- ARCHIVOS
        --------------------------------------------------

        -- Similar a Ctrl+P de VS Code
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {
            desc = "Buscar archivos",
        })

        -- Solo archivos Git
        vim.keymap.set("n", "<leader>fg", builtin.git_files, {
            desc = "Buscar archivos Git",
        })

        -- Archivos abiertos recientemente
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {
            desc = "Archivos recientes",
        })

        -- Buffers abiertos
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {
            desc = "Buffers",
        })

        --------------------------------------------------
        -- BÚSQUEDA GLOBAL
        --------------------------------------------------

        -- Similar a Ctrl+Shift+F de VS Code
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, {
            desc = "Buscar texto en proyecto",
        })

        -- Buscar palabra bajo el cursor
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, {
            desc = "Buscar palabra actual",
        })

        --------------------------------------------------
        -- LSP / ANGULAR
        --------------------------------------------------

        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {
            desc = "Referencias",
        })

        vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {
            desc = "Definiciones",
        })

        vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {
            desc = "Implementaciones",
        })

        vim.keymap.set("n", "<leader>fm", builtin.lsp_document_symbols, {
            desc = "Símbolos del archivo",
        })

        vim.keymap.set("n", "<leader>fM", builtin.lsp_workspace_symbols, {
            desc = "Símbolos del proyecto",
        })

        --------------------------------------------------
        -- OTROS
        --------------------------------------------------

        vim.keymap.set("n", "<leader>fq", builtin.quickfix, {
            desc = "Quickfix",
        })

        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
            desc = "Ayuda",
        })

        -- Buscar referencias al componente/archivo actual
        vim.keymap.set("n", "<leader>fc", function()
            local filename = vim.fn.expand("%:t:r")

            builtin.grep_string({
                search = filename,
            })
        end, {
            desc = "Buscar referencias al archivo actual",
        })

        -- Buscar configuración de Neovim
        vim.keymap.set("n", "<leader>fn", function()
            builtin.find_files({
                cwd = vim.fn.expand("~/.config/nvim"),
            })
        end, {
            desc = "Buscar configuración Neovim",
        })
    end,
}
