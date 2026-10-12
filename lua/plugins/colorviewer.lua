return {
  "appositum/colorviewer.nvim",
  config = function()
    require("colorviewer").setup({
      symbol = "■",
      highlight = {
        names = false,
      },
    })
  end,
}
