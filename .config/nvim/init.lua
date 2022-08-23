-- basic lua config
require "random.vimtex"
require "random.telescope"
require "random.options"
require "random.keymaps"
require "random.plugins"
require "random.colorscheme"
require "random.icons"
require "random.lualine"
require "random.cmp"
require "random.lsp"
require "random.treesitter"
require "random.autopairs"
require "random.comments"
require "random.presence"
ls = require "luasnip"
ls.config.set_config({
	history = true, --keep around last snippet local to jump back
    enable_autosnippets = true,})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnip/"})
--[[ require "random.snippets" ]]
-- require "random.bufferline"
