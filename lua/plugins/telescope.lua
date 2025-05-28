return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "isak102/telescope-git-file-history.nvim",
      { "aaronhallaert/advanced-git-search.nvim", dependencies = { "tpope/vim-fugitive", "sindrets/diffview.nvim" }, },
    },
    config = function()
      require('telescope').setup {
        extensions = { fzf = {},

          file_browser = {
            initial_mode = "normal",
            mappings = { ["n"] = { ["<BS>"] = require("telescope").extensions.file_browser.actions.goto_parent_dir, }, },
          },

        },
        defaults = {
          layout_config = {
            horizontal      = { width = 0.85, height = 0.9, preview_width = 0.6 },
            vertical        = { width = 0.8, height = 0.9, preview_height = 0.5 },
            prompt_position = "bottom",
          },
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          scroll_strategy = "cycle",
          dynamic_preview_title = true,
          border = true,
          prompt_prefix = " ",
          selection_caret = " ",
          -- entry_prefix = "  ",
        },
      }
      require("telescope").load_extension('fzf')
      require("telescope").load_extension("file_browser")
      require('telescope').load_extension('advanced_git_search')
      require('telescope').load_extension('git_file_history')
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "ff",
        function() require("telescope").extensions.file_browser.file_browser({ initial_mode = "normal" }) end,
        { desc = "True File Explorer" })
      vim.keymap.set("n", "fg", function() builtin.live_grep({ initial_mode = "insert" }) end,
        { desc = "Telescope live grep" })
      vim.keymap.set("n", "fb", function() builtin.buffers({ initial_mode = "normal" }) end,
        { desc = "Telescope buffers" })
      vim.keymap.set("n", "fh", function() builtin.help_tags({ initial_mode = "insert" }) end,
        { desc = "Telescope help tags" })
      vim.keymap.set("n", "git", require("telescope.builtin").builtin, { desc = "Telescope: Builtin pickers" })
      vim.keymap.set("n", "<leader>ep", function()
        builtin.find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
