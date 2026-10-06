return {
  "appositum/gh-dash.nvim",
  lazy = true,
  keys = {
    {
      "<leader>gh",
      function()
        require("gh_dash").toggle()
      end,
      desc = "Toggle gh-dash popup",
    },
  },
  opts = {
    keymaps = {}, -- disable internal mapping
    border = "rounded", -- or 'double'
    width = 0.9,
    height = 0.9,
    autoinstall = true,
  },
}
