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
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd("colorscheme kanagawa-dragon")
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- Puedes usar 'main', 'moon' o 'dawn'
        dark_variant = "moon",
      })
      vim.cmd("colorscheme rose-pine-main")
    end
  }
}
