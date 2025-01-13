return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function() require("telescope").load_extension "fzf" end,
    },
  },
  opts = {
    defaults = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        ".env*",
      },
      file_ignore_patterns = {
        "node_modules", -- Ignore node_modules
        "%.git", -- Ignore .git directory
      },
    },
    pickers = {
      find_files = {
        hidden = true, -- Show hidden files
        follow = true, -- Follow symbolic links
      },
    },
  },
}
