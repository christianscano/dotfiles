return {
	"jay-babu/mason-null-ls.nvim",
	opts = {
		automatic_installation = true,
		ensure_installed = {
			"black",
			"clang-format",
			"isort",
			"prettier",
			"shfmt",
			"stylua",
			"shellcheck",
			"hadolint",
		},
	},
}
