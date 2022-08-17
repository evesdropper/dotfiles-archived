local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = require("luasnip.extras").m
local l = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

-- creating snippets pls send help

ls.add_snippets("tex", {
    s("trigger", {
	t({"After expanding, the cursor is here ->"}), i(1),
	t({"", "After jumping forward once, cursor is here ->"}), i(1),
	t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
    }),
    s("trig", {
 	i(1),
 	f(function(args, snip, user_arg_1) return args[1][1] .. user_arg_1 end,
 		{1},
 		{ user_args = {"Will be appended to text from i(0)"}}),
 	i(0)
 })
})
