" ----------------------------------------------------------
" Initialize plug
" ----------------------------------------------------------
" vim
if empty(glob('$HOME/.vim/autoload/plug.vim'))
    if !executable("curl")
        echoer "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing vim-Plug..."
    silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" nvim
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
    echo "Installing nvim-Plug..."
    silent !\curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ------How to Use------------------------------------------
" Install   :   PlugInstall
" Uninstall :   PlugClean (execute after comment out for Plugin's sentence)
" ----------------------------------------------------------
call plug#begin('~/.vim/plugged')
"ファイルオープンを便利に
Plug 'Shougo/unite.vim'
"Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
"ファイルをtree表示してくれる
Plug 'preservim/nerdtree'
"Gitを便利に使う
Plug 'tpope/vim-fugitive'
"ステータスラインの表示内容強化
Plug 'itchyny/lightline.vim'
"インデントの可視化
Plug 'Yggdroot/indentLine'
"末尾の全角半角空白文字を赤くハイライト
Plug 'bronson/vim-trailing-whitespace'
"シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'
"コメントアウト (gccと入力)
Plug 'tpope/vim-commentary'
"tmux利用時のウィンドウ移動もvimと同じ用にctrl+hjklで行える
Plug 'christoomey/vim-tmux-navigator'
""IDEのように(){}[]を補完、削除
"Plug 'jiangmiao/auto-pairs'
call plug#end()

" ----------------------------------------------------------
" 基本設定
" ----------------------------------------------------------
set shell=zsh " デフォルトのシェル
set nobackup " バックアップファイルを作らない
set clipboard=unnamedplus
set noswapfile " スワップファイルを作らない
set autoread " 編集中のファイルが変更されたら自動で読み直す
set hidden " バッファが編集中でもその他のファイルを開けるように
set synmaxcol=200 " クラッシュ防止
inoremap <silent> jj <ESC> " インサートモード
autocmd FileType * set comments= "インデント時にコメントアウトを連続させない
set ttimeoutlen=10 " キーコードシーケンスが終了するのを待つ時間を短くする(Escキーのラグ対策)
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
set modifiable "nvim用
let loaded_matchparen=1 " カッコのハイライトを消す

" ----------------------------------------------------------
"  表示
" ----------------------------------------------------------
syntax enable
set t_Co=256
" colorscheme peachpuff
" set background=light
set cursorline
set guifont=Migu_1M:h14
set number " 行番号を表示
set laststatus=2 " 常にステータスラインを表示する
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

" ----------------------------------------------------------
" カーソルの色
" ----------------------------------------------------------
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
 "ビジュアルモードの色
hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

"----------------------------------------------------------
" 文字列検索
"----------------------------------------------------------
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------
" 移動
"----------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnorema <up> gk
set backspace=indent,eol,start " バックスペースキーの有効化

"----------------------------------------------------------
" Ctrl
"----------------------------------------------------------
nnoremap <C-s> :w<CR>       " Ctrl + s で保存
inoremap <C-s> <ESC>:w<CR>  " Ctrl + s で保存

"---------------------------------------------------------
" スペース
"----------------------------------------------------------
let mapleader = "\<space>"
noremap <Leader>w :w<CR>
noremap <Leader>q :wq<CR>
noremap <Leader>z :e ~/.zshrc<CR>
noremap <Leader>. :e ~/.vimrc<CR>
noremap <Leader>t :e ~/.tmux.conf<CR>

"----------------------------------------------------------
" 自動的に閉じ括弧を入力
"----------------------------------------------------------
imap { {}<LEFT>
imap ( ()<ESC>
imap [ []<LEFT>

"----------------------------------------------------------
" nerdtree
"---------------------------------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1 "隠しファイルを表示

filetype on " filetypeの自動検出(最後の方に書いた方がいいらしい) すべて選択
