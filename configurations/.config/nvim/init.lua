--
require("rafa.basic")

-- Load classic config
vim.cmd("source ~/.config/nvim/vimrc")

-- Load LSP config
require("lsp")

-- Load lualine
require("lualine").setup()

-- Configure treesitter
require("treesitter_config")
