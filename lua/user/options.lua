local options = {
  backup = false,
  relativenumber = true,
  autoindent = true,
  tabstop = 4,
  shiftwidth = 4,
  smarttab = true,
  softtabstop = 4,
  mouse = "a",
  hlsearch = true,
  scrolloff = 8,
  swapfile = false,
  termguicolors = true,
  updatetime = 300	--Faster completion,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
