return {
  {
    'saghen/blink.nvim',
    build = 'cargo build --release', -- for delimiters
    keys = {
      -- tree
      { '<C-e>',     '<cmd>BlinkTree reveal<cr>',       desc = 'Reveal current file in tree' },
      { '<leader>e', '<cmd>BlinkTree toggle<cr>',       desc = 'Reveal current file in tree' },
      { '<leader>E', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
    },

    -- all modules handle lazy loading internally
    lazy = false,
    opts = {
      chartoggle = { enabled = true },
      indent = { enabled = true },
      tree = { enabled = true },
      cmp = { enabled = true },
    }
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
