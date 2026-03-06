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
--
--
-- Codecompanion keymaps
vim.keymap.set({ "n", "v" }, "<leader>oa", "<cmd>CodeCompanionActions<cr>", {
  noremap = true,
  silent = true,
  desc = "Open CodeCompanion Actions",
})
vim.keymap.set({ "n", "v" }, "<leader>oe", "<cmd>CodeCompanionChat Toggle<cr>", {
  noremap = true,
  silent = true,
  desc = "Toggle CodeCompanion Chat",
})
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", {
  noremap = true,
  silent = true,
  desc = "CodeCompanion Chat Add Selection",
})
vim.cmd([[cab cc CodeComapnion]]) -- expand 'cc' into ComodeCompanion in the command
