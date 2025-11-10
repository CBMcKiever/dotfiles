# Neovim Configuration

This is a Neovim configuration using Lua and the Lazy plugin manager. It provides a modern development environment with LSP support, fuzzy finding, file exploration, and more.

## Current Configuration

- **Editor Settings**: 2-space indentation, expand tabs, line numbers (absolute and relative), leader key set to space.
- **Code Folding**: Enabled using Tree-sitter for folding functions, if statements, etc.
- **Theme**: Everforest (soft background).
- **Plugin Manager**: Lazy.nvim for managing plugins.

## Plugins

- **alpha-nvim**: Start screen/dashboard.
- **catppuccin**: Color scheme.
- **nvim-cmp + LuaSnip**: Autocompletion with snippets.
- **vim-fugitive + vim-rhubarb**: Git integration.
- **lsp_lines + mason + nvim-lspconfig**: LSP support for Lua, TypeScript, HTML, Angular, CSS, Emmet.
- **lualine**: Statusline.
- **neo-tree**: File explorer.
- **none-ls**: Formatting (Stylua, Prettier) and diagnostics (ESLint).
- **telescope**: Fuzzy finder with UI select extension.
- **nvim-treesitter**: Syntax highlighting and indentation for C, Lua, Vim, JavaScript, HTML, Angular, etc.

## Package Management

- **Mason**: A package manager for installing LSP servers, linters, and formatters. Used to ensure tools like lua_ls, tsserver, and gopls are installed. Run `:Mason` in Neovim to view and manage packages.

## Keybinds

- `<leader>fe`: Toggle Neo-tree file explorer.
- `<leader>fE`: Focus Neo-tree file explorer.
- `<leader>sf`: Telescope find files.
- `<leader>sg`: Telescope live grep.
- `<leader>fb`: Telescope file browser.
- `K`: LSP hover.
- `gd`: LSP go to definition.
- `<leader>ca`: LSP code action (normal and visual mode).
- `<leader>gf`: Format buffer.
- `<C-Space>`: Trigger completion (insert mode).
- `<CR>`: Confirm completion (insert mode).
- `<C-e>`: Abort completion (insert mode).
- `<C-b>/<C-f>`: Scroll completion docs (insert mode).
- `za`: Toggle code fold.
- `zR`: Open all folds.
- `zM`: Close all folds.

## Modifying the Configuration

- **Adding Plugins**: Create a new Lua file in `lua/plugins/` with the plugin spec. Lazy will automatically load it.
- **Editing Settings**: Modify `init.lua` for global settings or plugin configs in their respective files.
- **Keybinds**: Add or change in the relevant plugin config files using `vim.keymap.set`.
- **Updating**: Run `:Lazy update` in Neovim to update plugins.
- **Syncing**: The `lazy-lock.json` ensures reproducible plugin versions.

For more details, refer to the Lazy documentation and individual plugin READMEs.
