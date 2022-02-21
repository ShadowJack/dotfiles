require('telescope').setup {
  defaults = {
    mappings = {
      i = {
	["<C-s>"] = "file_split"
      }
    }
  },
  pickers = {
    lsp_references = {
      layout_strategy = 'vertical',
      initial_mode = 'normal',
      dynamic_preview_title = true
    },
    lsp_document_symbols = {
      layout_strategy = 'vertical',
      dynamic_preview_title = true
    }
  },
  extensions = {
    fzf = {}
  }
}

-- a native sorter to increase performance
require('telescope').load_extension('fzf')
