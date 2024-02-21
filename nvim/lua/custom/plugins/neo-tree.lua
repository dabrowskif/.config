return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  priority = 1001,
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  config = function()
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    vim.keymap.set('n', '<leader>fe', ':Neotree toggle<cr>', { desc = '' })

    require('neo-tree').setup {
      window = {
        mappings = {
          ['t'] = {
            'toggle_node',
            nowait = false,
          },
          ['<space><space>'] = 'open_tabnew',
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    }
  end,
}
