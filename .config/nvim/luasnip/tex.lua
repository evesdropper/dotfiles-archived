local function math()
    -- global p! functions from UltiSnips
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

--[[ local function env(name) ]]
--[[     t = vim.api.nvim.eval("vimtex#env#is_inside('" + name + "')") ]]
--[[     return 0 ]]
--[[ end ]]
--[[]]
--[[ local function itemize() ]]
--[[     return env("itemize") ]]
--[[ end ]]
--[[]]
--[[ local function enumerate() ]]
--[[     return env("enumerate") ]]
--[[ end ]]

-- table of greek symbols 
griss = {
    alpha = "alpha", beta = "beta", delta = "delta", gam = "gamma", eps = "epsilon",
    mu = "mu", lmbd = "lambda", sig = "sigma"
}

-- LFG tables and matrices work
local tab = function(args, snip)
	local rows = tonumber(snip.captures[1])
    local cols = tonumber(snip.captures[2])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j).."x1", i(1)))
		ins_indx = ins_indx+1
		for k = 2, cols do
			table.insert(nodes, t" & ")
			table.insert(nodes, r(ins_indx, tostring(j).."x"..tostring(k), i(1)))
			ins_indx = ins_indx+1
		end
		table.insert(nodes, t{"\\\\", ""})
        if j == 1 then
            table.insert(nodes, t{"\\midrule", ""})
        end
	end
	-- fix last node.
	nodes[#nodes] = t""
	return sn(nil, nodes)
end

-- yes this is a ripoff
local mat = function(args, snip)
	local rows = tonumber(snip.captures[2])
    local cols = tonumber(snip.captures[3])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j).."x1", i(1)))
		ins_indx = ins_indx+1
		for k = 2, cols do
			table.insert(nodes, t" & ")
			table.insert(nodes, r(ins_indx, tostring(j).."x"..tostring(k), i(1)))
			ins_indx = ins_indx+1
		end
		table.insert(nodes, t{"\\\\", ""})
	end
	-- fix last node.
	nodes[#nodes] = t""
	return sn(nil, nodes)
end

return {
    -- templates
    s({ trig='texdoc', name='new tex doc', dscr='Create a general new tex document'},
    fmt([[ 
    \documentclass{article}
    \usepackage{iftex}
    \ifluatex
    \directlua0{
    pdf.setinfo (
        table.concat (
        {
           "/Title (<>)",
           "/Author (Evelyn Koo)",
           "/Subject (<>)",
           "/Keywords (<>)"
        }, " "
        )
    )
    }
    \fi
    \usepackage{graphicx}
    \graphicspath{{figures/}}
    \usepackage[lecture]{random}
    \pagestyle{fancy}
    \fancyhf{}
    \rhead{\textsc{Evelyn Koo}}
    \chead{\textsc{<>}}
    \lhead{<>}
    \cfoot{\thepage}

    \begin{document}
    \title{<>}
    \author{Evelyn Koo}
    \date{<>}
    \maketitle
    \tableofcontents
    \section*{<>}
    \addcontentsline{toc}{section}{<>}
    <>
    \subsection*{Remarks}
    <>
    \end{document}
    ]],
    { i(3), i(2), i(7), i(1), rep(2), rep(3), i(4), i(5), rep(5), i(6), i(0) },
    { delimiters='<>' }
    )),
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
    -- special sections 
    s({ trig='#l', name='lecture', dscr='fancy section header - lecture #'},
    fmt([[ 
    \lecture[<>]{<>}
    <>]],
    { t(os.date("%d-%m-%y")), i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='#ch', name='chap', dscr='fancy section header - chapter #'},
    fmt([[ 
    \bookchap[<>]{<>}{<>}
    <>]],
    { t(os.date("%d-%m-%y")), i(1, "dscr"), i(2, "\\thesection"), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='#f', name='fancy section', dscr='fancy section header - vanilla'},
    fmt([[ 
    \fancysec[<>}{<>}{<>}
    <>]],
    { t(os.date('%d-%m-%y')), i(1, "dscr"), i(2, "title"), i(0) },
    { delimiters='<>' }
    )),
    -- links images figures
    s({trig="!l", name="link", dscr="Link reference", hidden=true},
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
    s({ trig='mp', name='minipage', dscr='create minipage env'}, -- choice node
    fmt([[
    \begin{minipage}{<>\textwidth}
    <>
    \end{minipage}]],
    { c(1, {t("0.5"), t("0.33"), i(nil)}), i(0) },
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
    s({ trig='it', name='italic', dscr='italic text', hidden=true},
    fmt([[\textit{<>}<>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='tu', name='underline', dscr='underline text', hidden=true},
    fmt([[\underline{<>}<>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='sc', name='small caps', dscr='small caps text', hidden=true},
    fmt([[\textsc{<>}<>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='tov', name='overline', dscr='overline text'},
    fmt([[\overline{<>}<>]],
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
    s({ trig='-i', name='itemize', dscr='bullet points (itemize)'},
    fmt([[ 
    \begin{itemize}
    \item <>
    \end{itemize}]],
    { i(1) },
    { delimiters='<>' }
    )),
    s({ trig='-e', name='enumerate', dscr='numbered list (enumerate)'},
    fmt([[ 
    \begin{enumerate}
    \item <>
    \end{enumerate}]],
    { i(1) },
    { delimiters='<>' }
    )),
    -- item but i cant get this to work
    --[[ s({trig="-", hidden=true}, {t('\\item')}, ]]
    --[[ { condition=enumerate or itemize }), ]]
    s({ trig='adef', name='add definition', dscr='add definition box'},
    fmt([[ 
    \begin{definition}[<>]{<>
    }
    \end{definition}]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='aex', name='add example', dscr='add example box'},
    fmt([[ 
    \begin{example}[<>]{<>
    }
    \end{example}]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='athm', name='add theorem', dscr='add theorem box'},
    fmt([[ 
    \begin{theorem}[<>]{<>
    }
    \end{theorem}]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='nb', name='notebox', dscr='add notebox idk why this format is diff'},
    fmt([[ 
    \begin{notebox}[<>]
    <>
    \end{notebox}]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='sol', name='solution', dscr='solution box for homework'},
    fmt([[ 
    \begin{solution}
    <>
    \end{solution}]],
    { i(0) },
    { delimiters='<>' }
    )),
    s({ trig='tabtest(%d+)x(%d+)', regTrig=true, name='test for tabular', dscr='test'},
    fmt([[
    \begin{tabular}{@{}<>@{}}
    \toprule
    <>
    \bottomrule
    \end{tabular}]],
    { f(function(_, snip)
        return string.rep("c", tonumber(snip.captures[2]))
    end), d(1, tab) },
    { delimiters='<>' }
    )),
    s({ trig='([bBpvV])mat(%d+)x(%d+)([ar])', regTrig=true, name='matrix', dscr='matrix trigger lets go'},
    fmt([[
    \begin{<>}<>
    <>
    \end{<>}]],
    { f(function (_, snip) return snip.captures[1] .. "matrix" end),
    f(function (_, snip)
        if snip.captures[4] == "a" then
            out = string.rep("c", tonumber(snip.captures[3]) - 1)
            return "[" .. out .. "|c]"
        end
        return ""
    end),
    d(1, mat),
    f(function (_, snip) return snip.captures[1] .. "matrix" end)},
    { delimiters='<>' }
    ))
}, {
    -- math mode
    s({ trig='mk', name='math', dscr='inline math'},
    fmt([[$<>$<>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='dm', name='math', dscr='display math'},
    fmt([[ 
    \[ 
    <>
    .\]
    <>]],
    { i(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='ali', name='align', dscr='align math'},
    fmt([[ 
    \begin{align<>}
    <>
    .\end{align<>}
    <>]],
    { i(1, "*"), i(2), rep(1), i(0) },
    { delimiters='<>' }
    )),
    s({ trig='gat', name='gather', dscr='gather math'},
    fmt([[ 
    \begin{gather<>}
    <>
    .\end{gather<>}
    <>]],
    { i(1, "*"), i(2), rep(1), i(0) },
    { delimiters='<>' }
    )),
    -- operators, symbols
    s({trig='**', priority=100}, {t('\\cdot')},
    { condition=math }),
    s('xx', {t('\\times')},
    { condition=math }),
    s({ trig='//', name='fraction', dscr='fraction (autoexpand)'},
    fmt([[\frac{<>}{<>}<>]],
    { i(1), i(2), i(0) },
    { delimiters='<>' },
    { condition=math })),
    s('==', {t('&='), i(1), t("\\\\")},
    { condition=math }),
    s('!=', {t('\\neq')},
    { condition=math }),
    s({ trig='conj', name='conjugate', dscr='conjugate would have been useful in eecs 126'},
    fmt([[\overline{<>}<>]],
    { i(1), i(0) },
    { delimiters='<>' },
    { condition=math })),
    s('<=', {t('\\leq')},
    { condition=math }),
    s('>=', {t('\\geq')},
    { condition=math }),
    s('>>', {t('\\gg')},
    { condition=math }),
    s('<<', {t('\\ll')},
    { condition=math }),
    s('~~', {t('\\sim')},
    { condition=math }),
    -- etc
    s({ trig='([clvd])%.', regTrig=true, name='dots', dscr='generate some dots'},
    fmt([[\<>dots]],
    { f(function(_, snip) 
      return snip.captures[1]
      end)},
    { delimiters='<>' }),
    { condition=math }),
    s({ trig='bnc', name='binomial', dscr='binomial (nCR)'},
    fmt([[\binom{<>}{<>}<>]],
    { i(1), i(2), i(0) },
    { delimiters='<>' }),
    { condition=math }),
    -- a living nightmare worth of greek symbols
    -- TODO: replace with regex
    s({ trig='(alpha|beta|delta)', regTrig=true,
    name='griss symbol', dscr='greek letters hi'},
    fmt([[\<>]],
    { f(function(_, snip)
        return griss[snip.captures[1]]
    end) },
    { delimiters='<>' }),
    { condition=math }),
    s("alpha", {t("\\alpha")},
    {condition = math}),
    s('beta', {t('\\beta')},
    { condition=math }),
    s('delta', {t('\\delta')},
    { condition=math }),
    s('gam', {t('\\gamma')},
    { condition=math }),
    s('eps', {t('\\epsilon')},
    { condition=math }),
    s('lmbd', {t('\\lambda')},
    { condition=math }),
    s('mu', {t('\\mu')},
    { condition=math }),
}
