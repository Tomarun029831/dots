-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.loaded_remote_plugins = 1
vim.g.loaded_remote_plugins_manifest = 1
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
require("config.lazy")
