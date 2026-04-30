local autocmd = vim.api.nvim_create_autocmd

-- Automatically start treesitter for file on file open
autocmd("FileType", {
	callback = function(ev)
		-- pcall is used because it may fail if parser for
		-- the specific filetype is not installed
		pcall(vim.treesitter.start, ev.buf)
	end,
})
