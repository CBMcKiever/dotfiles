return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local actions = require("diffview.actions")
		require("diffview").setup({
			use_icons = true,
			show_help_hints = true,
			view = {
				default = {
					layout = "diff2_horizontal",
				},
				merge_tool = {
					layout = "diff3_horizontal",
				},
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
				},
				win_config = {
					position = "left",
					width = 35,
				},
			},
			keymaps = {
				view = {
					{ "n", "<leader>dq", "<Cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
				},
			},
		})

		vim.keymap.set("n", "<leader>dv", "<Cmd>DiffviewOpen<CR>", { desc = "Open diffview" })
		vim.keymap.set("n", "<leader>dh", "<Cmd>DiffviewFileHistory<CR>", { desc = "Open file history" })
		vim.keymap.set("n", "<leader>df", "<Cmd>DiffviewFileHistory %<CR>", { desc = "Open current file history" })
	end,
}
