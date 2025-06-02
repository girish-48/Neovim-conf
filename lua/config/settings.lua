local set = vim.opt
set.expandtab = true
--set.smarttab = true
set.shiftwidth = 2
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.termguicolors = true

set.rnu = true
set.nu = true
set.hidden = true

vim.diagnostic.config({
  virtual_text = { prefix = "󱓻 ", spacing = 1, source = "if_many" },
  signs = {
    text = {

      [vim.diagnostic.severity.ERROR] = "󰅙 ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "always", header = "", prefix = "" },
})

vim.keymap.set("n", "L", ":Lazy<CR>", { desc = "Open Lazy UI" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>")      -- Save
  vim.keymap.set("v", "<D-c>", '"+y')         -- Copy
  vim.keymap.set("n", "<D-v>", '"+P')         -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P')         -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+")      -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

  vim.g.neovide_padding_top = 20

  vim.g.neovide_opacity = 1

  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 30.0
  vim.g.neovide_floating_blur_amount_y = 30.0
  vim.o.guifont = "JetBrainsMono Nerd Font:h15"
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5
end

vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
