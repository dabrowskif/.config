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
    -- infered with  '[T]oggle [I]nlay [H]ints'
    keymap.set('n', '<leader>th', ui.toggle_quick_menu, { desc = '[T]oggle [H]arpoon' })

    keymap.set('n', '<leader>1', function()
      ui.nav_file(1)
    end, { desc = 'Harpoon - 1st file' })

    keymap.set('n', '<leader>2', function()
      ui.nav_file(2)
    end, { desc = 'Harpoon - 2st file' })

    keymap.set('n', '<leader>3', function()
      ui.nav_file(3)
    end, { desc = 'Harpoon - 3st file' })

    keymap.set('n', '<leader>4', function()
      ui.nav_file(4)
    end, { desc = 'Harpoon - 4st file' })

    require('harpoon').setup {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 75,
      },
    }
  end,
}
