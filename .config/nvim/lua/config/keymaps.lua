-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("x", "p", '"_dP')

-- yd: copy file:line to clipboard
local function yd_normal()
  local loc = vim.fn.expand("%:.") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", loc)
  print(loc)
end

local function yd_visual()
  local file = vim.fn.expand("%:.")
  local s, e = vim.fn.line("v"), vim.fn.line(".")
  if s > e then
    s, e = e, s
  end
  local loc = file .. ":" .. s .. "-" .. e
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  vim.fn.setreg("+", loc)
  print(loc)
end

vim.keymap.set("n", "yd", yd_normal)
vim.keymap.set("x", "yd", yd_visual)
