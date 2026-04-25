-- Colorscheme (catppuccin-frappe)
return {
    "catppuccin-nvim",
    after = function()
	-- setup catppuccin with some custom settings
	require("catppuccin").setup({
	    transparent_background = true
	})
	
	-- after setup of plugin we can set colorscheme
	vim.cmd.colorscheme "catppuccin-frappe"
    end
}
