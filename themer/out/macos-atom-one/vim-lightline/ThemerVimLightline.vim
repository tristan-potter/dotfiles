

  
  if &background == 'dark'
    
  let s:guishade0 = "#222222"
  let s:guishade1 = "#424242"
  let s:guishade2 = "#616161"
  let s:guishade3 = "#818181"
  let s:guishade4 = "#A0A0A0"
  let s:guishade5 = "#C0C0C0"
  let s:guishade6 = "#DFDFDF"
  let s:guishade7 = "#FFFFFF"
  let s:guiaccent0 = "#E06C75"
  let s:guiaccent1 = "#D19A66"
  let s:guiaccent2 = "#E5C07B"
  let s:guiaccent3 = "#98C379"
  let s:guiaccent4 = "#56B6C2"
  let s:guiaccent5 = "#61AFEF"
  let s:guiaccent6 = "#C678DD"
  let s:guiaccent7 = "#BE5046"
  let s:shade0 = 235
  let s:shade1 = 238
  let s:shade2 = 241
  let s:shade3 = 244
  let s:shade4 = 247
  let s:shade5 = 250
  let s:shade6 = 253
  let s:shade7 = 231
  let s:accent0 = 1
  let s:accent1 = 7
  let s:accent2 = 13
  let s:accent3 = 150
  let s:accent4 = 116
  let s:accent5 = 111
  let s:accent6 = 3
  let s:accent7 = 173
  
  endif
  

  
  if &background == 'light'
    
  let s:guishade0 = "#FAFAFA"
  let s:guishade1 = "#CDCED1"
  let s:guishade2 = "#A0A1A7"
  let s:guishade3 = "#9D9D9F"
  let s:guishade4 = "#83858B"
  let s:guishade5 = "#696C77"
  let s:guishade6 = "#51535D"
  let s:guishade7 = "#383A42"
  let s:guiaccent0 = "#E45649"
  let s:guiaccent1 = "#986801"
  let s:guiaccent2 = "#C18401"
  let s:guiaccent3 = "#50A14F"
  let s:guiaccent4 = "#0184BC"
  let s:guiaccent5 = "#4078F2"
  let s:guiaccent6 = "#A626A4"
  let s:guiaccent7 = "#CA1243"
  let s:shade0 = 231
  let s:shade1 = 252
  let s:shade2 = 247
  let s:shade3 = 247
  let s:shade4 = 245
  let s:shade5 = 242
  let s:shade6 = 240
  let s:shade7 = 237
  let s:accent0 = 0
  let s:accent1 = 136
  let s:accent2 = 178
  let s:accent3 = 108
  let s:accent4 = 38
  let s:accent5 = 69
  let s:accent6 = 133
  let s:accent7 = 161
  
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

  