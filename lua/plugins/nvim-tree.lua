return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "NvimTree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      api.config.mappings.default_on_attach(bufnr)

      ------------------------------------------------
      -- ABRIR
      ------------------------------------------------

      vim.keymap.set(
        "n",
        "s",
        api.node.open.vertical,
        opts("Abrir vertical")
      )

      vim.keymap.set(
        "n",
        "S",
        api.node.open.horizontal,
        opts("Abrir horizontal")
      )

      vim.keymap.set(
        "n",
        "?",
        api.tree.toggle_help,
        opts("Ayuda")
      )
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        -- importante:
        -- no quiero que Angular cambie constantemente
        -- la raíz del explorer
        update_root = false,
      },

      view = {
        width = 35,
        side = "left",
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
          -- VS Code mantiene Explorer visible
          quit_on_open = true,
          resize_window = true,
        },
      },

      filters = {
        dotfiles = false,
      },

      renderer = {
        root_folder_label = false,
        highlight_git = true,

        indent_markers = {
          enable = true,
        },

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

            git = {
              unmerged = "",
            },
          },
        },
      },
    })
  end,
}
