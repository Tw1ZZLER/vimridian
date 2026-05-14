-- Thank you Vimjoyer for this config
-- https://github.com/vimjoyer/nixconf/blob/main/wrappedPrograms/neovim/lua/ls-shorthands.lua

local ls = require "luasnip"
local M = {}

M.s = ls.snippet
M.sn = ls.snippet_node
M.isn = ls.indent_snippet_node
M.t = ls.text_node
M.i = ls.insert_node
M.f = ls.function_node
M.c = ls.choice_node
M.d = ls.dynamic_node
M.r = ls.restore_node
M.ms = ls.multi_snippet
M.events = require "luasnip.util.events"
M.ai = require "luasnip.nodes.absolute_indexer"
M.fmt = require("luasnip.extras.fmt").fmt
M.fmta = require("luasnip.extras.fmt").fmta
M.l = require("luasnip.extras").lambda
M.dl = require("luasnip.extras").dynamic_lambda
M.conds = require "luasnip.extras.expand_conditions"
M.rep = require("luasnip.extras").rep
M.p = require("luasnip.extras").partial
M.m = require("luasnip.extras").match
M.n = require("luasnip.extras").nonempty
M.types = require "luasnip.util.types"
M.postfix = require("luasnip.extras.postfix").postfix
M.parse = require("luasnip.util.parser").parse_snippet
M.autosnippet = ls.extend_decorator.apply(ls.snippet, { snippetType = "autosnippet" })
M.newline = function() return ls.text_node { "", "" } end

return M
