-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- save file like a sane person
map("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

map({ "i", "x", "n", "s", "o", "c" }, "<C-j>", "<C-n>")
map({ "i", "x", "n", "s", "o", "c" }, "<C-k>", "<C-p>")

-- Ctrl-g to escape
map({ "i", "x", "n", "s", "o", "c" }, "<C-g>", "<Esc>")

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>ws", "<C-W>s<cr><C-W>k", { desc = "Split window below", remap = true })
map("n", "<leader>wS", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>wv", "<C-W>v<cr><C-W>h", { desc = "Split window right", remap = true })
map("n", "<leader>wV", "<C-W>v", { desc = "Split window right", remap = true })

-- maximize
map("n", "<leader>wmm", "<C-W>_<cr><C-W>|", { desc = "Maximize window", remap = true })

-- Doom emacs window navigation
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })
-- resizing
map("n", "<leader>w<C-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<leader>w<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<leader>w<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<leader>w<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- magit
map("n", "<leader>gg", "<cmd>! magit<cr>", { desc = "Magit" })
