local function is_obsidian()
  local cwd = vim.fn.getcwd()
  return cwd:match(vim.fn.expand("~/obsidian"))
end

local function get_picker_opts()
  local obsidian = is_obsidian()
  local exclude = obsidian and { "**/.git/*" } or {
    "**/.git/*",
    "**/node_modules/*",
    "**/public/*",
    "**/.prompts/*",
    "**/.turbo/*",
    "**/*.class",
  }

  return {
    hidden = true,
    sources = {
      explorer = {
        hidden = true,
        ignored = true,
      },
      files = {
        hidden = true,
        ignored = obsidian,
        exclude = exclude,
      },
      grep = {
        hidden = true,
        ignored = obsidian,
        exclude = exclude,
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
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
      },
      explorer = {
        replace_netrw = true,
      },
      picker = get_picker_opts(),
    },
  },
}
