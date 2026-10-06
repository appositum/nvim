return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    MODE_MAP = {
      ["NORMAL"] = "N ",
      ["O-PENDING"] = "N?",
      ["INSERT"] = "I ",
      ["VISUAL"] = "V ",
      ["V-BLOCK"] = "VB",
      ["V-LINE"] = "VL",
      ["V-REPLACE"] = "VR",
      ["REPLACE"] = "R ",
      ["COMMAND"] = "! ",
      ["SHELL"] = "SH",
      ["TERMINAL"] = "T ",
      ["EX"] = "X ",
      ["S-BLOCK"] = "SB",
      ["S-LINE"] = "SL",
      ["SELECT"] = "S ",
      ["CONFIRM"] = "Y?",
      ["MORE"] = "M ",
    }
    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },

        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },

        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },

        -- component_separators = { left = '|', right = '|' },
        -- section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(s)
              return " " .. (MODE_MAP[s] or s)
            end,
          },
        },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            colored = false,
            separator = "",
            padding = {
              right = 0,
              left = 1,
            },
          },
          {
            "filename",
            symbols = {
              modified = "● ",
              readonly = "󰌾",
            },
            fmt = function(filename)
              local buffer_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
              local shell_name = buffer_name:match("^term.*/(.*)$")

              if shell_name then
                return "  " .. shell_name
              else
                return filename
              end
            end,
          },
        },
        lualine_c = {
          {
            "branch",
            icon = "",
            component_separators = "",
          },
          {
            "diff",
            symbols = {
              added = " ",
              -- modified = ' ',
              modified = " ",
              removed = " ",
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
            },
            component_separators = "", -- no | between icons and LSP: <lsp_name>
          },
          {
            -- symbols = {
            --   -- TODO: create function to get lsp status percentage
            --   spinners = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" }
            --   done = '',
            -- },
            function()
              local msg = ""
              local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
              local clients = vim.lsp.get_clients()

              if next(clients) == nil then
                return msg
              end

              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes

                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return msg .. " " .. client.name
                end
              end

              return msg
            end,
            color = function(_section)
              if next(vim.lsp.get_clients()) == nil then
                return { fg = "#45475a" }
              end
            end,
          },
        },
        lualine_y = {
          { -- current working directory name for the buffer, or session name if it exists
            function()
              local session = require("auto-session.lib").current_session_name(true)

              if session ~= "" then
                return " " .. session
              end

              local cwd = vim.fn.getcwd()

              if cwd == vim.fn.expand("$HOME") then
                return ""
              end

              local sep = package.config:sub(1, 1)
              local cwd_name = cwd:match("([^" .. sep .. "/]+)$")

              if cwd == "/" then
                cwd_name = "root"
              end

              return "󰉋 " .. cwd_name
            end,
          },
        },
        lualine_z = {
          -- 
          -- 
          -- 󰦪
          {
            "location",
            icon = "",
          },
        },
      },
    })
  end,
}
