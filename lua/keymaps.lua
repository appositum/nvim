-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set(
  "n",
  "k",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { desc = "Move up through wrapped lines", expr = true }
)
vim.keymap.set(
  "n",
  "j",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { desc = "Move down through wrapped lines", expr = true }
)

vim.keymap.set("n", "x", '"_x', { desc = "Delete without copying" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Insert bottom newline" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert top newline" })
vim.keymap.set("n", "<C-S>", "<cmd>write<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>mj", '"zdd"zp', { desc = "Move line down" })
vim.keymap.set("n", "<leader>mk", '"zddk"zP', { desc = "Move line up" })
vim.keymap.set("n", "<C-x>", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>buffer #<cr>", { desc = "Switch back to last buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>'", "cw'<Esc>pa'<Esc>", { desc = "Wrap next word in single quotes" })
vim.keymap.set("n", '<leader>"', 'cw"<Esc>pa"<Esc>', { desc = "Wrap next word in double quotes" })
vim.keymap.set("n", "<leader>r", ":FTermRun ", { desc = "Run command in floating terminal" })
vim.keymap.set("n", ";", ":")

vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move left (insert mode)" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move right (insert mode)" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move down (insert mode)" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move up (insert mode)" })

vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move foward by char (insert mode)" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move backward by char (insert mode)" })

vim.keymap.set("i", "<A-f>", "<S-Right>", { desc = "Move foward by word (insert mode)" })
vim.keymap.set("i", "<A-b>", "<S-Left>", { desc = "Move backward by word (insert mode)" })
vim.keymap.set("i", "<A-d>", '<C-o>"_dw', { desc = "Delete next word (insert mode)" }) -- opposite of Ctrl + W

vim.keymap.set("i", "<C-a>", "<Esc>I", { desc = "Go to line start (insert mode)" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Go to line end (insert mode)" })
vim.keymap.set("i", "<C-d>", "<Delete>", { desc = "Delete (insert mode)" }) -- opposite of Ctrl + H
vim.keymap.set("i", "<C-k>", '<C-o>"_D', { desc = "Delete from cursor to line end (insert mode)" }) -- opposite of Ctrl + U

vim.keymap.set("v", "<", "<gv", { desc = "Indent line" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line" })

vim.keymap.set("x", "p", "P", { desc = "Paste without yanking in visual mode" })

vim.keymap.set("n", "<leader>l", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic floating window" })

vim.keymap.set("n", "L", function()
  vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })

  vim.api.nvim_create_autocmd("CursorMoved", {
    group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
    callback = function()
      vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
      return true
    end,
  })
end, { desc = "Open diagnostic line" })
