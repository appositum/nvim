return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    explorer = {
      replace_netrw = true,
    },
    gh = { enabled = true },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 30,
              min_width = 30,
              position = "right",
            },
          },
        },
        gh_issue = {},
        gh_pr = {},
      },
    },
  },
  keys = {
    -- Github
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },

    -- File tree explorer
    {
      "\\",
      function()
        Snacks.explorer({
          layout = {
            layout = {
              width = 30,
              min_width = 30,
              position = "right",
            },
          },
        })
      end,
      desc = "Open explorer (right)",
    },
    {
      "<C-\\>",
      function()
        Snacks.explorer({
          layout = {
            layout = {
              width = 30,
              min_width = 30,
              position = "left",
            },
          },
        })
      end,
      desc = "Open explorer (left)",
    },

    -- Fuzzy finder
    {
      "<leader><leader>",
      function()
        Snacks.picker.buffers({
          focus = "list", -- open in normal mode
          win = {
            input = {
              keys = {
                ["<leader>d"] = "bufdelete"
              },
            },
          }
        })
      end,
      desc = '[ ] fuzzy open buffers',
    },
    {
      "<leader>f?",
      function()
        Snacks.picker.help()
      end,
      desc = "[f]uzzy help",
    },
    {
      "<leader>fd",
      function()
        Snacks.picker.diagnostics({
          focus = "list",
        })
      end,
      desc = "[f]uzzy [d]iagnostics",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "[f]uzzy [f]iles",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_log()
      end,
      desc = "[f]uzzy [g]it log",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "[f]uzzy [k]eymaps",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.grep()
      end,
      desc = "[f]uzzy [l]ive grep",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent({
          focus = "list",
        })
      end,
      desc = '[f]uzzy [r]ecent files',
    },
    {
      "<leader>fR",
      function()
        Snacks.picker.resume()
      end,
      desc = "[f]uzzy [R]esume",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.lines()
      end,
      desc = "[f]uzzy [s]earch current buffer"
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep_word({
          focus = "list",
        })
      end,
      desc = "[f]uzzy current [w]ord",
    },

    -- LSP
    {
      "gld", function()
        -- To jump back, press <C-t>.
        Snacks.picker.lsp_definitions()
      end, desc = "[g]oto [d]efinition"
    },
    {
      "glD", function()
        Snacks.picker.lsp_declarations()
      end, desc = "[g]oto [D]eclaration"
    },
    {
      "gli", function()
        Snacks.picker.lsp_implementations({
          focus = "list"
        })
      end, desc = "[g]oto [i]mplementation"
    },
    {
      "glO", function()
        Snacks.picker.lsp_symbols()
      end, desc = "Open document symbols"
    },
    {
      "glr", function()
        Snacks.picker.lsp_references({
          focus = "list"
        })
      end, desc = "[g]oto [r]eferences"
    },
    {
      "glt", function()
        Snacks.picker.lsp_type_definitions({
          focus = "list"
        })
      end, desc = "[g]oto [t]ype definition"
    },
    {
      "glW", function()
        Snacks.picker.lsp_workspace_symbols()
      end, desc = "Open workspace symbols"
    },
  },
}
