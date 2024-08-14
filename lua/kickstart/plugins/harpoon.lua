-- autopairs
-- https://github.com/windwp/nvim-autopairs
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
}, {
  'mistricky/codesnap.nvim',
  build = 'make',

  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    local function map(mode, l, r, opts)
      opts = opts or {}
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>ja', function()
      harpoon:list():add()
    end, { desc = 'harppon2' })
    map('n', '<C-l>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    map('n', '<C-h>', function()
      harpoon:list():select(1)
    end)
    map('n', '<C-t>', function()
      harpoon:list():select(2)
    end)
    map('n', '<C-n>', function()
      harpoon:list():select(3)
    end)
    map('n', '<C-s>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    map('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    map('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
    -- normal mode
    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
