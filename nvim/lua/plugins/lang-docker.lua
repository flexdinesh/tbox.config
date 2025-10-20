return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "hadolint" },
    },
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = vim.list_extend(opts.sources or {}, {
  --       nls.builtins.diagnostics.hadolint,
  --     })
  --   end,
  -- },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "dockerfile",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        dockerls = {},
        docker_compose_language_service = {},
      },
      setup = {},
    },
  },
}
