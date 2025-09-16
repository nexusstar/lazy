local footer = function()
  local info = {}
  local fortune = require("fortune").get_fortune()
  info[1] = "  Neovim loaded " .. vim.fn.strftime("%H:%M") .. " on " .. vim.fn.strftime("%d/%m/%Y") .. " '"
  local footer = vim.list_extend(info, fortune)
  return footer
end

local header = [[
             _
  /\  /\___ (_)   []___  
 / /_/ / _ \| |  /    /\ 
/ __  |  __/| | /____/__\
\/ /_/ \____/ | |[][]||||
          |__ /           
        ]]

return {
  {
    "rubiin/fortune.nvim",
    opts = {
      display_type = "short",
      content_type = "quotes",
    },
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        -- dashboard configuration
        preset = {
          header = header,
        },
      },
    },
  },
}
