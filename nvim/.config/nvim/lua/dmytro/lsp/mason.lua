local status_ok, lsp_installer = pcall(require, "mason")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "tsserver", "cssls", "html", "yamlls", "dockerls" }

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("dmytro.lsp.handlers").on_attach,
		capabilities = require("dmytro.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "dmytro.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
