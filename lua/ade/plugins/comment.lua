-- import comment plugin safely
-- if installed then do nothing
local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- if installed, then enable comment plugin
comment.setup()
