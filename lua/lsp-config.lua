-- Register a handler that will be called for each server
-- installed through nvim-lsp-installer
-- when it's ready (i.e. when installation is finished
-- or if the server is already installed).
require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = {}

  -- Customize the options passed to the server
  if server.name == "elixirls" then
    opts.filetypes = { "elixir", "eelixir", "heex" }
      -- opts.settings = {}
      -- opts.settings["elixirLS.additionalWatchedExtensions"] = { "heex" }
  end

  if server.name == "html" then
    opts.filetypes = { "html", "eelixir", "heex" }
      -- opts.settings = {}
      -- opts.settings["elixirLS.additionalWatchedExtensions"] = { "heex" }
  end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
