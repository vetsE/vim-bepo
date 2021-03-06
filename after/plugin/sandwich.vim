if exists("g:loaded_sandwich") && !exists("g:sandwich_bepo_loaded")

let g:sandwich_bepo_loaded = 1
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

xmap iç <Plug>(textobj-sandwich-query-i)
xmap aç <Plug>(textobj-sandwich-query-a)
omap iç <Plug>(textobj-sandwich-query-i)
omap aç <Plug>(textobj-sandwich-query-a)

xmap içç <Plug>(textobj-sandwich-auto-i)
xmap açç <Plug>(textobj-sandwich-auto-a)
omap içç <Plug>(textobj-sandwich-auto-i)
omap açç <Plug>(textobj-sandwich-auto-a)

xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)

nmap yç <Plug>(operator-sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> yçç <Plug>(operator-sandwich-add)<SID>line
onoremap <SID>gul g_
nmap yÇ yç<SID>gul

nmap dç <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dçç <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap lç <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap lçç <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

xmap Ç <Plug>(operator-sandwich-add)

runtime autoload/repeat.vim
if hasmapto('<Plug>(RepeatDot)')
  nmap . <Plug>(operator-sandwich-predot)<Plug>(RepeatDot)
else
  nmap . <Plug>(operator-sandwich-dot)
endif

" Default recipes
let g:sandwich#recipes = [
      \   {
      \     'buns': ['\s\+', '\s\+'],
      \     'regex': 1,
      \     'kind': ['delete', 'replace', 'query'],
      \     'input': [' ']
      \   },
      \
      \   {
      \     'buns':         ['', ''],
      \     'action':       ['add'],
      \     'motionwise':   ['line'],
      \     'linewise':     1,
      \     'input':        ["\<CR>"]
      \   },
      \
      \   {
      \     'buns':         ['^$', '^$'],
      \     'regex':        1,
      \     'linewise':     1,
      \     'input':        ["\<CR>"]
      \   },
      \
      \   {
      \     'buns':         ['<', '>'],
      \     'expand_range': 0,
      \     'input':        ['>', 'a'],
      \   },
      \
      \   {
      \     'buns':         ['`', '`'],
      \     'quoteescape':  1,
      \     'expand_range': 0,
      \     'nesting':      0,
      \     'linewise':     0,
      \   },
      \
      \   {
      \     'buns':         ['"', '"'],
      \     'quoteescape':  1,
      \     'expand_range': 0,
      \     'nesting':      0,
      \     'linewise':     0,
      \   },
      \
      \   {
      \     'buns':         ["'", "'"],
      \     'quoteescape':  1,
      \     'expand_range': 0,
      \     'nesting':      0,
      \     'linewise':     0,
      \   },
      \
      \   {
      \     'buns':         ['{', '}'],
      \     'nesting':      1,
      \     'skip_break':   1,
      \     'input':        ['{', '}', 'B'],
      \   },
      \
      \   {
      \     'buns':         ['[', ']'],
      \     'nesting':      1,
      \     'input':        ['[', ']', 'r'],
      \   },
      \
      \   {
      \     'buns':         ['(', ')'],
      \     'nesting':      1,
      \     'input':        ['(', ')', 'b'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#t#tag()',
      \     'listexpr': 1,
      \     'kind': ['add'],
      \     'action': ['add'],
      \     'input': ['t', 'T'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#t#tag()',
      \     'listexpr': 1,
      \     'kind': ['replace'],
      \     'action': ['add'],
      \     'input': ['T', '<'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#t#tagname()',
      \     'listexpr': 1,
      \     'kind': ['replace'],
      \     'action': ['add'],
      \     'input': ['t'],
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-tag-i)", "\<Plug>(textobj-sandwich-tag-a)"],
      \     'noremap': 0,
      \     'kind': ['delete', 'textobj'],
      \     'expr_filter': ['operator#sandwich#kind() !=# "replace"'],
      \     'linewise': 1,
      \     'input': ['t', 'T', '<'],
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-tag-i)", "\<Plug>(textobj-sandwich-tag-a)"],
      \     'noremap': 0,
      \     'kind': ['replace', 'query'],
      \     'expr_filter': ['operator#sandwich#kind() ==# "replace"'],
      \     'input': ['T', '<'],
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-tagname-i)", "\<Plug>(textobj-sandwich-tagname-a)"],
      \     'noremap': 0,
      \     'kind': ['replace', 'textobj'],
      \     'expr_filter': ['operator#sandwich#kind() ==# "replace"'],
      \     'input': ['t'],
      \   },
      \
      \   {
      \     'buns': ['sandwich#magicchar#f#fname()', '")"'],
      \     'kind': ['add', 'replace'],
      \     'action': ['add'],
      \     'expr': 1,
      \     'input': ['f']
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-function-ip)", "\<Plug>(textobj-sandwich-function-i)"],
      \     'noremap': 0,
      \     'kind': ['delete', 'replace', 'query'],
      \     'input': ['f']
      \   },
      \
      \   {
      \     'external': ["\<Plug>(textobj-sandwich-function-ap)", "\<Plug>(textobj-sandwich-function-a)"],
      \     'noremap': 0,
      \     'kind': ['delete', 'replace', 'query'],
      \     'input': ['F']
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#input("operator")',
      \     'kind': ['add', 'replace'],
      \     'action': ['add'],
      \     'listexpr': 1,
      \     'input': ['i'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#input("textobj", 1)',
      \     'kind': ['delete', 'replace', 'query'],
      \     'listexpr': 1,
      \     'regex': 1,
      \     'input': ['i'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#lastinput("operator", 1)',
      \     'kind': ['add', 'replace'],
      \     'action': ['add'],
      \     'listexpr': 1,
      \     'input': ['I'],
      \   },
      \
      \   {
      \     'buns': 'sandwich#magicchar#i#lastinput("textobj")',
      \     'kind': ['delete', 'replace', 'query'],
      \     'listexpr': 1,
      \     'regex': 1,
      \     'input': ['I'],
      \   },
      \ ]

unmap srb
unmap sdb
unmap sr
unmap sd
unmap sa
endif
