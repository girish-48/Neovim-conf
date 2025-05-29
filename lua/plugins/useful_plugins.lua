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
    keys = { "<space>m", "<space>j", "<space>t" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup({ --[[ your config ]]
      })
    end,
  },
}
