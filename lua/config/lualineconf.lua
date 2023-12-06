-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore

-- require("lualine").setup({
--   options = {
--     icons_enabled = true,
--     theme = "auto",
--     component_separators = { left = "", right = "" },
--     section_separators = { left = "", right = "" },
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     },
--   },
--   sections = {
--     lualine_a = { "mode" },
--     lualine_b = { "branch", "diff", "diagnostics" },
--     lualine_c = { "filename" },
--     lualine_x = { "encoding", "fileformat", "filetype" },
--     lualine_y = { "progress" },
--     lualine_z = { "location" },
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { "filename" },
--     lualine_x = { "location" },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {},
--   extensions = {},
-- })
--
--
-- local function keymap()
--   if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
--     return '⌨ ' .. vim.b.keymap_name
--   end
--   return ''
-- end
local colors = {
  vertsplit      = '#181A1F',
  special_grey   = '#3B4048',
  menu_grey      = '#3E4452',
  cursor_grey    = '#2C323C',
  gutter_fg_grey = '#4B5263',
  blue           = '#82b1ff',
  dark_red       = '#BE5046',
  white          = '#bfc7d5',
  green          = '#C3E88D',
  purple         = '#c792ea',
  yellow         = '#ffcb6b',
  light_red      = '#ff869a',
  red            = '#ff5370',
  dark_yellow    = '#F78C6C',
  cyan           = '#89DDFF',
  comment_grey   = '#697098',
  black          = '#292D3E',
}

local palenight = {
  normal = {
    a = { fg = colors.black, bg = colors.purple, gui = "bold" },
    b = { fg = colors.purple, bg = colors.menu_grey },
    c = { fg = colors.comment_grey, bg = colors.black },
  },
  insert = {
    a = { fg = colors.black, bg = colors.blue, gui = "bold" },
    b = { fg = colors.blue, bg = colors.menu_grey },
  },
  visual = {
    a = { fg = colors.black, bg = colors.cyan, gui = "bold" },
    b = { fg = colors.cyan, bg = colors.menu_grey },
  },
  replace = {
    a = { fg = colors.black, bg = colors.green, gui = "bold" },
    b = { fg = colors.green, bg = colors.menu_grey },
  },
  inactive = {
    a = { fg = colors.black, bg = colors.menu_grey, gui = "bold" },
    b = { fg = colors.black, bg = colors.menu_grey },
    c = { fg = colors.black, bg = colors.menu_grey },
  },
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = palenight,
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    component_separators = "|",
    section_separators = { left = "", right = "" },
  },
  --   sections = {},
  --   winbar = {
  --     lualine_a = { "mode" },
  --     lualine_b = { "branch", "diff", "diagnostics" },
  --     lualine_c = { "filename" },
  --     lualine_x = { "encoding", "fileformat", "filetype" },
  --     lualine_y = { "progress" },
  --     lualine_z = { "location" },
  --   },
})
