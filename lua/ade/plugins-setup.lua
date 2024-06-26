-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand to reload neovim and install/update/remove plugins
-- when plugins-setup.lua file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely (protected call)
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- plugins
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- tokyonights theme
	--use("folke/tokyonight.nvim")

	-- nightfox theme
	use("EdenEast/nightfox.nvim")

	-- commenting with gc
  use("numToStr/Comment.nvim")

	-- terminal
	use({"akinsho/toggleterm.nvim",
		tag = '*',
		config = function()
  		require("toggleterm").setup()
		end
	})

  -- file explorer
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")

	-- statusline
  use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) 		-- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) 						-- fuzzy finder

  -- autocompletion
  use("hrsh7th/nvim-cmp") 							-- completion plugin
  use("hrsh7th/cmp-buffer") 						-- recommend text from current buffer
  use("hrsh7th/cmp-path") 							-- recommend dirs/files when inputting file paths

  -- snippets
  use("L3MON4D3/LuaSnip") 							-- snippet engine
  use("saadparwaiz1/cmp_luasnip") 			-- recommend snippets in autocompletion
  use("rafamadriz/friendly-snippets") 	-- useful snippets

	-- managing and installing lsp servers
	-- lsp is built into nvim itself but the servers need to be installed separately
	use("williamboman/mason.nvim") 							-- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") 		-- bridges gap between mason and lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") 					-- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") 					-- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

	-- enhanced lsp uis
  -- use("jose-elias-alvarez/typescript.nvim") 	-- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") 								-- vs-code like icons for autocompletion

	-- treesitter configuration
  use({"nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- git blame
	use("f-person/git-blame.nvim")

	if packer_bootstrap then
    require("packer").sync()
  end

end)
