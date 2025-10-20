return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "json5" } },
  },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {

        jsonls = {
          -- lazy-load schemastore when needed
          before_init = function(_, new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
      },
      setup = {},
    },
  },
}
