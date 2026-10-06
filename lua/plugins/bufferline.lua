return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      highlights = {
        indicator_selected = {
          fg = "#7E9CD8", -- kanagawa
        },
      },
      options = {},
    })
  end,
}
