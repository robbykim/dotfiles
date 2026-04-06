local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep

return {
  s("text", { t('helloworld')}),
  s("rfc", {
    t('import React from "react"'),
    t({"", ""}),
    t("const "),
    i(1, "Component"),
    t(" = () => {"),
    t({"", "  "}),
    i(0),
    t({"", "}"}),
    t({"", "export default "}),
    rep(1),
  }),
}
