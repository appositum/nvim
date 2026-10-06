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
    vim.keymap.set("n", "<leader>f?", builtin.help_tags, { desc = "[F]uzzy Help" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]uzzy [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]uzzy [F]iles" })
    vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]uzzy Select [T]elescope" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]uzzy current [W]ord" })
    vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "[F]uzzy [L]ive grep" })
    vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "[F]uzzy [G]it [C]ommits" })
    vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "[F]uzzy [G]it [S]tatus" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]uzzy [D]iagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]uzzy [R]esume" })
    vim.keymap.set("n", "<leader>fO", builtin.oldfiles, { desc = '[F]uzzy [O]ld Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>fo", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[F]uzz [o]pen Files" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set(
      "n",
      "<leader>fs",
      builtin.current_buffer_fuzzy_find,
      { desc = "[F]uzzily [S]earch in current buffer" }
    )

    -- in visual mode, search for the selected text with fuzzy live grep
    vim.keymap.set(
      "v",
      "<C-f>",
      'y<ESC>:let @0 = substitute(@0, " ", "\\\\\\\\ ", "g")<CR>:Telescope live_grep default_text=<c-r>0<CR>',
      { desc = "Fuzzy find selected text in live grep", noremap = true, silent = true }
    )

    vim.keymap.set(
      "v",
      "<C-s>",
      'y<ESC>:let @0 = substitute(@0, " ", "\\\\\\\\ ", "g")<CR>:Telescope current_buffer_fuzzy_find default_text=<c-r>0<CR>',
      { desc = "Fuzzy find selected text in current buffer", noremap = true, silent = true }
    )

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
