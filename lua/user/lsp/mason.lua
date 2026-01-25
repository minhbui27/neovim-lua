-- servers that needs to be setup (lspconfig names)
local servers = {
	"lua_ls",
	"pyright",
	"jsonls",
	"ts_ls",
	"clangd",
	"jdtls",
	"tailwindcss",
	"rust_analyzer",
	"verible_verilog_ls",
}

-- mason-lspconfig names (for ensure_installed)
local mason_servers = {
	"lua_ls",
	"pyright",
	"jsonls",
	"ts_ls",
	"clangd",
	"jdtls",
	"tailwindcss",
	"rust_analyzer",
	-- verible is installed separately via :MasonInstall verible
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = mason_servers,
	automatic_installation = true,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	vim.lsp.config[server] = opts
	vim.lsp.enable(server)
end
