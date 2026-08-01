-- load defaults i.e lua_lsp (NvChad’s built-in setup)
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- servers that just use NvChad defaults
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  -- Override/extend the config for each server
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })

  -- Enable the server so it actually starts
  vim.lsp.enable(lsp)
end

-- Clojure LSP with your custom on_attach
vim.lsp.config("clojure_lsp", {
  -- wrap NvChad's on_attach so you KEEP its mappings + your own
  on_attach = function(client, bufnr)
    if nvlsp.on_attach then
      nvlsp.on_attach(client, bufnr)
    end

    -- your custom keybinding
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,

  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})

vim.lsp.enable("clojure_lsp")
