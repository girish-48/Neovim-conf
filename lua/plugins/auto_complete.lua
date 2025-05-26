return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "pylsp" },
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
      require("mason-null-ls").setup({
        ensure_installed = { "black", "isort", "ruff", "stylua" },
        automatic_setup = true,
      })
    end,
  },
}
