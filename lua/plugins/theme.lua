return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    opts = {
      flavor = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        if vim.g.colors_name == "catppuccin" then
          opts.highlights = require("catppuccin.special.bufferline").get_theme()
        end
      end,
    },
  },
}
