----------------------------------------------------------------------------j
-- Key Mappings --
----------------------------------------------------------------------------
-- Keyboard shortcuts mapped to a series of most commonly used or most useful commands for neovim and plugins.
-- Formatted according to Lua-based config using LazyVim for plugin management for NeoVim 0.9
--
-----------------------------------------------------------------------------
local ok, wk = pcall(require, "which-key")
-- ---------------------------------------------------------------------------
if not ok then
	return
end
------------------------------------------------------------------------------
-- Comma <,> as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","
-- ----------------------------------------------------------------------------
-- Keymap Spec:
-- { "key combo i.e. '<c-p>' (ctrl+p)", "full vim command you are mapping i.e. '<cmd>qall!<cr>'", desc = "description of command", nowait = false, remap = false },
-- Spec Template:
-- { "", "", desc = "", nowait = false, remap = false },
-- -------------------------------------------------------------------------------
-- MODE-Specific Mappings:
-- Description: Mappings tied to a specific MODE in Vim 
-- ( i.e. normal, visual, insert, etc. )
-- The vast majority of mappings are specific to Normal mode, being the most
-- common and easiest to work with. 
-- -------------------------------------------------------------------------------
-- NORMAL Mode
wk.add({
    ------------------------------------------------------------------------------
    -- Editing
    { "<c-a>", "ggVG", desc = "[SELECT] Select all", nowait = false, remap = false },
    { "D", '"_D', desc = "Do not copy when deleting", nowait = false, remap = false },
    -------------------------------------------------------------------------------
    -- Motion
    { "H", "^", desc = "[MOTION] Move to first character of line", nowait = false, remap = false },
    { "L", "$", desc = "[MOTION] Move to last character of line", nowait = false, remap = false },
    -- Buffer
    { "Q", "<cmd>qall!<cr>", desc = "[BUFFER] Quit all without saving", nowait = false, remap = false },
    { "Z", "<cmd>wall<cr>", desc = "[BUFFER] Save all", nowait = false, remap = false },
    ------------------------------------------------------------------------------
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
    --------------------------------------------------------------------------------
    -- Code/Text Folding
    { "||", "zM", desc = "[FOLDS] Collapse all folds", nowait = false, remap = false },
    { "--", "zR", desc = "[FOLDS] Expand all folds", nowait = false, remap = false },
    { "<a-s-up>", "zm", desc = "[FOLDS] Decrease fold level", nowait = false, remap = false },
    { "<a-s-down>", "zr", desc = "[FOLDS] Increase fold level", nowait = false, remap = false },
    { "<a-up>", "zc", desc = "[FOLDS] Close fold", nowait = false, remap = false },
    { "<a-down>", "zo", desc = "[FOLDS] Open fold", nowait = false, remap = false },
 ------------------------------------------------------------------------------------
    -- Clear search highlights
    { ";;", "<cmd>noh<cr>", desc = "Clean search highlights", nowait = false, remap = false },
 ------------------------------------------------------------------------------------
    -- Python -- <leader>p
    { "<leader>p", group = "[Python]", nowait = false, remap = false },
    { "<leader>pf", "<cmd>w<cr><cmd>!python3 %<cr>", desc = "Run the current file using python3", nowait = false, remap = false },
    { "<leader>P", "<cmd>w<cr><cmd>!python3 %<cr>", desc = "Run the current file using python3", nowait = false, remap = false },
    { "<leader>pm", "<cmd>w<cr><cmd>!python3 main.py<cr>", desc = "Runs main.py file in the same directory as the file being worked on (handy if you must test your project by running a main.py file which runs runs the whole project, but which you usually won't actually need to edit, hence you can run main.py without leaving the file you are editing, assumes main.py is in the same directory as the file you're working on, which in my case happens to be the case quite often)", nowait = false, remap = false },
 ---------------------------------------------------------------------------------------
    -- Code Navigation - <leader>c
    { "<leader>c", group = "[Code navigation]", nowait = false, remap = false },
    { "<leader>cc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "[LSP] Show incoming calls", nowait = false, remap = false },
    { "<leader>cd", "<cmd>Glance definitions<cr>", desc = "[LSP] Go to definition", nowait = false, remap = false },
    { "<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "[LSP] Signature help", nowait = false, remap = false },
    { "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", desc = "[LSP] Go to implementation", nowait = false, remap = false },
    { "<leader>cl", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "[LSP] Go to declaration", nowait = false, remap = false },
    { "<leader>cr", "<cmd>Telescope lsp_references<cr>", desc = "[LSP] Go to references", nowait = false, remap = false },
    { "<leader>cs", "<cmd>lua require'jdtls'.super_implementation()<cr>", desc = "[JDLTS] Go to super implementation", nowait = false, remap = false },
    { "<leader>ct", "<cmd>Glance type_definitions<cr>", desc = "[LSP] Go to type definition", nowait = false, remap = false },
    { "<leader>cv", "<cmd>Lspsaga hover_doc<cr>", desc = "[LSP] Hover", nowait = false, remap = false },
    { "<leader>cx", "<cmd>lua require'telescope.builtin'.treesitter{ symbols = {'method', 'function'}}<cr>", desc = "[TELESCOPE] Get current buffer functions", nowait = false, remap = false },
    -- ----------------------------------------------------------------------------------
    -- Debug -- <leader>d
    { "<leader>d", group = "[DAP debug]", nowait = false, remap = false },
    { "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", desc = "[DAP] Set conditional breakpoint", nowait = false, remap = false },
    { "<leader>dE", "<cmd>Telescope dap configurations<cr>", desc = "[DAP] Show debug configurations", nowait = false, remap = false },
    { "<leader>dR", "<cmd>lua require'dap'.run()<cr>", desc = "[DAP] Run", nowait = false, remap = false },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "[DAP] Toggle breakpoint", nowait = false, remap = false },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "[DAP] Continue", nowait = false, remap = false },
    { "<leader>de", "<cmd>lua require'dap'.run_last()<cr>", desc = "[DAP] Debug last", nowait = false, remap = false },
    { "<leader>di", "<cmd>DapStepInto<cr>", desc = "[DAP] Step into", nowait = false, remap = false },
    { "<leader>dk", "<cmd>DapTerminate<cr>", desc = "[DAP] Terminate", nowait = false, remap = false },
    { "<leader>dl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", desc = "[DAP] Set log point breakpoint", nowait = false, remap = false },
    { "<leader>do", "<cmd>DapStepOut<cr>", desc = "[DAP] Step out", nowait = false, remap = false },
    { "<leader>dp", "<cmd>DapToggleRepl<cr>", desc = "[DAP] Repl open", nowait = false, remap = false },
    { "<leader>ds", "<cmd>Telescope dap list_breakpoints<cr>", desc = "[TELESCOPE DAP] Show all breakpoints", nowait = false, remap = false },
    { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "[DAPUI] Toggle debugging UI", nowait = false, remap = false },
    { "<leader>dv", "<cmd>DapStepOver<cr>", desc = "[DAP] Step over", nowait = false, remap = false },
    { "<leader>dw", "<cmd>Telescope dap variables<cr>", desc = "[TELESCOPE DAP] Wariables", nowait = false, remap = false },
    { "<leader>dx", "<cmd>lua require('dapui').eval()<cr>", desc = "[DAPUI] Evaluate", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Diagnostics -- <leader>e
    { "<leader>e", group = "[Diagnostics]", nowait = false, remap = false },
    { "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "[DIAG] Go to next error", nowait = false, remap = false },
    { "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "[DIAG] Go to previous error", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Find & Search -- <leader>f
    { "<leader>f", group = "[TELESCOPE]", nowait = false, remap = false },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[TELESCOPE] Find buffers", nowait = false, remap = false },
    { "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "[TELESCOPE] Search command history", nowait = false, remap = false },
    { "<leader>fd", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[TELESCOPE] Current buffer fuzzy find", nowait = false, remap = false },
    { "<leader>fe", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "[TELESCOPE] Find File", nowait = false, remap = false },
    { "<leader>ff", "<cmd>Telescope frecency<cr>", desc = "[TELESCOPE] Frecency", nowait = false, remap = false },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[TELESCOPE] Find File by live grep (search content inside file)", nowait = false, remap = false },
    { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "[TELESCOPE] Recent files", nowait = false, remap = false },
    { "<leader>fib", "<cmd>Telescope git_branches<cr>", desc = "[TELESCOPE] Git branches", nowait = false, remap = false },
    { "<leader>fic", "<cmd>Telescope git_commits<cr>", desc = "[TELESCOPE] Git commits", nowait = false, remap = false },
    { "<leader>fih", "<cmd>Telescope git_stash<cr>", desc = "[TELESCOPE] Git stash", nowait = false, remap = false },
    { "<leader>fis", "<cmd>Telescope git_status<cr>", desc = "[TELESCOPE] Git status", nowait = false, remap = false },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "[TELESCOPE] Marks", nowait = false, remap = false },
    { "<leader>fn", "<cmd>Telescope grep_string<cr>", desc = "[TELESCOPE] Find files using grep in file names", nowait = false, remap = false },
    { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "[TELESCOPE] Search projects", nowait = false, remap = false },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "[TELESCOPE LSP] Find symbols", nowait = false, remap = false },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "[TELESCOPE] TODO list", nowait = false, remap = false },
    { "<leader>fx", "<cmd>Telescope neoclip<cr>", desc = "[TELESCOPE] Search in clipboard manager", nowait = false, remap = false },
    { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "[TELESCOPE] Zoxide", nowait = false, remap = false },
    { ";;", "<cmd>noh<cr>", desc = "Clean search highlights", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Git -- <leader>g
    { "<leader>g", group = "[GIT]", nowait = false, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "[GIT] Diff", nowait = false, remap = false },
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "[GIT] Preview hunk", nowait = false, remap = false },
    { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "[GIT] Next hunk", nowait = false, remap = false },
    { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "[GIT] Prev hunk", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Jumps -- <leader>j
    { "<leader>j", group = "[Jumps]", nowait = false, remap = false },
    { "<leader>ja", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "[HARPOON] Add file", nowait = false, remap = false },
    { "<leader>jk", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[HARPOON] Show quick menu", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Display Modes -- <leader>m
    { "<leader>m", group = "[Display modes]", nowait = false, remap = false },
    { "<leader>mz", "<cmd>ZenMode<cr>", desc = "[MODE] Toggle zen mode", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Code Refactor -- <leader>r
    { "<leader>r", group = "[Code refactor]", nowait = false, remap = false },
    { "<leader>rI", "<cmdr:Refactor inline_func <cr>", desc = "[REFACTOR] Inline function", nowait = false, remap = false },
    { "<leader>re", "<cmd>Lspsaga code_action<cr>", desc = "[LSP] Code actions", nowait = false, remap = false },
    { "<leader>rf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>", desc = "[CONFORM] Format code", nowait = false, remap = false },
    { "<leader>ri", "<cmdr:Refactor inline_var <cr>", desc = "[REFACTOR] Inline variable", nowait = false, remap = false },
    { "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "[LSP] Rename", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Views -- <leader>v
    { "<leader>v", group = "[Views]", nowait = false, remap = false },
    { "<leader>vp", "<cmd>TroubleToggle<cr>", desc = "[TROUBLE] Toggle", nowait = false, remap = false },
    { "<leader>vs", "<cmd>AerialToggle<cr>", desc = "[AERIAL] Toggle", nowait = false, remap = false },
    { "<leader>vt", "<cmd>ToggleTerm<cr>", desc = "[TOGGLETERM] Open new terminal", nowait = false, remap = false },
    { "<leader>vu", "<cmd>UndotreeToggle<cr>", desc = "[UNDOTREE]Toggle undotree", nowait = false, remap = false },
    -- --------------------------------------------------------------------------------
    -- Re-map: Toggle NeoTree fileviewer remapped to: '"' - remapped'<leader>vf' to '"' (from normal mode).
    { '"', "<cmd>NeoTreeFocusToggle<cr>", desc = "[NEOTREE] Toggle", nowait = false, remap = false }, 
    -- --------------------------------------------------------------------------------
        -- Macros and registers
	-- ["t"] = { '"_', "Set black hole registry" },
	{"qj", "@q", desc = "Execute macro saved in 'q' register", nowait = false, remap = false },
    -- ---------------------------------------------------------------------------------
    -- Plugin-specific Mappings
    -- ---------------------------------------------------------------------------------
    -- Markdown-Peek
    { "<leader>vmp", "<cmd>PeekOpen<cr>", desc = "Markdown Peek - Open markdown preview window", nowait = true, remap = false },
    { "<leader>vmpx", "<cmd>PeekClose<cr>", desc = "Markdown Peek - Close markdown preview window", nowait = false, remap = false },
    -- 
})
----------------------------------------------------------------------------------------
-- INSERT Mode
wk.add({
    mode = { "i" },
    { "<a-b>", "<C-o>b", desc = "Move to previous word", nowait = true, remap = false },
    { "<a-c>", '<C-o>"_ciw', desc = "Change word", nowait = true, remap = false },
    { "<a-d>", '<C-o>"_diw', desc = "Delete word", nowait = true, remap = false },
    { "<a-s>", "<Del>", desc = "Handy DEL on insert mode", nowait = true, remap = false },
    { "<a-w>", "<C-o>w", desc = "Move to next word", nowait = true, remap = false },
})
----------------------------------------------------------------------------------------
-- VISUAL Mode
wk.add({
    mode = { "v" },
    { "<", "<gv", desc = "[Indent] Indent left", nowait = true, remap = false },
    { "<a-down>", "<cmd>TSTextobjectGotoNextStart @function.outer<cr>", desc = "[MOTION] Move to next method", nowait = true, remap = false },
    { "<a-j>", ":m '>+1<cr>gv=gv", desc = "[MOVE] Move block down", nowait = true, remap = false },
    { "<a-k>", ":m '<-2<cr>gv=gv", desc = "[MOVE] Move block up", nowait = true, remap = false },
    { "<a-up>", "<cmd>TSTextobjectGotoPreviousStart @function.outer<cr>", desc = "[MOTION] Move to previous method", nowait = true, remap = false },
    { "<c-a>", "ggOG", desc = "[SELECT] Select all", nowait = true, remap = false },
    { "<leader>dx", "<cmd>lua require('dapui').eval()<CR>", desc = "[DAPUI] Evaluate (selection in visual mode) }", nowait = true, remap = false },
    { ">", ">gv", desc = "[Indent] Indent right", nowait = true, remap = false },
    { "C", '"_C', desc = "Do not copy when changing", nowait = true, remap = false },
    { "E", "<cmd>lua require('spider').motion('ge')<cr>", desc = "[MOTION] Spider-ge motion", nowait = true, remap = false },
    { "H", "^", desc = "[MOTION] Move to first character of line", nowait = true, remap = false },
    { "L", "$", desc = "[MOTION] Move to last character of line", nowait = true, remap = false },
    { "b", "<cmd>lua require('spider').motion('b')<cr>", desc = "[MOTION] Spider-b motion", nowait = true, remap = false },
    { "c", '"_c', desc = "Do not copy when changing", nowait = true, remap = false },
    { "cc", '"_cc', desc = "Do not copy when changing", nowait = true, remap = false },
    { "e", "<cmd>lua require('spider').motion('e')<cr>", desc = "[MOTION] Spider-e motion", nowait = true, remap = false },
    { "p", '"_dP', desc = "Paste without replacing what is was in clipboard", nowait = true, remap = false },
    { "v", "^o$", desc = "[SELECT] Select trimmed line", nowait = true, remap = false },
    { "w", "<cmd>lua require('spider').motion('w')<cr>", desc = "[MOTION] Spider-w motion", nowait = true, remap = false },
})
----------------------------------------------------------------------------------------
-- SELECT Mode
-- {
-- None
-- },
----------------------------------------------------------------------------------------
-- EXECUTION Mode
wk.add({
    mode = { "x" },
    { "<leader>r", group = "[Code refactor]", nowait = true, remap = false },
    { "<leader>rl", "<cmdr:Refactor extract_to_file <cr>", desc = "[REFACTOR] Extract to file", nowait = true, remap = false },
    { "<leader>rv", "<cmd>:Refactor extract_var <cr>", desc = "[REFACTOR] Extract variable", nowait = true, remap = false },
    { "<leader>rx", "<cmd>:Refactor extract <cr>", desc = "[REFACTOR] Extract function", nowait = true, remap = false },
})
----------------------------------------------------------------------------------------
-- TERMINAL Mode
wk.add({
    mode = { "t" },
    { "<c-h>", "<cmd>wincmd h<cr>,", desc = "[TERMINAL] Move left", nowait = true, remap = false },
    { "<c-j>", "<cmd>wincmd j<cr>,", desc = "[TERMINAL] Move down", nowait = true, remap = false },
    { "<c-k>", "<cmd>wincmd k<cr>,", desc = "[TERMINAL] Move up", nowait = true, remap = false },
    { "<c-l>", "<cmd>wincmd l<cr>,", desc = "[TERMINAL] Move right", nowait = true, remap = false },
})
----------------------------------------------------------------------------------------
wk.setup({})
