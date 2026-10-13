return {
  -- Fuzzy Finder
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Help keymaps:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?

    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup({
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      pickers = {
        buffers = {
          initial_mode = "normal",
          mappings = {
            n = {
              ["<leader>d"] = "delete_buffer",
              ["<leader>h"] = "file_split",
              ["<leader>v"] = "file_vsplit",
            },
          },
        },

        oldfiles = {
          initial_mode = "normal",
          mappings = {
            n = {
              ["<leader>h"] = "file_split",
              ["<leader>v"] = "file_vsplit",
            },
          },
        },

        grep_string = {
          initial_mode = "normal",
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
  end,
}
