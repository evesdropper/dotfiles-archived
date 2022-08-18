local function math()
    -- global p! functions from UltiSnips
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

--[[ local function env(name) ]]
--[[     t = {x, y} ]]
--[[     local t = vim.api.nvim_eval("vimtex#env#is_inside('" + name "')") ]]
--[[     return x ~= 0 and y ~= 0 ]]
--[[ end ]]

return {
    -- semantic snippets from markdown
    -- sections
    s({trig="#", hidden=true},
    fmt([[
    \section{<>}
    <>]],
    { i(1), i(0) },
    { delimiters="<>" }
    )),
    s({trig="#*", hidden=true},
    fmt([[
    \section*{<>}
    <>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({trig="#2", hidden=true},
    fmt([[
    \subsection{<>}
    <>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({trig="#2*", hidden=true},
    fmt([[
    \subsection*{<>}
    <>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({trig="#3", hidden=true},
    fmt([[ 
    \subsubsection{<>}
    <>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({trig="#3*", hidden=true},
    fmt([[ 
    \subsubsection*{<>}
    <>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    -- links images figures
    s({trig="!l", name="link", dscr="Link reference"},
    fmt([[\href{<>}{\color{<>}<>}<>]],
    { i(1, "link"), i(3, "blue"), i(2, "title"), i(0) },
    { delimiters='<>' }
    )),
    s({trig="!i", name="image", dscr="Image (no caption, no float)"},
    fmt([[ 
    \begin{center}
    \includegraphics[width=<>\textwidth]{<>}
    \end{center}
    <>]],
    { i(1, "0.5"), i(2), i(0) },
    { delimiters='<>' }
    )),
    s({trig="!f", name="figure", dscr="Float Figure"},
    fmt([[ 
    \begin{figure}[<>] 
    <>
    \end{figure}]],
    { i(1, "htb!"), i(0) },
    { delimiters='<>' }
    )),
    s({trig="gr", name="figure image", dscr="float image"},
    fmt([[
    \centering
    \includegraphics[width=<>\textwidth]{<>}\caption{<>}<>]],
    { i(1, "0.5"), i(2), i(3), i(0) },
    { delimiters='<>' }
    )),
    -- code
    s({ trig='qw', name='inline code', dscr='inline code'},
    fmt([[\mintinline{<>}{<>}<>]],
    { i(1, "text"), i(2), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='qe', name='code', dscr='Code with minted.'},
    fmt([[ 
    \begin{minted}{<>}
    <>
    \end{minted}
    <>]],
    { i(1, "python"), i(2), i(0) },
    { delimiters='<>' }
    )),
    -- quotes
    s({ trig='sq', name='single quotes', dscr='single quotes', hidden=true},
    fmt([[`<>'<>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='qq', name='double quotes', dscr='double quotes', hidden=true},
    fmt([[``<>''<>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    -- text changes
    s({ trig='bf', name='bold', dscr='bold text', hidden=true},
    fmt([[\textbf{<>}<>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    -- environments
    s({trig="beg", name="begin env", dscr="begin/end environment"},
    fmt([[
    \begin{<>}
    <>
    \end{<>}]],
    { i(1), i(0), rep(1) },
    { delimiters="<>" }
    )),
}, {
    -- a living nightmare worth of greek symbols
    s("alpha", {t("\\alpha")},
    {condition = math}),
    s('beta', {t('\\beta')},
    { condition=math }),
    s('delta', {t('\\delta')},
    { condition=math }),
}
