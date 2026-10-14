return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>ss", "<cmd>AutoSession search<CR>", desc = "[s]ession [s]search" },
    { "<leader>sw", "<cmd>AutoSession save<CR>", desc = "[s]ession [w]rite" },
    { "<leader>sa", "<cmd>AutoSession toggle<CR>", desc = "[s]ession [a]utosave toggle" },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/" },
    session_lens = {
      picker = "snacks",
      mappings = {
        delete_session = { "n", "<leader>d" },
        copy_session = { "n", "<leader>y" },
      },
    },
  },
}
