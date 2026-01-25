local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

-- nvim-treesitter now only handles parser installation
treesitter.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "systemverilog" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
})

-- Enable treesitter highlighting for all buffers with a parser
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		-- Skip treesitter highlighting for systemverilog/verilog
		local ft = vim.bo[args.buf].filetype
		if ft == "systemverilog" or ft == "verilog" then
			-- Still attach rainbow-delimiters (needs parser but not highlighting)
			local parser_ok = pcall(vim.treesitter.get_parser, args.buf)
			if parser_ok then
				local rd_ok, rd_lib = pcall(require, "rainbow-delimiters.lib")
				if rd_ok then
					rd_lib.attach(args.buf)
				end
			end
			return
		end

		local ok = pcall(vim.treesitter.start)
		if ok then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			-- Re-attach rainbow-delimiters after treesitter is started
			local rd_ok, rd_lib = pcall(require, "rainbow-delimiters.lib")
			if rd_ok then
				rd_lib.attach(args.buf)
			end
		end
	end,
})
