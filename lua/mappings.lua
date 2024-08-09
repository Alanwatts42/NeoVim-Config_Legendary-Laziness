---------------
-- Key Mappings --
---------------------------------------------------------------------------------------
-- Keyboard shortcuts mapped to a series of most commonly used or most useful commands for neovim and plugins.
-- Formatted according to Lua-based config using LazyVim for plugin management for NeoVim 0.9
-------------------------------------------
local ok, wk = pcall(require, "which-key")
---------------
if not ok then
	return
end
---------------------------
-- Comma <,> as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","
-- -------------
-- Keymap Spec:
-- { "key combo i.e. '<c-p>' (ctrl+p)", "full vim command you are mapping i.e. '<cmd>qall!<cr>'", desc = "description of command", nowait = false, remap = false },
-- Spec Template:
-- { "", "", desc = "", nowait = false, remap = false },
-- ------------------------
-- MODE-Specific Mappings:
-- Description: Mappings tied to a specific MODE in Vim 
-- ( i.e. normal, visual, insert, etc. )
-- The vast majority of mappings are specific to Normal mode, being the most
-- common and easiest to work with. 
-- ------------
-- NORMAL Mode
wk.add({
    -----------
    -- Editing
    { "<c-a>", "ggVG", desc = "[SELECT] Select all", nowait = false, remap = false },
    { "D", '"_D', desc = "Do not copy when deleting", nowait = false, remap = false },
    ----------
    -- Motion
    { "H", "^", desc = "[MOTION] Move to first character of line", nowait = false, remap = false },
    { "L", "$", desc = "[MOTION] Move to last character of line", nowait = false, remap = false },
    -- Buffer
    { "Q", "<cmd>qall!<cr>", desc = "[BUFFER] Quit all without saving", nowait = false, remap = false },
    { "Z", "<cmd>wall<cr>", desc = "[BUFFER] Save all", nowait = false, remap = false },
    ---------------------
    -- Window navigation
	---- Without bufferline
    { "<a-left>", "<cmd>bn<cr>", desc = "[BUFFER] Go previous buffer", nowait = false, remap = false },
    { "<a-right>", "<cmd>bp<cr>", desc = "[BUFFER] Go next buffer", nowait = false, remap = false },
    ---- With bufferline 
    { "<a-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "[BUFFER] Go previous buffer", nowait = false, remap = false },
    { "<a-l>", "<cmd>BufferLineCycleNext<cr>", desc = "[BUFFER] Go next buffer", nowait = false, remap = false },
    { "<a-b>", "<cmd>e #<cr>", desc = "[BUFFER] Switch to other buffer", nowait = false, remap = false },
    { "<a-t>", "<cmd>ene<cr>", desc = "[BUFFER] Open a new empty buffer", nowait = false, remap = false },
    { "Z", "<cmd>wall<cr>", desc = "[BUFFER] Save all", nowait = false, remap = false },
    { "Q", "<cmd>qall!<cr>", desc = "[BUFFER] Quit all without saving", nowait = false, remap = false },
    { "<a-q>", "<cmd>Bdelete!<cr>", desc = "[BUFFER] Close current buffer", nowait = false, remap = false },
    { "<a-w>", "<cmd>%bd!|e#|bd#<cr>", desc = "[BUFFER] Close other buffers", nowait = false, remap = false },
    ---------------------
    -- Code/Text Folding
    { "||", "zM", desc = "[FOLDS] Collapse all folds", nowait = false, remap = false },
    { "--", "zR", desc = "[FOLDS] Expand all folds", nowait = false, remap = false },
    { "<a-s-k>", "zm", desc = "[FOLDS] Decrease fold level", nowait = false, remap = false },
    { "<a-s-j>", "zr", desc = "[FOLDS] Increase fold level", nowait = false, remap = false },
    { "<a-k>", "zc", desc = "[FOLDS] Close fold", nowait = false, remap = false }, { "<a-down>", "zo", desc = "[FOLDS] Open fold", nowait = false, remap = false },
    ---------------------------
    -- Clear search highlights
    { ";;", "<cmd>noh<cr>", desc = "Clean search highlights", nowait = false, remap = false },
    -----------------------
    -- Python -- <leader>p
    { "<leader>p", group = "[Python]", nowait = false, remap = false },
    { "<leader>pf", "<cmd>w<cr><cmd>!python3 %<cr>", desc = "Run the current file using python3", nowait = false, remap = false },
    { "<leader>P", "<cmd>w<cr><cmd>!python3 %<cr>", desc = "Run the current file using python3", nowait = false, remap = false },
    { "<leader>pm", "<cmd>w<cr><cmd>!python3 main.py<cr>", desc = "Runs main.py file in the same directory as the file being worked on (handy if you must test your project by running a main.py file which runs runs the whole project, but which you usually won't actually need to edit, hence you can run main.py without leaving the file you are editing, assumes main.py is in the same directory as the file you're working on, which in my case happens to be the case quite often)", nowait = false, remap = false },
    -------------------------------
    -- Code Navigation - <leader>c
    { "<leader>c", group = "[Code navigation]", nowait = false, remap = false },
    { "<leader>cc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "[LSP] Show incoming calls", nowait = false, remap = false },
    { "<leader>cd", "<cmd>Glance definitions<cr>", desc = "[LSP] Go to definition", nowait = false, remap = false },
    { "<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "[LSP] Signature help", nowait = false, remap = false },
    { "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", desc = "[LSP] Go to implementation", nowait = false, remap = false },
    { "<leader>cl", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "[LSP] Go to declaration", nowait = false, remap = false },
    { "<leader>cr", "<cmd>Telescope lsp_references<cr>", desc = "[LSP] Go to references", nowait = false, remap = false },
    { "<leadercs", "<cmd>lua require'jdtls'.super_implementation()<cr>", desc = "[JDLTS] Go to super implementation", nowait = false, remap = false },
    { "<leader>ct", "<cmd>Glance type_definitions<cr>", desc = "[LSP] Go to type definition", nowait = false, remap = false },
    { "<leader>cv", "<cmd>Lspsaga hover_doc<cr>", desc = "[LSP] Hover", nowait = false, remap = false },
    { "<leader>cx", "<cmd>lua require'telescope.builtin'.treesitter{ symbols = {'method', 'function'}}<cr>", desc = "[TELESCOPE] Get current buffer functions", nowait = false, remap = false },
    -- -------------------
    -- Debug -- <leader>d
    { "<leader>d", group = "[DAP debug]", nowait = false, remap = false },
    { "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", desc = "[DAP] Set conditional breakpoint", nowait = false, remap = false },
    { "<leader>dE", "<cmd>Telescope dap configurations<cr>", desc = "[DAP] Show debug configurations", nowait = false, remap = false },
    { "<leader>dR", "<cmd>lua require'dap'.run()<cr>", desc = "[DAP] Run", nowait = false, remap = false },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "[DAP] Toggle breakpoint", nowait = false, remap = false },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "[DAP] Continue", nowait = false, remap = false },


