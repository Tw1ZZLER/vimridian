-- Statusline (lualine)
return {
    "lualine.nvim",
    after = function()
	require('lualine').setup()
    end
}
