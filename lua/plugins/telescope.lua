return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}
  },
  opts = {
    extensions = {
      fzf = {
        fuzy = true,                    -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        file_ignore_patterns = {"node%_modules/.*"}
      },
    },
  },
  config = function(opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
  end,
  keys = {
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_files({show_untracked = true})
      end,
      desc = "Telescope Git Files",
    },
    {
      "<leader>tb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Telescope Git status",
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Telescope Git commit in buffer",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Telescope Git branches",
    },
    {
      "<leader>tp",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Plugins",
          cwd = "~/.config/nvim/lua/plugins",
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            map("i", "<c-y>", function(prompt_bufnr)
              local new_plugin = action_state.get_current_line()

              actions.close(prompt_bufnr)
              vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
            end)

            return true
          end
        })
      end,
      desc = "Telescope View plugins",
    },
    {
      "<leader>tf",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope Find files",
    },
    {
      "<leader>th",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope Help",
    },
    {
      "<leader>td",
      function()
        require("telescope").extensions.file_browser.file_browser({path = "%:h:p", select_buffer = true})
      end,
      desc = "Telescope File browser",
    },
  },
}
