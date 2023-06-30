--- Helper functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

 -- escape into normal mode
map('i', 'jj', '<Esc>')

-- Make cursor move by visual lines instead of file lines (when wrapping)
map('', 'k', 'gk')
map('', 'j', 'gj')

-- CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- so that you can undo CTRL-U after inserting a line break.
map('i', '<C-U>', '<C-G>u<C-U>')

-- Easier movement between windows
nmap('<C-k>', '<C-w><Up>')
nmap('<C-j>', '<C-w><Down>')
nmap('<C-l>', '<C-w><Right>')
nmap('<C-h>', '<C-w><Left>')

-- clear search
nmap([[\\]], [[:nohlsearch<CR>]])

-- insert line above or below
nmap('<leader>o', 'o<ESC>')
nmap('<leader>O', 'O<ESC>')

-- insert from OS buffer via Cmd+V
nmap('<D-V>', '"+p')

-- Show signature of a function under the cursor
map('', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- Show help
map('', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- Rename all references to the symbol under the cursor
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      vim.api.nvim_buf_set_keymap(0, '', '<C-R>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    end
  })
-- Show line diagnostics on request (to view the full diagnostics message if it's too long)
map('', '<leader>e', '<cmd>lua vim.diagnostic.open_float(nil, {focus=true})<CR>')

-- Plugins --
--

-- NERDTree
nmap('<C-\\>', ':NERDTreeFind<CR>')
nmap('<leader><leader>', ':NERDTreeToggle<CR>')

-- EasyMotion
vim.cmd[[
  " Go to line by two chars
  nmap <leader>s <Plug>(easymotion-overwin-f2)
  " JK motions: Line motions
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  " Search with easymotion
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
]]

-- Telescope
nmap('<Leader>tt', ':Telescope<CR>')
map('', '<C-p>', ':Telescope find_files<CR>')
map('', '<C-f>', ':Telescope live_grep<CR>')
nmap('<Leader>tg', ':Telescope git_bcommits<CR>')
nmap('<Leader>tb', ':Telescope buffers<CR>')
nmap('<Leader>tr', ':Telescope lsp_references<CR>')
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      -- use LSP to go to definition instead of using on tags
      -- for current buffer
      vim.api.nvim_buf_set_keymap(0, '', '<C-]>', ':Telescope lsp_definitions<CR>', { noremap = true, silent = true })
    end
  })
nmap('<Leader>ti', ':Telescope lsp_implementations<CR>')
nmap('<Leader>ts', ':Telescope lsp_document_symbols<CR>')
map('', '<C-,>', ':Telescope lsp_code_actions<CR>')

-- Format Elixir files
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.ex", "*.exs", "*.heex"},
  callback = function(args)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>f', ':!mix format %<CR>', { noremap = true, silent = true })
  end
})



-- GitMessenger
nmap('<Leader>gb', ':GitMessenger<CR>')
