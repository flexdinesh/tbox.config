-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
  -- { import = "astrocommunity.color.vim-highlighter" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.dracula-nvim" },
  -- { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  -- { import = "astrocommunity.fuzzy-finder.fzf-lua" },
  { import = "astrocommunity.git.git-blame-nvim" },
  -- { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.helm" },
  -- { import = "astrocommunity.recipes.auto-session-restore" },
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- { import = "astrocommunity.utility.hover-nvim" },
  -- { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  -- example of importing an entire language pack
  -- these packs can set up things such as Treesitter, Language Servers, additional language specific plugins, and more!
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.python" },
}
