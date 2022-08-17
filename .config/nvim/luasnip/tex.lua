ls = require "luasnip"

return {
    s("beg", fmt([[
      \begin{<>}
        <>
      \end{<>}]], 
      { i(1, "env"), i(0, "%content"), rep(1) }, 
      { delimiters = "<>" }
      )
)
}, {
    s("alpha", t("\\alpha"))
}
