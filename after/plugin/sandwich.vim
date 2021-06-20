if exists("g:loaded_sandwich") && maparg('srb', 'n') !=# ''
    execute 'nmap çrb' maparg('srb', 'n')
    execute 'nmap çdb' maparg('sdb', 'n')
    execute 'nmap çr' maparg('sr', 'n')
    execute 'nmap çs' maparg('sd', 'n')
    execute 'nmap ça' maparg('sa', 'n')

    execute 'xmap çr' maparg('sr', 'x')
    execute 'xmap çd' maparg('sd', 'x')
    execute 'xmap ça' maparg('sa', 'x')

    execute 'omap ça' maparg('sa', 'o')

    nunmap srb
    nunmap sdb
    nunmap sr
    nunmap sd
    nunmap sa
    xunmap sr
    xunmap sd
    xunmap sa
    ounmap sa
endif
