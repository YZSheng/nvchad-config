require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local wk = require("which-key")

wk.add({
  { "<leader>l", group = "LSP" }, -- Create an "LSP" group
  { "<leader>ln", function() vim.lsp.buf.rename() end, desc = "Rename symbol" }, -- Rename function
}, { mode = "n" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

