-- local git_blame = require "gitblame"

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    -- options = {
    --   section_separators = "",
    --   component_separators = "",
    --   -- section_separators = { left = "", right = "" },
    --   -- component_separators = { left = "", right = "" },
    -- },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        "diagnostics",
        -- { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
      },
      lualine_c = { "filename" },
      lualine_x = { "filetype", "lsp_status" },
      lualine_y = { "searchcount" },
      -- lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
