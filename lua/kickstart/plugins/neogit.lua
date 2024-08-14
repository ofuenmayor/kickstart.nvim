-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit:setup()

    local function map(mode, l, r, opts)
      opts = opts or {}
      vim.keymap.set(mode, l, r, opts)
    end

    -- normal mode
    map('n', '<leader>no', neogit.open, { desc = 'neogit [s]OpenUI' })
    map('n', '<leader>nc', ':Neogit commit<CR>', { desc = 'git commit' })
    map('n', '<leader>np', ':Neogit pull<CR>', { desc = 'git pull' })
    map('n', '<leader>nP', ':Neogit push<CR>', { desc = 'git push' })
    map('n', '<leader>nb', ':Telescope git_branches<CR>', { desc = 'git branches' })
    map('n', '<leader>nB', ':G blame<CR>', { desc = 'git blame' })
  end,
}
