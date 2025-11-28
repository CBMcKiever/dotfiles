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
- **diffview.nvim**: Git diff viewer with file history and merge tool support.
- **vim-fugitive + vim-rhubarb**: Git integration.
- **lsp_lines + mason + nvim-lspconfig**: LSP support for Lua, TypeScript, HTML, Angular, CSS, Emmet.
  - **Emmet**: Configured for HTML abbreviations in TypeScript files (Angular inline templates). Use shortcuts like `div.classname` + `<C-Space>` to expand.
- **lualine**: Statusline.
- **neo-tree**: File explorer.
- **none-ls**: Formatting (Stylua, Prettier) and diagnostics (ESLint).
- **telescope**: Fuzzy finder with UI select extension and fzf-native sorter for improved performance.
- **nvim-treesitter**: Syntax highlighting and indentation for C, Lua, Vim, JavaScript, HTML, Angular, etc.

## Package Management

- **Mason**: A package manager for installing LSP servers, linters, and formatters. Used to ensure tools like lua_ls, ts_ls, and gopls are installed. Run `:Mason` in Neovim to view and manage packages.

## Keybinds

- `<leader>fe`: Toggle Neo-tree file explorer.
- `<leader>fE`: Focus Neo-tree file explorer.
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

### Telescope (Fuzzy Finder)

- `<leader>sf`: Find files in the current directory.
- `<leader>sg`: Live grep - search for text across all files.
- `<leader>sw`: Grep the word under cursor across all files (normal mode) or selected text (visual mode).
- `<leader>fb`: Open file browser at current file's directory.
- `<C-f>` (in live_grep): Select a specific directory to grep in.

**Common Usage:**
- Find files by name: `<leader>sf` and start typing
- Search for text in project: `<leader>sg` and type your search
- Search for current word: Place cursor on word and press `<leader>sw`
- Search for text with special chars (like `my-word`): Visually select the text and press `<leader>sw`
- Browse files: `<leader>fb` for visual file navigation

### Diffview (Git Diff Viewer)

- `<leader>dv`: Open diffview to compare working directory against index.
- `<leader>dh`: Open file history for all files in the repository.
- `<leader>df`: Open file history for the current file.
- `<leader>dq`: Close the current diffview.
- `<tab>` / `<s-tab>`: Navigate between changed files in diffview.
- `[c` / `]c`: Jump between diff hunks.
- `-` or `s`: Stage/unstage a file (in file panel).
- `X`: Restore file to the left side state (in file panel).

**Common Usage:**
- View uncommitted changes: `:DiffviewOpen`
- Compare against a specific commit: `:DiffviewOpen HEAD~2`
- View commit range: `:DiffviewOpen d4a7b0d..519b30e`
- View file history: `:DiffviewFileHistory %` (current file) or `:DiffviewFileHistory` (all files)

## Modifying the Configuration

- **Adding Plugins**: Create a new Lua file in `lua/plugins/` with the plugin spec. Lazy will automatically load it.
- **Editing Settings**: Modify `init.lua` for global settings or plugin configs in their respective files.
- **Keybinds**: Add or change in the relevant plugin config files using `vim.keymap.set`.
- **Updating**: Run `:Lazy update` in Neovim to update plugins.
- **Syncing**: The `lazy-lock.json` ensures reproducible plugin versions.

For more details, refer to the Lazy documentation and individual plugin READMEs.
