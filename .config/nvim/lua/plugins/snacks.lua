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
        hidden = true,
        ignored = true,
      },
      picker = {
        hidden = true,
        ignored = true,
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = {
              "**/.git/*",
              "**/node_modules/*",
              "**/.turbo/*",
              "**/*.class",
            },
          },
        },
      },
    },
  },
}
