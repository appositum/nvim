return {
  "vimwiki/vimwiki",
  -- event = 'BufEnter *.md',
  -- keys = { '<leader>ww', '<leader>wt'},
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/Nextcloud/Notas/",
        syntax = "markdown",
        ext = "md",
      },
    }
  end,
}
