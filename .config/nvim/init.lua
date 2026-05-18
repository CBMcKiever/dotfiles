vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.spelllang = "en_us"
-- Enable spell check only for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "md" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
vim.diagnostic.config({
	virtual_text = false,
})
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = true
vim.wo.foldlevel = 99
vim.g.copilot_node_command = "~/.nvm/versions/node/v20.12.2/bin/node"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}
require("lazy").setup("plugins")
vim.cmd("colorscheme everforest")

vim.keymap.set("n", "<leader>mp", function()
  local tmp = vim.fn.tempname() .. ".md"
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  vim.fn.writefile(lines, tmp)
  local result = vim.fn.system("mdterm --no-color " .. vim.fn.shellescape(tmp))
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("mdterm error: " .. result)
    return
  end
  vim.cmd("new")
  vim.api.nvim_put(vim.split(result, "\n", { trimempty = true }), "l", true, true)
end, { desc = "Preview markdown with mdterm" })

vim.keymap.set("n", "<leader>mb", ":MarkdownPreview<CR>", { desc = "Preview markdown in browser" })


