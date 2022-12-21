

  
  if &background == 'dark'
    
  let s:guishade0 = "#222222"
  let s:guishade1 = "#2A2A2A"
  let s:guishade2 = "#818181"
  let s:guishade3 = "#657B83"
  let s:guishade4 = "#A29DA3"
  let s:guishade5 = "#C1BCC2"
  let s:guishade6 = "#E0DCE0"
  let s:guishade7 = "#FFFFFF"
  let s:guiaccent0 = "#DC322F"
  let s:guiaccent1 = "#CB4B16"
  let s:guiaccent2 = "#B58900"
  let s:guiaccent3 = "#31DE4B"
  let s:guiaccent4 = "#2AA198"
  let s:guiaccent5 = "#268BD2"
  let s:guiaccent6 = "#6C71C4"
  let s:guiaccent7 = "#D33682"
  let s:shade0 = 235
  let s:shade1 = 235
  let s:shade2 = 244
  let s:shade3 = 243
  let s:shade4 = 247
  let s:shade5 = 250
  let s:shade6 = 253
  let s:shade7 = 231
  let s:accent0 = 167
  let s:accent1 = 166
  let s:accent2 = 178
  let s:accent3 = 77
  let s:accent4 = 73
  let s:accent5 = 74
  let s:accent6 = 104
  let s:accent7 = 169
  
  endif
  

  
  if &background == 'light'
    
  let s:guishade0 = "#FDF6E3"
  let s:guishade1 = "#EEE8D5"
  let s:guishade2 = "#93A1A1"
  let s:guishade3 = "#839496"
  let s:guishade4 = "#657B83"
  let s:guishade5 = "#586E75"
  let s:guishade6 = "#073642"
  let s:guishade7 = "#002B36"
  let s:guiaccent0 = "#DC322F"
  let s:guiaccent1 = "#CB4B16"
  let s:guiaccent2 = "#B58900"
  let s:guiaccent3 = "#859900"
  let s:guiaccent4 = "#2AA198"
  let s:guiaccent5 = "#268BD2"
  let s:guiaccent6 = "#6C71C4"
  let s:guiaccent7 = "#D33682"
  let s:shade0 = 230
  let s:shade1 = 254
  let s:shade2 = 247
  let s:shade3 = 245
  let s:shade4 = 243
  let s:shade5 = 102
  let s:shade6 = 23
  let s:shade7 = 23
  let s:accent0 = 167
  let s:accent1 = 166
  let s:accent2 = 178
  let s:accent3 = 142
  let s:accent4 = 73
  let s:accent5 = 74
  let s:accent6 = 104
  let s:accent7 = 169
  
  endif
  

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:guishade1, s:guiaccent5, s:shade1, s:accent5 ], [ s:guishade7, s:guishade2, s:shade7, s:shade2 ] ]
  let s:p.normal.right = [ [ s:guishade1, s:guishade4, s:shade1, s:shade4 ], [ s:guishade5, s:guishade2, s:shade5, s:shade2 ] ]
  let s:p.inactive.right = [ [ s:guishade1, s:guishade3, s:shade1, s:shade3 ], [ s:guishade3, s:guishade1, s:shade3, s:shade1 ] ]
  let s:p.inactive.left =  [ [ s:guishade4, s:guishade1, s:shade4, s:shade1 ], [ s:guishade3, s:guishade0, s:shade3, s:shade0 ] ]
  let s:p.insert.left = [ [ s:guishade1, s:guiaccent3, s:shade1, s:accent3 ], [ s:guishade7, s:guishade2, s:shade7, s:shade2 ] ]
  let s:p.replace.left = [ [ s:guishade1, s:guiaccent1, s:shade1, s:accent1 ], [ s:guishade7, s:guishade2, s:shade7, s:shade2 ] ]
  let s:p.visual.left = [ [ s:guishade1, s:guiaccent6, s:shade1, s:accent6 ], [ s:guishade7, s:guishade2, s:shade7, s:shade2 ] ]
  let s:p.normal.middle = [ [ s:guishade5, s:guishade1, s:shade5, s:shade1 ] ]
  let s:p.inactive.middle = [ [ s:guishade4, s:guishade1, s:shade4, s:shade1 ] ]
  let s:p.tabline.left = [ [ s:guishade6, s:guishade2, s:shade6, s:shade2 ] ]
  let s:p.tabline.tabsel = [ [ s:guishade6, s:guishade0, s:shade6, s:shade0 ] ]
  let s:p.tabline.middle = [ [ s:guishade2, s:guishade4, s:shade2, s:shade4 ] ]
  let s:p.tabline.right = copy(s:p.normal.right)
  let s:p.normal.error = [ [ s:guiaccent0, s:guishade0, s:accent0, s:shade0 ] ]
  let s:p.normal.warning = [ [ s:guiaccent2, s:guishade1, s:accent2, s:shade1 ] ]

  let g:lightline#colorscheme#ThemerVimLightline#palette = lightline#colorscheme#fill(s:p)

  