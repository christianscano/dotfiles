-- use mason-lspconfig to configure LSP installations
return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		automatic_installation = true,
		ensure_installed = {
			-- linux stuff
			"bashls",
			"nginx_language_server",
			"docker_compose_language_service",
			"dockerls",

			-- lua stuff
			"lua_ls",

			-- rust stuff
			"rust_analyzer",

			-- elixir stuff
			"elixirls",

			-- python stuff
			"pylsp",
			"pyright",

			-- c/c++ stuff
			"clangd",

			-- web stuff
			"cssls",
			"html",
			"marksman",
			"tsserver",

			-- file stuff
			"jsonls",
			"yamlls",
		},
	},
}
