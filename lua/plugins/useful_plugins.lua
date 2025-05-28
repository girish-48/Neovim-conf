return {
  -- Create/modify/delete brackets : Very useful
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Join or Split arrays, strings ...
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup({ --[[ your config ]]
      })
    end,
  },

  -- Dashboard
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = true },
      explorer = { enabled = false },
    },
  },

  -- File Explorer and more
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").load_extension("file_browser")
      require('telescope').load_extension('advanced_git_search')
      require('telescope').load_extension('git_file_history')

      vim.keymap.set("n", "ff",
        function() require("telescope").extensions.file_browser.file_browser({ initial_mode = "normal" }) end,
        { desc = "True File Explorer" })
      vim.keymap.set("n", "fg", function() builtin.live_grep({ initial_mode = "normal" }) end,
        { desc = "Telescope live grep" })
      vim.keymap.set("n", "fb", function() builtin.buffers({ initial_mode = "normal" }) end,
        { desc = "Telescope buffers" })
      vim.keymap.set("n", "fh", function() builtin.help_tags({ initial_mode = "normal" }) end,
        { desc = "Telescope help tags" })
      vim.keymap.set("n", "git", require("telescope.builtin").builtin, { desc = "Telescope: Builtin pickers" })
    end,
  },
  -- Extension to file explorer
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "tpope/vim-fugitive", "sindrets/diffview.nvim" },
  },
  {
    "isak102/telescope-git-file-history.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
