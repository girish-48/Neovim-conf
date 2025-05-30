local M = {}

---@type table<string, snacks.dashboard.Section>
-- A more advanced example using multiple panes
-- ![image](https://github.com/user-attachments/assets/bbf4d2cd-6fc5-4122-a462-0ca59ba89545)
M = {
  sections = {
    { section = "header" },
    {
      pane = 2,
      section = "terminal",
      cmd = "printf '\n'",
      -- section = "terminal",
      -- cmd = "colorscript -e square",
      height = 6,
      padding = 1,
    },
    { section = "keys", gap = 1, padding = 1 },
    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    {
      pane = 2,
      icon = " ",
      title = "Git Status",
      section = "terminal",
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      cmd = "git status --short --branch --renames",
      height = 5,
      padding = 1,
      ttl = 5 * 60,
      indent = 3,
    },
    { section = "startup" },
  },
}


return M
