-- import plugin safely
local status, gitblame = pcall(require, "gitblame")
if not status then
  return
end

-- https://github.com/f-person/git-blame.nvim?tab=readme-ov-file#configuration
gitblame.setup({
	--gitblame_ prefix is omitted in setup
	enabled = true,
  message_when_not_committed = "",
})
