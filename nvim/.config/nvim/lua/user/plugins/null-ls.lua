return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(_, opts)
		local null_ls = require("null-ls")
		opts.sources = {
			-- lua formatter
			null_ls.builtins.formatting.stylua,

			-- web stuff formatter
			null_ls.builtins.formatting.prettier,
			-- python formatter/linter
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort,
			null_ls.builtins.diagnostics.flake8,

			-- c/c++ formatter
			null_ls.builtins.formatting.clang_format,

			-- bash stuff
			null_ls.builtins.formatting.shfmt.with({
				args = { "-i", "2" },
			}),
			null_ls.builtins.diagnostics.shellcheck,

			-- docker linter
			null_ls.builtins.diagnostics.hadolint,

			-- It has been disabled since required `luarocks` in
			-- the local enviroment.
			--null_ls.builtins.diagnostics.luacheck,
		}
		return opts
	end,
}
