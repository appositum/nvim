return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    })

    vim.cmd.colorscheme("kanagawa-wave")
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C0A36E" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#16161D" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#16161D" })
  end,
}
