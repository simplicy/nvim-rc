return {
  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and json
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  -- add any tools you want to have installed below
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "codelldb",
        "rust-analyzer",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
