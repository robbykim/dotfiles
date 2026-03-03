return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'catppuccin',
      section_separators = { left = '◣ ', right = '◀' },
      component_separators = { left = '', right = '|' },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          }
        }
      }
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        offsets = {
          { filetype = "neo-tree", text = "File Explorer", text_align = "center" }
        },
        indicator = {
          style = 'underline',
        },
      },
    },
  },
}
