-- General
vim.opt.number = true                   -- Show line numbers
vim.opt.linebreak = true                -- Break lines at word (requires Wrap lines)
vim.opt.showbreak = "+++"               -- Wrap-broken line prefix
vim.opt.textwidth = 100                 -- Line wrap (number of cols)
vim.opt.showmatch = true                -- Highlight matching brace
vim.opt.visualbell = true               -- Use visual bell (no beeping)

vim.opt.hlsearch = true                 -- Highlight all search results
vim.opt.smartcase = true                -- Enable smart-case search
vim.opt.ignorecase = true               -- Always case-insensitive
vim.opt.incsearch = true                -- Searches for strings incrementally

vim.opt.autoindent = true               -- Auto-indent new lines
vim.opt.shiftwidth = 4                  -- Number of auto-indent spaces
vim.opt.smartindent = true              -- Enable smart-indent
vim.opt.smarttab = true                 -- Enable smart-tabs
vim.opt.softtabstop = 4                 -- Number of spaces per Tab

-- Advanced
vim.opt.ruler = true                    -- Show row and column ruler information

vim.opt.undolevels = 1000               -- Number of undo levels
vim.opt.backspace = "indent,eol,start"  -- Backspace behaviour

-- Initialize packer
require('packer').startup(function()
    -- packer (manages itself)
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- nvim-tree
    -- https://github.com/nvim-tree/nvim-tree.lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons' -- Required for icons
    }

    require'nvim-tree'.setup {
        auto_close = true, -- Closes the tree when it's the last window
    }

    -- Treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    --Language packs
    use 'sheerun/vim-polyglot'

    --LSP autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'neovim/nvim-lspconfig'

    -- LSP Saga ????
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
        require('lspsaga').setup({})
      end,
    })
end)

-- keybinding to toggle nvim-tree.lua (\e)
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Open nvim-tree when Neovim is started
vim.cmd('autocmd VimEnter * NvimTreeToggle')

-- Close nvim-tree when last window is closed
function CloseNvimTreeIfLastWindow()
    if #vim.api.nvim_list_wins() == 1 then
        vim.cmd('NvimTreeClose')
    end
end

vim.cmd('autocmd WinClosed * lua CloseNvimTreeIfLastWindow()')