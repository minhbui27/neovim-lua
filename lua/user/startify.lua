vim.g.startify_session_autoload = 1
-- let startify take care of buffers
vim.g.startify_session_delete_buffers = 1
-- use unicode 
vim.g.startify_fortune_use_unicode = 1
-- auto update sessions
vim.g.startify_session_persistence = 1
-- delete empty buffer upon quit
vim.g.startify_enable_special = 0
-- custom header
vim.g.startify_lists = {
	{ type = 'files',     header = {'   Files'}            },
	{ type = 'dir',       header =  {'   Current Directory '.. vim.fn.getcwd()} },
	{ type = 'sessions',  header = {'   Sessions'}      },
	{ type =  'bookmarks', header = {'   Bookmarks'}      },
}
vim.cmd([[
let g:startify_bookmarks = [
            \ { 'f': '~/src/f22/' },
            \ { 'a': '~/src/sae/astro-gauchoracing/' },
            \ { 'b': '~/.bashrc' },
            \ { 'c': '~/.config/' },
            \ { 'i': '~/.config/nvim/init.lua' },
            \ { 'l': '~/.config/nvim/lua/user/' }
            \ ]
let g:startify_custom_header = [
		\ ' __  __     _             _        (")                     _  _                              _ ',           
		\ '|  \/  |   (_)    _ _    | |_       \|     ___      o O O | \| |    ___     ___    __ __    (_)    _ __ ',   
		\ '| |\/| |   | |   | '' \   | | \           (_-<     o       | .` |   / -_)   / _ \   \ V /    | |   | ''  \ ',  
		\ '|_|__|_|  _|_|_  |_||_|  |_||_|   _____   /__/_   TS__[O] |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| ',
		\ '_|"""""|_|"""""|_|"""""|_|"""""|_|     |_|"""""| {======|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ',
		\ '"`-0-0-`"`-0-0-`"`-0-0-`"`-0-0-`"`-0-0-`"`-0-0-`./o--000`"`-0-0-`"`-0-0-`"`-0-0-`"`-0-0-`"`-0-0-`"`-0-0- ']
]])
