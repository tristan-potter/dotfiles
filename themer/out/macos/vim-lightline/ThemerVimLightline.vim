

  
  if &background == 'dark'
    
  let s:guishade0 = "#222222"
  let s:guishade1 = "#2A2A2A"
  let s:guishade2 = "#818181"
  let s:guishade3 = "#818181"
  let s:guishade4 = "#A29DA3"
  let s:guishade5 = "#C1BCC2"
  let s:guishade6 = "#E0DCE0"
  let s:guishade7 = "#FFFCFF"
  let s:guiaccent0 = "#FF6961"
  let s:guiaccent1 = "#FFB340"
  let s:guiaccent2 = "#FFD426"
  let s:guiaccent3 = "#31DE4B"
  let s:guiaccent4 = "#70D7FF"
  let s:guiaccent5 = "#409CFF"
  let s:guiaccent6 = "#DA8FFF"
  let s:guiaccent7 = "#FF6482"
  let s:shade0 = 235
  let s:shade1 = 235
  let s:shade2 = 244
  let s:shade3 = 244
  let s:shade4 = 247
  let s:shade5 = 250
  let s:shade6 = 253
  let s:shade7 = 231
  let s:accent0 = 210
  let s:accent1 = 221
  let s:accent2 = 221
  let s:accent3 = 77
  let s:accent4 = 117
  let s:accent5 = 75
  let s:accent6 = 183
  let s:accent7 = 211
  
  endif
  

  
  if &background == 'light'
    
  let s:guishade0 = "#818181"
  let s:guishade1 = "#6F6F6F"
  let s:guishade2 = "#5C5C5C"
  let s:guishade3 = "#4A4A4A"
  let s:guishade4 = "#373737"
  let s:guishade5 = "#252525"
  let s:guishade6 = "#121212"
  let s:guishade7 = "#000000"
  let s:guiaccent0 = "#FF6961"
  let s:guiaccent1 = "#FFB340"
  let s:guiaccent2 = "#FFD426"
  let s:guiaccent3 = "#31DE4B"
  let s:guiaccent4 = "#70D7FF"
  let s:guiaccent5 = "#409CFF"
  let s:guiaccent6 = "#DA8FFF"
  let s:guiaccent7 = "#FF6482"
  let s:shade0 = 244
  let s:shade1 = 242
  let s:shade2 = 240
  let s:shade3 = 239
  let s:shade4 = 237
  let s:shade5 = 235
  let s:shade6 = 233
  let s:shade7 = 16
  let s:accent0 = 210
  let s:accent1 = 221
  let s:accent2 = 221
  let s:accent3 = 77
  let s:accent4 = 117
  let s:accent5 = 75
  let s:accent6 = 183
  let s:accent7 = 211
  
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

  