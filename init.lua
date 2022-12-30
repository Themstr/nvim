-- -- set options
-- if not vim.g.vscode then
-- end
if not vim.g.vscode then
  -- Startup Optimaztions
  vim.cmd("syntax off")
  vim.cmd("filetype off")
  vim.cmd("filetype plugin indent off")
  vimRTP=vim.opt.runtimepath:get()
  vim.opt.shadafile = "NONE"
  vim.opt.loadplugins = false
  vim.defer_fn(function()
    -- Renabling things
    vim.opt.shadafile = ""
    vim.opt.runtimepath = vimRTP
    vim.cmd("syntax on")
    vim.cmd("filetype on")
    vim.cmd("filetype plugin indent on")
    -- Set options
    require("plugins")
    require("options")
    require("keymaps")
  end,0)
end
