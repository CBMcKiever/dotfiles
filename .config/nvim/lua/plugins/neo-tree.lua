return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", 
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set('n', '<leader>fe', '<Cmd>Neotree toggle<CR>')
		vim.keymap.set('n', '<leader>fE', '<Cmd>Neotree focus<CR>')
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						-- '.git',
						-- '.DS_Store',
						-- 'thumbs.db',
					},
					never_show = {},
				},
				follow_current_file = {
					enabled = true
				}

			},
			buffers = { follow_current_file = { enabled = true } }
		})
	end
  }
