return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    { "\\", ":Neotree reveal right<CR>", desc = "NeoTree reveal", silent = true },
    { "<C-\\>", ":Neotree reveal left<CR>", desc = "NeoTree reveal", silent = true },
  },
  opts = {
    window = {
      width = 30,
    },
    filesystem = {
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
