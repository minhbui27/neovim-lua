local options = {
  backup = false,
	number = true,
  relativenumber = true,
  autoindent = true,
  tabstop = 2,
  shiftwidth = 2,
  smarttab = true,
  softtabstop = 2,
  mouse = "a",
  hlsearch = true,
  scrolloff = 8,
  swapfile = false,
  termguicolors = true,
  updatetime = 300,	--Faster completion
  foldcolumn = "1",
  foldlevel = 99,  -- start with all folds open
  foldlevelstart = 99,
  foldenable = true,
  foldmethod = "manual",
}

vim.opt.shortmess:append "c"
vim.opt.viewoptions:append("folds")  -- save fold state in views

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Automatically save and restore views (including folds)
vim.cmd([[
  augroup AutoSaveView
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]])
