let g:airline#themes#noctu#palette = {}
let s:N1 = [0, 7, 0, 7]
let s:N2 = [7, 8, 7, 8]
let s:N3 = [8, 0, 8, 0]
let g:airline#themes#noctu#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#noctu#palette.normal.airline_warning = [ 0, 3, 0, 3 ]
let g:airline#themes#noctu#palette.normal.airline_error = [ 0, 1, 0, 1 ]
let g:airline#themes#noctu#palette.normal_modified = {
      \ 'airline_c': [7, 0, 7, 0] ,
      \ }

let s:I1 = [0, 3, 0, 3]
let s:I2 = [7, 8, 7, 8]
let s:I3 = [8, 0, 8, 0]
let g:airline#themes#noctu#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#noctu#palette.insert.airline_warning = [ 0, 3, 0, 3 ]
let g:airline#themes#noctu#palette.insert.airline_error = [ 0, 1, 0, 1 ]
let g:airline#themes#noctu#palette.insert_modified = {
      \ 'airline_c': [7, 0, 7, 0] ,
      \ }

let s:R1 = [0, 1, 0, 1]
let s:R2 = [7, 8, 7, 8]
let s:R3 = [8, 0, 8, 0]
let g:airline#themes#noctu#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#noctu#palette.replace.airline_warning = [ 0, 3, 0, 3 ]
let g:airline#themes#noctu#palette.replace.airline_error = [ 0, 1, 0, 1 ]
let g:airline#themes#noctu#palette.replace_modified = {
      \ 'airline_c': [7, 0, 7, 0] ,
      \ }

let s:V1 = [0, 2, 0, 2]
let s:V2 = [7, 8, 7, 8]
let s:V3 = [8, 0, 8, 0]
let g:airline#themes#noctu#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#noctu#palette.visual.airline_warning = [ 0, 3, 0, 3 ]
let g:airline#themes#noctu#palette.visual.airline_error = [ 0, 1, 0, 1 ]
let g:airline#themes#noctu#palette.visual_modified = {
      \ 'airline_c': [7, 0, 7, 0] ,
      \ }

let s:IA1 = [8, 0, 8, 0]
let s:IA2 = [8, 0, 8, 0]
let s:IA3 = [8, 0, 8, 0]
let g:airline#themes#noctu#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#noctu#palette.inactive.airline_warning = [ 0, 3, 0, 3 ]
let g:airline#themes#noctu#palette.inactive.airline_error = [ 0, 1, 0, 1 ]
let g:airline#themes#noctu#palette.inactive_modified = {
      \ 'airline_c': [7, 0, 7, 0] ,
      \ }

let g:airline#themes#noctu#palette.accents = {
      \ 'red': [1 , '' , 1 , '' ],
      \ 'green': [2, '', 2, '' ],
      \ 'yellow': [11, '', 11, '' ],
      \ 'blue': [4, '', 4, '' ],
      \ 'orange': [3, '', 3, '' ],
      \ 'purple': [5, '', 5, '' ],
      \ }

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#noctu#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [8, 0, 8, 0],
      \ [0, 7, 0, 7],
      \ [7, 8, 7, 8])

