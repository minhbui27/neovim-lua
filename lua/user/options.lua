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
  termguicolors = false,
  updatetime = 300	--Faster completion,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
