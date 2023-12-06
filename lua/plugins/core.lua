-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore


-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  --Faster escape when on home row
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    'knubie/vim-kitty-navigator',
  },
  
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    enabled = false,
  },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "descending",
        winblend = 0,
      },
    },
  },
  {
   'jinh0/eyeliner.nvim',
    config = function()
    require'eyeliner'.setup {
      highlight_on_key = true, -- show highlights only after keypress
      dim = false              -- dim all other characters if set to true (recommended!)
    }
  end
  },
  --for mini map on right side
  {
    'wfxr/minimap.vim',
    keys = {
      -- stylua: ignore
      { '<leader>mm', '<cmd>MinimapToggle<cr>', desc = 'Minimap Toggle' },
    },

  },
  -- {
  --ii 
  --   'edluffy/hologram.nvim',
  --   opts = {
  --     auto_display = true,
  --   },
  -- },
  

 {"/xiyaowong/telescope-emoji.nvim"},

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
    -- add any custom options here
    },
    keys = {
      -- stylua: ignore
      { '<leader>ss', '<cmd>lua require("persistence").load()<cr>', desc = 'Load last session' },
      { '<leader>sd', '<cmd>lua require("persistence").stop()<cr>', desc = 'Stop persistence' },
      { '<leader>sc', '<cmd>lua require("persistence").close()<cr>', desc = 'Close session' },
    },
   },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("emoji")
      end,
    },
  },

}
