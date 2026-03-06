local header = [[
                   |"|                    
     ***          _|_|_          vvv      
    (o o)         (o o)         (0~0)     
ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-
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
