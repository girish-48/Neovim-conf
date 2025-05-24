return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {"pylsp"},
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        vim.lsp.enable('pyright'),
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
      },
    },
  },
}
