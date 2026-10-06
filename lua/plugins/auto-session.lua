return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>ss", "<cmd>AutoSession search<CR>", desc = "[s]earch [s]ession" },
    { "<leader>sw", "<cmd>AutoSession save<CR>", desc = "Save session (write)" },
    { "<leader>sa", "<cmd>AutoSession toggle<CR>", desc = "Toggle [s]ession [a]utosave" },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/" },
    session_lens = {
      picker = "telescope",
      mappings = {
        delete_session = { "n", "<leader>d" },
        copy_session = { "n", "<leader>y" },
      },
      picker_opts = {
        initial_mode = "normal",
      },
    },
  },
}
