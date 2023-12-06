return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      source_selector = {
        winbar = false,
        statusline = false,
      },
    },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.25 },
        },
      },
      animate = {
        enabled = false,
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = {
      name = "Terminal",
    },
    keys = {
      { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    },
  },

  {
    "stevearc/oil.nvim",
    opts = {
      use_default_keymaps = false,
      keymaps = {
        ["<Esc>"] = "actions.close",
        ["q"] = "actions.close",
        ["<CR>"] = "actions.select",
        ["g"] = "actions.select",
        ["b"] = "actions.parent",
        ["?"] = "actions.show_help",
        ["<C-p>"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",
        ["<C-t>"] = "actions.select_tab",

        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["<C-f>"] = "actions.change_sort",
        ["<C-e>"] = "actions.open_external",
        ["<C-.>"] = "actions.toggle_hidden",
      },
    },
    keys = {
      { "<leader>O", false },
      {
        "<leader>n",
        function()
          require("oil").open()
        end,
        desc = "Explorer in current file folder",
      },
    },
  },
}
