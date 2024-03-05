local opt = vim.opt

-- general
opt.number = true											-- enable line numbers
opt.backspace = "indent,eol,start"		-- make backspace key work properly
opt.clipboard:append("unnamedplus")		-- yank/paste via system clipboard
opt.iskeyword:append("-")							-- consider - to be part ow word (when deleting for example)

-- appearance
opt.cursorline = false
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- tabs and indentation
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2

-- split windows
opt.splitright = true
opt.splitbelow = true

-- search settings
opt.hlsearch = true										-- highlight all search results
opt.smartcase = true
opt.ignorecase = true									-- case insensitive
opt.incsearch = true									-- search for stings incrementally
