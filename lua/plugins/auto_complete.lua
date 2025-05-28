return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "pylsp", "lua_ls" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        vim.lsp.enable("pyright"),
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}),
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" }),
      },
    },
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
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({ ensure_installed = { "black", "isort", "ruff", "stylua" }, automatic_setup = true })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
