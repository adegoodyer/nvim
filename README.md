# Nvim Configuration

## Overview
- [nvim Lua guide](https://github.com/nanotee/nvim-lua-guide)
- [bashbunni dotfiles](https://github.com/bashbunni/dotfiles/tree/main/.config/nvim)

```bash
# copy folder
rm -rf ~/.config/nvim && \
cp -r /Users/adriangoodyer/quick-ref/software-development/ide/vim/nvim ~/.config
```

## Default Editor
```bash
# change default text editor to vim
export EDITOR=/usr/bin/vim

# change git default text editor to vim
git config --global core.editor "vim"
```

## File Locations
```bash
# sensible defaults - https://vimconfig.com/

# vimscript
nvim ~/.config/nvim/init.vim          # traditional config file
nvim ~/.config/nvim/plugins.vim       # plugins

# lua
nvim ~/.config/nvim/init.lua          # newer config file
nvim ~/.config/nvim/plugins.lua       # plugins

nvim ~/.vimrc                         # older version
```

## Plugins
- [top plugins](https://dotfyle.com/neovim/plugins/top)
- [packer](https://github.com/wbthomason/packer.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

```bash
# install packer.vim (plugin manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# configure nvim to use plugins
# init.lua
-- Initialize packer
require('packer').startup(function()
    -- Plugins
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons' -- Required for icons
    }

    require'nvim-tree'.setup {
        auto_close = true, -- Closes the tree when it's the last window
    }
end)

-- Example keybinding to toggle nvim-tree.lua
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
```

### Packer commands
```bash
:PackerInstall
:PackerUpdate
:PackerClean
```

## Errors
- must use nerd fonts for tree icons https://stackoverflow.com/questions/72899162/neovim-icons-missing-nvim-tree-web-devicons