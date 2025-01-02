return {
  {
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
        file_ignore_patterns = { "node_modules", "%.git" },
        find_command = { "rg", "--files", "--hidden", "--no-ignore" },
      },
    },
  },
}
