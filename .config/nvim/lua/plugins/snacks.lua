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
      picker = {
        hidden = true,
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true,
            ignored = false,
            exclude = {
              "**/.git/*",
              "**/node_modules/*",
              "**/public/*",
              "**/.prompts/*",
              "**/.turbo/*",
              "**/*.class",
            },
          },
          grep = {
            hidden = true,
            ignored = false,
            exclude = {
              "**/.git/*",
              "**/node_modules/*",
              "**/public/*",
              "**/.prompts/*",
              "**/.turbo/*",
              "**/*.class",
            },
          },
        },
      },
    },
  },
}
