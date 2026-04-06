return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        auto_install = true,
        ensure_installed = {
          "lua",
          "vim",
          "javascript",
          "typescript", "tsx",
          "html",
          "css",
          "json",
          "bash",
          "markdown",
          "markdown_inline",
          "ruby",
          "rust",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          disable = { "ruby" },
        },
      }
    end,
  }
}
