-- Compatibility shim for deprecated function (packer.nvim uses it)
vim.tbl_islist = vim.islist

require "user.rainbow-delimiters" -- must be before plugins load
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.treesitter"
require "user.nvim-tree"
require "user.lualine"
require "user.bufferline"
require "user.transparent"
require "user.toggleterm"
require "user.telescope"
require "user.startify"
require "user.autopairs"
require "user.hex_editor"
require "user.csvview"
require "user.ufo"
