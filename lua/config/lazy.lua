-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  install = { colorscheme = { "tokyonight-night" } },
  -- automatically check for plugin updates
  checker = { enabled = true, frequency = 86400, },
  change_detection = {
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  ui = {
    -- Modal-sized floating window (80% of screen)
    size = { width = 0.8, height = 0.8 },
    wrap = true,        -- Enable line wrapping
    border = "rounded", -- Rounded borders for a modern look
    backdrop = 20,      -- Slightly dim the background
    title = " Lazy Plugin Manager",
    title_pos = "center", -- Center the title for symmetry
    pills = true,       -- Highlight tabs with pill shapes

    icons = {
      cmd = " ",
      config = " ",
      debug = " ",
      event = " ",
      favorite = "★ ",
      ft = " ",
      import = " ",
      init = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "✔",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = "󰐊 ",
      task = " ",
      list = { "●", "➜", "★", "‒" },
    },
  }
})
