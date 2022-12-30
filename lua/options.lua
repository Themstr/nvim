local options = {
  guicursor = "",
  nu = true,
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  wrap = false,
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = false,
  hlsearch = false,
  incsearch = true,
  termguicolors = true,
  scrolloff = 8,
  signcolumn = "yes",
  updatetime = 50,
}
vim.opt.isfname:append("@-@")
for key, value in pairs(options) do
  vim.opt[key] = value
end
