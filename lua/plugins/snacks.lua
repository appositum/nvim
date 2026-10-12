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
              position = "right"
            }
          }
        },
        gh_issue = {
        },
        gh_pr = {
        }
      }
    },
  },
  keys = {
    { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },

    { "\\", function()
      Snacks.picker.explorer({
        layout = {
          layout = {
            width = 30,
            min_width = 30,
            position = "right",
          }
        }
      })
    end, desc = "Open explorer (right)"
    },

    { "<C-\\>", function()
      require("snacks").picker.explorer({
        layout = {
          layout = {
            width = 30,
            min_width = 30,
            position = "left",
          }
        }
      })
    end, desc = "Open explorer (left)"
    },
  }
}
