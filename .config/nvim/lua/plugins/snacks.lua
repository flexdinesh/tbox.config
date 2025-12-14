local picker_config = {
  global = {
    ignored = false,
    exclude = {
      "**/.git/*",
      "**/node_modules/*",
      "**/public/*",
      "**/dist/*",
      "**/build/*",
      "**/.prompts/*",
      "**/.turbo/*",
      "**/*.class",
    },
  },
  projects = {
    ["~/obsidian"] = {
      ignored = true,
      exclude = { "**/.git/*" },
    },
  },
}

local function get_picker_opts()
  local cwd = vim.fn.getcwd()
  local config = vim.deepcopy(picker_config.global)

  for path, overrides in pairs(picker_config.projects) do
    if cwd:match(vim.fn.expand(path)) then
      config = vim.tbl_deep_extend("force", config, overrides)
      break
    end
  end

  return {
    hidden = true,
    sources = {
      explorer = {
        hidden = true,
        ignored = true,
      },
      files = {
        hidden = true,
        ignored = config.ignored,
        exclude = config.exclude,
      },
      grep = {
        hidden = true,
        ignored = config.ignored,
        exclude = config.exclude,
      },
    },
  }
end

return {
  {
    "snacks.nvim",
    opts = {
      animate = {
        duration = { step = 15, total = 250 },
      },
      scroll = {
        enabled = true,
        delay = 100,
        duration = { step = 5, total = 50 },
      },
      explorer = {
        replace_netrw = true,
      },
      picker = get_picker_opts(),
    },
  },
}
