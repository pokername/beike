local ls = require("luasnip")
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
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key


return { 
s("trigger", {
    i(1, "First jump"),
    t(" :: "),
    sn(2, {
        i(1, "Second jump"),
        t" : ",
        i(2, "Third jump")
    })
}),
  s("trig", {
    i(1),
    f(
      function(args, snip, user_arg_1) return user_arg_1 .. args[1][1] end,
      { 1 },
      { user_args = { "Will be appended to text from i(0)" } }
    ),
    i(0)
  }),
postfix(".br", {
  f(function(_, parent)
    return "[" .. parent.snippet.env.POSTFIX_MATCH .. "]"
  end, {}),
}),
s("trig6", c(1, {
  t("Ugh boring, a text node"),
  i(nil, "At least I can edit something now..."),
  f(function(args) return "Still only counts as text!!" end, {})
})),
}












