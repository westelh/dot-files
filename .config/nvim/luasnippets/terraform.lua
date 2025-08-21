local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmta

return {
  s('cloud', fmt([[
  cloud {
    organization = "westelh"
    workspaces {
      name    = "<>"
      project = "<>"
    }
  }
  ]], { i(1), i(2) })),
  s({ trig = 'random3', name = 'Random Provider', desc = 'Random Provider(version 3)' }, fmt([[
  random = {
    source  = "hashicorp/random"
    version = "~>3.7"
  }
  ]], {}, { delimiters = '[]' })),
  s({ trig = 'vault5', name = 'Vault Provider', desc = 'Vault Provider(version 5)' }, fmt([[
  vault = {
    source  = "hashicorp/vault"
    version = "~>5.0"
  }
  ]], {}, { delimiters = '[]' })),

  s({ trig = 'oci7', name = 'Oracle Provider', desc = 'Oracle Provider(version 7)' }, fmt([[
  oci = {
    source  = "oracle/oci"
    version = "~>7.4"
  }
  ]], {}, { delimiters = '[]' })),
}
