set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
"dein Scripts-----------------------------
" dein.vim がなければ github から落としてくる
let s:dein_dir = expand('~/vimfiles/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if &compatible
  set nocompatible               " Be iMproved
endif
"set runtimepath+=/home/enotiru/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add('vim-scripts/bufferlist.vim')
  call dein#add('junegunn/vim-easy-align')

  let s:toml = s:dein_dir . '../.dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

 if dein#check_install()
   call dein#install()
 endif

 "End dein Scripts-------------------------

 "setting https://qiita.com/hide/items/229ff9460e75426a2d07
 "文字コードをUFT-8に設定
 "set fenc=utf-8
 " バックアップファイルを作らない
 "set nobackup
 " スワップファイルを作らない
 set noswapfile
 " 編集中のファイルが変更されたら自動で読み直す
 set autoread
 " バッファが編集中でもその他のファイルを開けるように
 set hidden
 " 入力中のコマンドをステータスに表示する
 set showcmd

 " 見た目系
 " 行番号を表示
 set number
 " 現在の行を強調表示
 "set cursorline
 " 現在の行を強調表示（縦）
 "set cursorcolumn
 " 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
 " インデントはスマートインデント
 set smartindent

 " インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

vmap <BS> <Del>
imap <BS> <BS>
" 挿入モードーノーマルモード間移動を高速化
set ttimeoutlen=10
" Start interactive EasyAlign in visual mode (e.g. vipga)
 xmap ga <Plug>(EasyAlign)
"  Start interactive EasyAlign for a motion/text object (e.g. gaip)
 nmap ga <Plug>(EasyAlign)

"set autoindent
set smartindent

set mouse=a

set number
set clipboard+=autoselect
set clipboard+=unnamed
" Tab文字を半角スペースにする
set expandtab

set hidden
"set tabstop=4
imap ffff # Atsushi ENOMOTO <enotiru@moove.co.jp> moove Co., Ltd.
set whichwrap=b,s,<,>,[,]
set tabstop=4
set shiftwidth=4
vnoremap <silent> <C-p> "0p<CR>
map <C-b> :call BufferList()<CR>
syntax on
colorscheme molokai
"colorscheme random
set t_Co=256
"================括弧補完===========
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"===================space red========================
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
autocmd FileType help nnoremap <buffer> q <C-w>c
set backspace=indent,eol,start

" ===================airline_theme====================
let g:airline_theme = 'molokai'
" ===================Yggdroot/indentLine==============
let g:indentLine_char = '¦'
"====================neocomplcache====================
" ~Disable AutoComplPop. neocomplcashe~
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"~neocomplecas~


"====================neosnippet====================
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


 " For conceal markers.
 "if has('conceal')
 "  set conceallevel=2 concealcursor=niv
 "endif

 " ~ファイルタイプ毎 & gitリポジトリ毎にtagsの読み込みpathを変える~
 function! ReadTags(type)
     try
       execute "set tags=".$HOME."/dotfiles/tags_files/".
            \ system("cd " . expand('%:p:h') . "; basename `git rev-parse --show-toplevel` | tr -d '\n'").
           \ "/" . a:type . "_tags"
      catch
        execute "set tags=./tags/" . a:type . "_tags;"
     endtry
 endfunction

 augroup TagsAutoCmd
     autocmd!
     autocmd BufEnter * :call ReadTags(&filetype)
 augroup END

 "====================mattn/emmet-vim===============html補完
 let g:user_emmet_leader_key='<C-t>'
 "====================vim-json=========================
 let g:vim_json_syntax_conceal = 0
 "====================nerdtree============================
 map <C-n> :NERDTreeToggle<CR>
 "======================gitgutter===================
 "画面をガタガタ言わせない
 set signcolumn=yes
 "タイピング終了後すぐに反映する
 set updatetime=100
