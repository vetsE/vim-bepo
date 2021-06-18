if exists("g:vimtex_mappings_enabled") && g:vim_tex_mappings_enabled
  execute 'nmap ls$' maparg('cs$', 'n')
  execute 'nmap lsc' maparg('csc', 'n')
  execute 'nmap lsd' maparg('csd', 'n')
  execute 'nmap lse' maparg('cse', 'n')

  execute 'nmap jse' maparg('tse', 'n')
  execute 'nmap jsc' maparg('tsc', 'n')
  execute 'nmap jsf' maparg('tsf', 'n')
  execute 'xmap jsf' maparg('tsf', 'x')
  execute 'nmap jsd' maparg('tsd', 'n')
  execute 'xmap jsd' maparg('tsd', 'x')
  execute 'nmap jsD' maparg('tsD', 'n')
  execute 'xmap jsD' maparg('tsD', 'x')

  nunmap cs$
  nunmap csc
  nunmap csd
  nunmap cse

  nunmap tse
  nunmap tsc
  nunmap tsf
  nunmap tsd
  nunmap tsD
  xunmap tsf
  xunmap tsd
  xunmap tsD

endif
