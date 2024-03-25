require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "erlang", "elixir", "eex", "heex", "css", "html", "lua", "typescript", "tsx", "javascript" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { },

  -- syntax highlighting
  highlight = {
    enable = true,
  },

  -- indentation for the = operator
  indent = {
    enable = true
  },

  -- wisely add "end" in Ruby, Vimscript, Lua, etc
  endwise = {
    enable = true,
  }
}
