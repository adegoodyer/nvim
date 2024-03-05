-- set colorscheme to tokyonight-night with protected call (in case it isn't installed)
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon")
-- if not status then
-- 	print("Colorscheme not found!") -- print error if col
-- end

-- set colorscheme to nightfox
local status, nightfox = pcall(vim.cmd, "colorscheme nightfox")
if not status then
	print("Colorscheme not found!")
end
