return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- set keymaps
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon - add file' })
    keymap.set('n', '<leader>t', ui.toggle_quick_menu, { desc = 'Harpoon - open menu' })

    keymap.set('n', '<leader>q', function()
      ui.nav_file(1)
    end, { desc = 'Harpoon - 1st file' })

    keymap.set('n', '<leader>w', function()
      ui.nav_file(2)
    end, { desc = 'Harpoon - 2st file' })

    keymap.set('n', '<leader>e', function()
      ui.nav_file(3)
    end, { desc = 'Harpoon - 3st file' })

    keymap.set('n', '<leader>r', function()
      ui.nav_file(4)
    end, { desc = 'Harpoon - 4st file' })
  end,
}
