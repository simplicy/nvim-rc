return {
    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and json
  {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',  
        'nvim-tree/nvim-web-devicons'     -- optional
    }
  },
  -- add any tools you want to have installed below
  { 'williamboman/mason-lspconfig.nvim' },
  {
    "williamboman/mason.nvim",
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

  {  "neovim/nvim-lspconfig",
        opts = {
          servers = {
            -- Ensure mason installs the server
            rust_analyzer = {
              keys = {
                { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
                { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
                { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
              },
              settings = {
                ["rust-analyzer"] = {
                  cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true,
                  },
                  -- Add clippy lints for Rust.
                  checkOnSave = {
                    allFeatures = true,
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                  },
                  procMacro = {
                    enable = true,
                    ignored = {
                      ["async-trait"] = { "async_trait" },
                      ["napi-derive"] = { "napi" },
                      ["async-recursion"] = { "async_recursion" },
                    },
                  },
                },
              },
            },
            taplo = {
              keys = {
                {
                  "K",
                  function()
                    if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                      require("crates").show_popup()
                    else
                      vim.lsp.buf.hover()
                    end
                  end,
                  desc = "Show Crate Documentation",
                },
              },
            },
          },
          setup = {
            rust_analyzer = function(_, opts)
              local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
              require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
              return true
            end,
          },
        },
      },

}
