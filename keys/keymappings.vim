nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

nnoremap <F16> :e 
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>ol :SymbolsOutline<CR>

nnoremap <C-s> :w<CR>
nnoremap <C-M-q> :wq<CR>
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:wq<CR>
nnoremap <C-g> :Git status<CR>
nnoremap <C-a> :Git add 
nnoremap <leader>ga :Git commit -m ""
nnoremap <F24> :Git push 
nnoremap <F23> :Git pull 
nnoremap <leader>gd :Git diff<CR>

nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>

nnoremap <leader>n :tabnew
nnoremap <leader>li :LspInfo<CR>
nnoremap <leader>ls :LspStart<CR>

inoremap <C-s> <Esc>:w<CR>i
inoremap <C-M-q> <Esc>:wq<CR>i

inoremap <S-TAB> <C-x><C-o>
