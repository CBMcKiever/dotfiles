return {
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.6', 
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			
			-- Function to select directory for live_grep
			local function ts_select_dir_for_grep(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local fb = telescope.extensions.file_browser
				local live_grep = builtin.live_grep
				local current_line = action_state.get_current_line()

				fb.file_browser({
					files = false,
					depth = false,
					attach_mappings = function(prompt_bufnr)
						require("telescope.actions").select_default:replace(function()
							local entry_path = action_state.get_selected_entry().Path
							local dir = entry_path:is_dir() and entry_path or entry_path:parent()
							local relative = dir:make_relative(vim.fn.getcwd())
							local absolute = dir:absolute()

							live_grep({
								results_title = relative .. "/",
								cwd = absolute,
								default_text = current_line,
							})
						end)

						return true
					end,
				})
			end
			
			vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			local telescope = require("telescope")
			local ts_select_dir_for_grep = function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local fb = telescope.extensions.file_browser
				local live_grep = require("telescope.builtin").live_grep
				local current_line = action_state.get_current_line()

				fb.file_browser({
					files = false,
					depth = false,
					attach_mappings = function(prompt_bufnr)
						require("telescope.actions").select_default:replace(function()
							local entry_path = action_state.get_selected_entry().Path
							local dir = entry_path:is_dir() and entry_path or entry_path:parent()
							local relative = dir:make_relative(vim.fn.getcwd())
							local absolute = dir:absolute()

							live_grep({
								results_title = relative .. "/",
								cwd = absolute,
								default_text = current_line,
							})
						end)

						return true
					end,
				})
			end
			
			telescope.setup {
				defaults = {
					file_ignore_patterns = {
						"node_modules"
					}
				},
				pickers = {
					live_grep = {
						mappings = {
							i = {
								["<C-f>"] = ts_select_dir_for_grep,
							},
							n = {
								["<C-f>"] = ts_select_dir_for_grep,
							},
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			telescope.load_extension("ui-select")
			telescope.load_extension("file_browser")
		end
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
	}
}
