local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmta

return {
  s({ trig = 'random3', name = 'Random Provider', desc = 'Random Provider(version 3)' }, fmt([[
  random = {
    source  = "hashicorp/random"
    version = "~>3.7"
  }
  ]], {}, { delimiters = '[]' })),
  s({ trig = 'vault5', name = 'Vault Provider', desc = 'Vault Provider(version 5)' }, fmt([[
  random = {
    source  = "hashicorp/vault"
    version = "~>5.0"
  }
  ]], {}, { delimiters = '[]' }))
}
