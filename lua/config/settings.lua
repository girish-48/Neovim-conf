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

-- show diagnostics
vim.diagnostic.config({
  virtual_text = { prefix = "● ", spacing = 2, source = "if_many" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "always", header = "", prefix = "" },
})
-- Custom Gutter icons
-- local signs = {
--   Error = "",
--   Warn  = "",
--   Hint  = "",
--   Info  = "󰙎",
-- }
--
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
