return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(c) return c.name == "null-ls" end,
							})
						end,
					})
				end
			end,
		})
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ filter = function(c) return c.name == "null-ls" end })
		end, {})
	end,
}
