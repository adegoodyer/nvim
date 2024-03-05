vim.g.mapleader = " " -- set leader key as space

local keymap = vim.keymap

--top-tip: use cat command to find out keys

-- keymap.set("mode", "keys", "action")

-- general
keymap.set("i", "jk", "<ESC>")												-- in insert mode, use jk to escape
keymap.set("n", "<leader>cs", ":nohl<CR>")						-- in normal mode, clear search highlights
keymap.set("n", "x", "_x")														-- delete characted but don't add to register

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") 							-- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") 							-- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") 							-- make split windows equal width & height
-- keymap.set("n", "<leader>wn", "<C-w>w")								-- next window
-- keymap.set("n", "<leader>wp", "<C-w>W")								-- previous window
keymap.set("n", "<leader>sx", ":close<CR>") 					-- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") 					-- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") 				-- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") 						-- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") 						-- previous tab

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") 	-- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") 		-- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") 		-- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") 	-- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") 			-- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") 		-- list available help tags
