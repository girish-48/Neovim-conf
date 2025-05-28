return {
  -- Comments
  {
    "numToStr/Comment.nvim",
  },

  -- Autopairing brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
      check_ts = true,
    },
  },

  -- Tree Sitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "python",
          "bash",
          "cpp",
          "json",
          "markdown",
        },
        highlight = {
          enable = true, -- syntax highlighting
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

  -- Which key helper
  {
    "folke/which-key.nvim",
    lazy = false,
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

      on_highlights = function(hl, c)
        hl.LineNrAbove = { fg = "#737994" }
        hl.LineNrBelow = { fg = "#737994" } -- Inactive line numbers
        hl.CursorLineNr = { fg = c.red }    -- Active line number (cursor line)
      end,
    },
    init = function()
      vim.o.number = true
      vim.o.cursorline = true
      vim.o.cursorlineopt = "number"
      vim.o.signcolumn = "yes:1"
      vim.o.numberwidth = 4
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  -- Lualine status line
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   lazy = false,
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   opts = {
  --     icons_enabled        = true,
  --     theme                = "auto",
  --     tabline              = {},
  --     winbar               = {},
  --     inactive_winbar      = {},
  --     extensions           = {},
  --   },
  -- },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled        = true,
        theme                = "auto",
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  }
}
