---@class snacks.scroll.Config
---@field animate snacks.animate.Config|{}
---@field animate_repeat snacks.animate.Config|{}|{delay:number}

local val = 700
local stp = 100

local if_neovide = function()
  if vim.g.neovide then
    print("Using neovide configuration")
    return {
      enabled = true,
    }
  else
    print("Using neovim configuration")
    return {
      animate = {
        duration = { step = stp, total = val },
        easing = "inOutSine",
      },
      -- faster animation when repeating scroll after delay
      animate_repeat = {
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = stp, total = val },
        easing = "inOutSine",
      },
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
      end,
    }
  end
end

return if_neovide()
