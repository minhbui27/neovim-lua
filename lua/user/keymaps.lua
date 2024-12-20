local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Visual --
-- Hit <CR> key to stop highlight
keymap("n", "<CR>", ":noh<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- When pasting from yank dont replace the current yank register
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Keymaps for nvim tree
keymap("n", "<C-f>", ":NvimTreeToggle <CR>", opts)
keymap("n", "<C-n>", ":NvimTreeFocus <CR>", opts)

-- Keymaps for bufferline navigation
keymap("n", "<C-p>", ":BufferLinePick <CR>", opts)
keymap("n", "<A-.>", ":BufferLineCycleNext <CR>", opts)
keymap("n", "<A-,>", ":BufferLineCyclePrev <CR>", opts)
keymap("n", "<A-c>", ":BufferLineCyclePrev <CR> :BufferLineCloseRight <CR>", opts)

-- Formatting with lsp and null-ls
keymap("n", "<leader>f", ":lua vim.lsp.buf.format() <CR>", opts)

-- Center center of screen when C-u C-d jumping
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
