return {
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
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
            },
          },
        },
      },
    },
  },
}
