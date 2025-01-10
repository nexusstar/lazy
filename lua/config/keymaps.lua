-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local gs = require("gitsigns")
-- ---- Set upercase on  insert mode with <ctr> + U (upercase)
-- absolutly love This
vim.keymap.set("i", "<C-u>", "<Esc>gUiw`]a", { desc = "To uppercase" })
vim.keymap.set("n", "<leader>s", ":w!<CR>", { desc = "Write buffer" })
-- vim.keymap.set("n", "<leader>gl", function()
--   gs.blame_line({ full = false })
-- end, { desc = "Blame Line" })
