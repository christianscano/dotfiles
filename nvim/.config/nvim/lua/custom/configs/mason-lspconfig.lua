local M = {}

M.setup = function(_, opts)
  local on_attach     = require("plugins.configs.lspconfig").on_attach
  local capabilities  = require("plugins.configs.lspconfig").capabilities

  local lspconfig     = require "lspconfig"

  require("mason").setup(opts)
  require("mason-lspconfig").setup()
  -- require("mason-lspconfig").setup({
  --   ensure_installed = servers,
  -- }------   )
-- 
  -- This will setup lsp for servers you listed above
  -- And servers you install through mason UI
  -- So defining servers in the list above is optional
  require("mason-lspconfig").setup_handlers({
    -- Default setup for all servers, unless a custom one is defined below
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- Add your oth eer things here
          -- Example being format on save or something
        end,
        capabilities = capabilities,
      })
    end,
    -- custom setup for a server goes after the function above
    -- Another example with clangd
    -- Users usually run into different offset_encodings issue, 
    -- so this is how to bypass it (kindof)
    ["clangd"] = function()
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--offset-encoding=utf-16", -- To match null-ls
          --  With this, you can configure server with 
          --    - .clangd files
          --    - global clangd/config.yaml files
          --  Read the `--enable-config` option in `clangd --help` for more information
          "--enable-config",
        },
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      })
    end,
    -- python stuff
    ["pylsp"] = function ()
      lspconfig.pylsp.setup({
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        settings = {
          -- configure plugins in pylsp
          pylsp = {
            plugins = {
              -- pyflakes = {enabled = false},
              -- pylint = {enabled = false},
              pycodestyle = {enabled = false},
              -- pydocstyle = {enabled = false},
              -- mccabe = {enabled = false},
            },
          },
        },
      })
    end,
    -- Example: disable auto configuring an LSP
    -- Here, we disable lua_ls so we can use NvChad's default config
    ["lua_ls"] = function() end,
  })
end

return M

