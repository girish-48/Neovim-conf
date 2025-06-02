return {
  -- {
  --   "igorlfs/nvim-dap-view",
  --   ---@module 'dap-view'
  --   ---@type dapview.Config
  --   opts = require("plugins.mason.nvim_dap_view"),
  -- },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   dependencies = { "mfussenegger/nvim-dap" },
  --   event = "VeryLazy",
  --   opts = {
  --     handlers = {},
  --     ensure_installed = { "codelldb", "debugpy" }
  --   }
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   keys = {{
  --     "<leader>ds",
  --     function()
  --       local widgets = require("dap.ui.widgets")
  --       widgets.centered_float(widgets.scopes, { border = "rounded" })
  --     end,
  --     desc = "DAP Scopes",
  --   },},
  -- },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls", "pyright", "clangd" }, },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          PATH = "append",
          ui = {
            border = "double",
            icons = {
              package_installed = " ",
              package_pending = " ",
              package_uninstalled = " ",
            },
          },
        },
      },
      { "neovim/nvim-lspconfig", },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("null-ls").setup({})
      vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim", },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "black", "isort", "ruff", "stylua", "clang-format" },
        automatic_setup = true,
      })
    end,
  },
}
