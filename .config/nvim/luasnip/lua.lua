return {
    -- format snippet 
    s("snipf", fmt([[ 
    s({ trig='<>', name='<>', dscr='<>'},
    fmt(<>,
    { <> },
    { delimiters='<>' }<>
    ))<>]],
    { i(1, "trig"), i(2, "trig"), i(3, "dscr"), i(4, "fmt"), i(5, "inputs"), i(6, "<>"), i(7), i(0)},
    { delimiters='<>' }
    )),
    -- simple text snippet 
    s("snipt", fmt([[ 
    s('<>', {t('<>')}<>
    <>)<>]],
    { i(1, "trig"), i(2, "text"), i(3), i(4), i(0)},
    { delimiters='<>' }
    )),
}, {
    -- add snippet conditions
    s('scond', fmt([[{ condition=<> }]],
    { i(1, "math") },
    { delimiters='<>' }
    )),
    s({ trig='sprio', name='snip priority', dscr='Autosnippet to set snippet priority' },
    fmt([[ 
    priority=<>]],
    { i(1, '1000') },
    { delimiters='<>' }
    )),
    s('shide', {t('hidden=true')}
    )
}
