let g:airline#themes#noctu#palette = {}

let s:N1   = [ 2, 10, 2, 10 ]
let s:N2   = [ 10, 2, 10, 2 ]
let s:N3   = [ "0", 8, "0", 8 ]
let g:airline#themes#noctu#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#noctu#palette.normal_modified = {
      \ 'airline_c': [ 8, "0", 8, "0" ] ,
      \ }

let s:I1   = [ 6, 14, 6, 14 ]
let s:I2   = [ 14, 6, 14, 6 ]
let s:I3   = [ "0", 8, "0", 8 ]
let g:airline#themes#noctu#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#noctu#palette.insert_modified = {
      \ 'airline_c': [ 8, "0", 8, "0" ] ,
      \ }
let g:airline#themes#noctu#palette.insert_paste = {
      \ 'airline_a': [ 7, 8, 7, 8 ] ,
      \ }

let s:R1   = [ 1, 9, 1, 9 ]
let s:R2   = [ 9, 1, 9, 1 ]
let s:R3   = [ "0", 8, "0", 8 ]
let g:airline#themes#noctu#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#noctu#palette.replace_modified = g:airline#themes#noctu#palette.insert_modified

let s:V1   = [ 3, 11, 3, 11 ]
let s:V2   = [ 11, 3, 11, 3 ]
let s:V3   = [ "0", 8, "0", 8 ]
let g:airline#themes#noctu#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#noctu#palette.visual_modified = {
      \ 'airline_c': [ "0", 8, "0", 8 ] ,
      \ }

let s:IA1   = [ 8, 15, 8, 15 ]
let s:IA2   = [ 8, 7, 8, 7 ]
let s:IA3   = [ "0", 8, "0", 8 ]
let g:airline#themes#noctu#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#noctu#palette.inactive_modified = {
      \ 'airline_c': [ "0", 8, "0", 8 ] ,
      \ }

let g:airline#themes#noctu#palette.accents = {
      \ 'red': [ 1 , 9 , 1 , 9  ]
      \ }

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#noctu#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ 3, 11, 3, 11 ],
      \ [ 11, 3, 11, 3 ],
      \ [ 3, 11, 3, 11 ])
