-- Which key helper
return {
  {
    "folke/which-key.nvim",
    lazy = false,
    opts = {
      preset = "classic",
    },
    keys = {
      { "<leader>f", name = "+find" },
      { "<leader>g", name = "+git" },
      { "<leader>n", name = "+notifications" },
      { "<leader>s", name = "+search" },

      {
        "<leader>w",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
