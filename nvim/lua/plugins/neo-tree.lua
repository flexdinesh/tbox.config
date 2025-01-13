return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files and folders as dimmed
        hide_dotfiles = false, -- Show dotfiles explicitly
        hide_gitignored = false, -- Show gitignored files (set to `true` if you want them hidden)
      },
    },
  },
}
