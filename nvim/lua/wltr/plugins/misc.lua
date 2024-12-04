return {
  'tpope/vim-surround',
  'tpope/vim-abolish',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'tpope/vim-speeddating',

  'junegunn/gv.vim',
  'junegunn/vim-slash',
  'junegunn/vim-peekaboo',

  {
    'junegunn/goyo.vim',
    config = function()
      vim.g.goyo_width = 120
      vim.g.goyo_height = '100%'
      vim.g.goyo_linenr = 1
    end
  },

  {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd([[
      let g:easy_align_delimiters = {
      \ '(': {
      \     'pattern': '(',
      \     'left_margin': 1,
      \     'right_margin': 0
      \   }
      \ }
      ]])
    end
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },

  {
    'folke/todo-comments.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = {
      keywords = {
        HACK = {alt = {'DEBUG'}}
      },
      highlight = {
        keyword = 'bg',
        pattern = [[.*<(KEYWORDS)\s*(\([A-Z]{2,4}-[0-9]{1,6}\))*\s*:*]]
      }
    }
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = {width = 60},
      actions = {
        open_file = {
          resize_window = false
        }
      }
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
      options = {
        theme = 'catppuccin-frappe',
        section_separators = '',
        component_separators = ''
      }
    }
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require('bufferline')
      bufferline.setup({
        options = {
          style_preset = bufferline.style_preset.no_italic,
          themable = true,
          color_icons = true,
          always_show_bufferline = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = 'thin'
        }
      })
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      scope = {
        show_start = false,
        show_end = false
      }
    }
  },

  {'j-hui/fidget.nvim', config = true},
  {'numToStr/Comment.nvim', config = true},
  {'akinsho/git-conflict.nvim', config = true},

  {'nvim-lua/plenary.nvim', lazy = true},
  {'nvim-tree/nvim-web-devicons', lazy = true},

  'Glench/Vim-Jinja2-Syntax',
  'PeterRincker/vim-argumentative',
  'amal-khailtash/vim-xdc-syntax',
  'bogado/file-line',
  'kazhala/close-buffers.nvim',
  'kshenoy/vim-signature',
  'mhinz/vim-signify',
  'rhysd/vim-clang-format'
}
