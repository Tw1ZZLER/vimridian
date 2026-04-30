-- Fuzzy Finder (fzf-lua)
return {
	"fzf-lua",
	cmd = "FzfLua",
	after = function()
		-- sets up fzf lua with telescope like UI
		-- and bat for previewer
		require("fzf-lua").setup({
			{ "telescope", "fzf-native" },
			winopts = { preview = { default = "bat" } },
		})
	end,
	keys = {
		-- grep, command history, files (super shortcuts)
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
		{ "<leader>;", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files" },

		-- find
		{ "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
		{ "<leader>fB", "<cmd>FzfLua buffers<cr>", desc = "Buffers (all)" },
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },

		-- git
		{ "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
		{ "<leader>gd", "<cmd>FzfLua git_diff<cr>", desc = "Git Diff (files)" },
		{ "<leader>gl", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
		{ "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
		{ "<leader>gS", "<cmd>FzfLua git_stash<cr>", desc = "Git Stash" },

		-- search
		{ '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
		{ "<leader>s/", "<cmd>FzfLua search_history<cr>", desc = "Search History" },
		{ "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
		{ "<leader>sb", "<cmd>FzfLua lines<cr>", desc = "Buffer Lines" },
		{ "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics" },
		{ "<leader>sD", "<cmd>FzfLua diagnostics_document<cr>", desc = "Buffer Diagnostics" },
		{ "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
		{ "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
		{ "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
		{ "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
		{ "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
		{ "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Resume" },
		{ "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
		{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Word" },
		{ "<leader>sw", "<cmd>FzfLua grep_visual<cr>", mode = "x", desc = "Selection" },
		{ "<leader>uC", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme with Preview" },
		{
			"<leader>ss",
			function()
				require("fzf-lua").lsp_document_symbols({
					regex_filter = symbols_filter,
				})
			end,
			desc = "Goto Symbol",
		},
		{
			"<leader>sS",
			function()
				require("fzf-lua").lsp_live_workspace_symbols({
					regex_filter = symbols_filter,
				})
			end,
			desc = "Goto Symbol (Workspace)",
		},
	},
}
