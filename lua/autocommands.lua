-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- set relative number lines on normal mode but not insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  command = "set number norelativenumber",
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function(ev)
    -- remove line numbers in lazygit window
    if string.match(ev.file, "lazygit$") then
      vim.o.relativenumber = false
      vim.o.number = false
    else
      vim.o.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash",
    "c",
    "diff",
    "elixir",
    "haskell",
    "html",
    "javascript",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "typescript",
    "vim",
    "vimdoc",
  },
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})

local function split(s)
  local res = {}

  -- [^%s]+
  for word in string.gmatch(s, "%a+") do
    table.insert(res, word)
  end

  return res
end

vim.api.nvim_create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
vim.api.nvim_create_user_command("FTermExit", require("FTerm").exit, { bang = true })
vim.api.nvim_create_user_command("FTermRun", function(opts)
  local command = split(opts.args)

  -- NOTE: if the command fails, the FTerm window remains open and needs to be closed manually
  require("FTerm").scratch({ cmd = command })
end, { bang = true, nargs = "?" })
