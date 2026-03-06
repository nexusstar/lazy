return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    opts = {
      log_level = "DEBUG",
    },
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          tools = {
            ["mcp"] = {
              callback = function()
                return require("mcpbug.extensions.codecompanion")
              end,
              opts = {
                requires_approval = true,
                temparature = 0.7,
              },
            },
            -- other tools for codecompanion goes here
          },
        },
        -- other strategies for codecompanion goes here
      },
    })
  end,
}
