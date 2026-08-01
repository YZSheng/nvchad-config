return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "lua", "python", "racket", "scheme" }, -- Load Conjure for specific filetypes
    config = function()
      -- Optional: Add any additional Conjure configurations here
    end,
  },

  {
    "clojure-vim/vim-jack-in",
    ft = { "clojure" }, -- Load only for Clojure files
    config = function()
      -- Optional: Add any configurations for vim-jack-in here
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {
        enabled = true, -- Enable auto-save
        execution_message = {
          message = function()
            return "Auto-saved at " .. vim.fn.strftime "%H:%M:%S"
          end,
          dim = 0.18,
        },
        debounce_delay = 135, -- Delay (in ms) between changes and save
        conditions = {
          exists = true,
          modifiable = true,
        },
        write_all_buffers = false, -- Save only the active buffer
      }
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.mapping["<Tab>"] = nil
    end,
  },
}
