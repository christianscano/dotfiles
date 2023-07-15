local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
	  "linux-cultist/venv-selector.nvim",
	  dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim"
    },
	  config = true,
	  event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  },

  {
    "neovim/nvim-lspconfig",
    -- BufRead is to make sure if you do nvim some_file then this is still going to be loaded
    event = { "VeryLazy", "BufRead" },
    config = function() end, -- Override to make sure load order is correct
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function(plugin, opts)
          require("configs.mason-lspconfig").setup(plugin, opts)
        end,
      },
      "williamboman/mason-lspconfig",
      -- TODO: Add mason-null-ls? mason-dap?
    }
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  -- To use a extras plugin
  { import = "custom.configs.extras.diffview", },
}

return plugins
