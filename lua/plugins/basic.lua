return {
 -- Comments
 {
    'numToStr/Comment.nvim',
 },

 -- Autopairing brackets
 {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {
	check_ts = true,
	}
 },

 -- Tree Sitter
 {
     "nvim-treesitter/nvim-treesitter",
     build = ":TSUpdate",
     event = { "BufReadPost", "BufNewFile" },
     config = function()
         require("nvim-treesitter.configs").setup({
             ensure_installed = {
                 "lua", "python", "bash", "cpp", "json", "markdown"
             },
             highlight = {
                 enable = true,              -- syntax highlighting
                 additional_vim_regex_highlighting = false,
             },
             indent = { enable = true },
             incremental_selection = {
                 enable = true,
                 keymaps = {
                     init_selection = "gnn",
                     node_incremental = "grn",
                     node_decremental = "grm",
                 },
             },
         })
     end,
 },

 -- File explorer Panel 
 -- {
 --      "nvim-tree/nvim-tree.lua",
 --      version = "*",
 --      lazy = false,
 --      dependencies = { "nvim-tree/nvim-web-devicons", },
 --      keys = {
 --       {
 -- 	      "<leader>e",
 -- 	      "<cmd>NvimTreeToggle<cr>",
 -- 	      desc = "Toggle File Explorer",
 --       },
 --      },
 --      config = function()
 --          require("nvim-tree").setup {}
 --          vim.cmd([[highlight CursorLine guibg=#2a2e36]])
 --      end,
 -- },

 -- Which key helper
 {
      "folke/which-key.nvim", 
      lazy=false,
      opts = {
          preset = "helix", -- Options are classic, modern and helix 
      },
      keys = {
          {
              "<leader>f",
              function()
                  require("which-key").show({ global = true })
              end,
              desc = "Buffer Local Keymaps (which-key)",
          },
      },
  },

 -- Tokyonight theme
  {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {
          style = "night",
          transparent = true,
          terminal_colors = true,
          lualine_bold = true,
          on_highlights = function(hl, colors)
              hl.LineNr = { fg = colors.red }
          end,
          on_colors = function(colors)
              colors.fg_gutter = "#b2b8cf"
              colors.fg_gutter = colors.blue
              colors.bg_highlight = colors.red
          end,
      },
      init = function()
          vim.cmd([[colorscheme tokyonight]])
      end,
  },

  -- Lualine status line
  {
      'nvim-lualine/lualine.nvim',
      lazy=false,
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = { 
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
      },
  },
}
