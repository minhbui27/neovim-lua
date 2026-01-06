local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

-- Workaround for ft_to_lang being removed from nvim-treesitter
-- This prevents the error when using telescope previewer
local previewers = require('telescope.previewers')
local previewers_utils = require('telescope.previewers.utils')

-- Override the highlighter to use vim syntax instead of treesitter
local original_highlighter = previewers_utils.highlighter
previewers_utils.highlighter = function(bufnr, ft)
  -- Use vim regex syntax highlighting instead of treesitter
  if ft then
    pcall(vim.api.nvim_set_option_value, 'syntax', ft, { buf = bufnr })
  end
  return function() end  -- Return empty cleanup function
end

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
  },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
