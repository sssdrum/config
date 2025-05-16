return {
  "loctvl842/monokai-pro.nvim",
  config = function()
    print("Hello")
    require("monokai-pro").setup({
      transparent_background = false,
      terminal_colors = true,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      styles = {
        comment = { italic = true },
        keyword = { italic = true }, -- any other keyword
        type = { italic = true }, -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = true }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter passed in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in React.js
      },
      filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum

      -- Enable this to disable the filter option
      day_night = {
        enable = false, -- turned off by default
        day_filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
        night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
      },

      inc_search = "background", -- underline | background

      background_clear = {
        -- "float_win",
        "toggleterm",
        "telescope",
        -- "which-key",
        "renamer",
        "notify",
        -- "nvim-tree",
        -- "neo-tree",
        -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
      },

      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
        },
        indent_blankline = {
          context_highlight = "default", -- default | pro
          context_start_underline = false,
        },
      },

      ---@param cs Colorscheme
      ---@param p ColorschemeOptions
      ---@param Config MonokaiProOptions
      ---@param hp Helper
      override = function(cs, p, Config, hp)
        -- override logic goes here
      end,
    })
  end,
}
