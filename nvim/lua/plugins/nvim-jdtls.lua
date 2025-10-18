if true then
  return {}
end
return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = function()
    local jdtls = require("jdtls")

    -- Determine OS-specific config directory
    local home = os.getenv("HOME")
    local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

    -- Get the java command path
    local java_cmd = "java"
    if vim.fn.executable("java") == 0 then
      vim.notify("Java executable not found in PATH", vim.log.levels.ERROR)
      return {}
    end

    local config = {
      cmd = {
        java_cmd,
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        jdtls_path .. "/config_" .. (vim.fn.has("mac") == 1 and "mac" or "linux"),
        "-data",
        workspace_dir,
      },

      root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

      settings = {
        java = {
          eclipse = {
            downloadSources = true,
          },
          configuration = {
            updateBuildConfiguration = "interactive",
            runtimes = {
              -- Configure your Java runtimes here, e.g.:
              -- {
              --   name = "JavaSE-17",
              --   path = "/usr/lib/jvm/java-17-openjdk",
              -- },
            },
          },
          maven = {
            downloadSources = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          format = {
            enabled = true,
          },
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
        },
      },

      init_options = {
        bundles = {},
      },

      on_attach = function(client, bufnr)
        -- Enable keybindings for jdtls-specific commands
        vim.keymap.set("n", "<leader>co", jdtls.organize_imports, { desc = "Organize Imports", buffer = bufnr })
        vim.keymap.set("n", "<leader>ct", jdtls.test_class, { desc = "Test Class", buffer = bufnr })
        vim.keymap.set("n", "<leader>cn", jdtls.test_nearest_method, { desc = "Test Nearest Method", buffer = bufnr })
        vim.keymap.set("v", "<leader>ce", jdtls.extract_variable, { desc = "Extract Variable", buffer = bufnr })
        vim.keymap.set("n", "<leader>ce", jdtls.extract_variable, { desc = "Extract Variable", buffer = bufnr })
        vim.keymap.set("v", "<leader>cm", jdtls.extract_method, { desc = "Extract Method", buffer = bufnr })
      end,
    }

    return config
  end,
  config = function(_, opts)
    -- Attach jdtls on FileType java
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach(opts)
      end,
    })
  end,
}
