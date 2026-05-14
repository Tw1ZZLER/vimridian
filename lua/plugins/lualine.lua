-- Statusline (lualine)
return {
    "lualine.nvim",
    before = function() LZN.trigger_load "mini.icons" end,
    after = function() require("lualine").setup() end,
}
