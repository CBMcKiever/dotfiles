return {
	{
		"ErichDonGubler/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			-- Ensure Mason's bin directory is in PATH
			local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
			vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "gopls", "angularls", "html", "cssls", "emmet_ls", "eslint" },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "prettierd", "stylua" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
			local angular_server_dir = mason_packages .. "/angular-language-server"
			lspconfig.angularls.setup({
				capabilities = capabilities,
				cmd = { 
					'ngserver', 
					'--stdio', 
					'--tsProbeLocations', 
					angular_server_dir,
					'--ngProbeLocations',
					angular_server_dir,
				},
				on_new_config = function(new_config)
					new_config.cmd = { 
						'ngserver', 
						'--stdio', 
						'--tsProbeLocations', 
						angular_server_dir,
						'--ngProbeLocations',
						angular_server_dir,
					}
				end,
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
       lspconfig.emmet_ls.setup({
         capabilities = capabilities,
         filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'scss', 'typescript' },
         init_options = {
           html = {
             options = {
               ["bem.enabled"] = true,
             },
           },
         },
       })
       lspconfig.gopls.setup({
         capabilities = capabilities,
       })
       
			-- Toggle diagnostic underline for errors and warnings
			local diagnostic_state = {
				errors = true,
				warnings = true,
			}
			
			local function update_diagnostics()
				local severities = {}
				if diagnostic_state.errors then
					table.insert(severities, vim.diagnostic.severity.ERROR)
				end
				if diagnostic_state.warnings then
					table.insert(severities, vim.diagnostic.severity.WARN)
					table.insert(severities, vim.diagnostic.severity.HINT)
					table.insert(severities, vim.diagnostic.severity.INFO)
				end
				
				vim.diagnostic.config({
					underline = #severities > 0 and { severity = severities } or false,
				})
			end
			
			vim.keymap.set("n", "<leader>le", function()
				diagnostic_state.errors = not diagnostic_state.errors
				update_diagnostics()
				print("ESLint errors underline: " .. (diagnostic_state.errors and "enabled" or "disabled"))
			end, { desc = "Toggle ESLint errors underline" })
			
			vim.keymap.set("n", "<leader>lw", function()
				diagnostic_state.warnings = not diagnostic_state.warnings
				update_diagnostics()
				print("ESLint warnings underline: " .. (diagnostic_state.warnings and "enabled" or "disabled"))
			end, { desc = "Toggle ESLint warnings underline" })
			
 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
