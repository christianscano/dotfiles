return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
  },

  dependencies = {
    {
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    },
  },
}
