nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

nnoremap <F16> :e 
nnoremap <F14> :vsplit<CR>
nnoremap <F15> :split<CR>

nnoremap <C-s> :w<CR>
nnoremap <C-M-q> :wq<CR>
nnoremap <C-q> :q<CR>
inoremap <C-q> :q<CR>
nnoremap <C-g> :Git status<CR>
nnoremap <C-a> :Git add 
nnoremap <C-M-c> :Git commit -m ""
nnoremap <F24> :Git push 
nnoremap <F23> :Git pull 
nnoremap <F20> :Git diff<CR>

nnoremap <F18> :NvimTreeToggle<CR>
nnoremap <F17> :NvimTreeRefresh<CR>

nnoremap <F19> :tabnew 

inoremap <C-s> <Esc>:w<CR>i
inoremap <C-M-q> <Esc>:wq<CR>i

inoremap <F2> <C-x><C-o>



