local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmta

return {
  s('networkingv1', {
    t 'networkingv1 "k8s.io/api/networking/v1"'
  }),

  s('apiVersion', { t 'apiVersion: ', c(1, {
    t '"networking.k8s.io/v1"',
    t '"core.k8s.io/v1"',
  }) }),

  s('ifnbotom', fmt([[
  if <> != _|_ {
    <>
  }
  ]], {
    i(1, "expr"), i(0)
  })),

  s({ trig = "bundle", name = "Timoni Bundle" }, fmt([[
  bundle: {
    apiVersion: "v1alpha1"
    name: "<bname>"
    instances: {
      <>
    }
  }
  ]], {
    bname = i(1, 'bundle name'),
    i(0)
  })),

  s({ trig = 'instance', name = 'Timoni Instance' }, fmt([[
  <iname>: {
    module: url: "<url>"
    namespace: "<ns>"
    values: {
      <v>
    }
  }
  ]], {
    iname = i(1, 'Instace Name'),
    url = i(2, 'Module URL'),
    ns = i(3, 'Namespace'),
    v = i(0)
  }))
}
