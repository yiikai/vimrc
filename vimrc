set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'


set mouse=a
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

"要安装的插件
"PowerLine插件 状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
""vim有一个状态栏 加上powline则有两个状态栏
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'


"-- Cscope setting --
"
if has("cscope")

set csprg=/usr/bin/cscope " 指定用来执行cscope的命令

set csto=0 "
"设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
"
set cst " 同时搜索cscope数据库和标签文件

set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果

set nocsverb

if filereadable("cscope.out") "
"若当前目录下存在cscope数据库，添加该数据库到vim

cs add cscope.out

elseif $CSCOPE_DB != "" "
"否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim

cs add $CSCOPE_DB

endif

set csverb

endif

map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>

map <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
"
"" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-,
"然后很快再按下c）

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>

nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>

nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>

nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>

nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>

nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>



Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>

Bundle 'kien/ctrlp.vim'
map g<C-] :cs find 3 <C-R>=expand("<cword>")<CR><CR>

map g<C-\ :cs find 0 <C-R>=expand("<cword>")<CR><CR>

Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_confirm_extra_conf=0  
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
""let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
""let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM
"基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	
"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with
"syntastic
""nnoremap <leader>lo :lopen<CR>	"open locationlist
nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <silent>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 


map <F4> :call TitleDet()<cr>
function AddTitle()
    call append(0,"/******************************************************")
    call append(1,"# Author       : Yii-Kai Mao")
    call append(2,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(3,"# Email        : yiikai1987910@gmail.com")
    call append(4,"# Filename     : ".expand("%:t"))
    call append(5,"# Description  : ")
    call append(6,"******************************************************/")
    echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endf
 
function UpdateTitle()
     normal m'
     execute '/# Last modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
     normal ''
     normal mk
     execute '/# Filename/s@:.*$@\=":\t".expand("%:t")@'
     execute "noh"
     normal 'k
     echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction


Bundle 'vim-scripts/a.vim'


Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28	"设置taglist的宽度
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1 "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1 "在左侧窗口中显示taglist窗口

Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

Bundle 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

Bundle 'Lokaltog/powerline'
set laststatus=2
Bundle 'winmanager'
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWidth = 30
nmap wm :WMToggle<CR>

filetype plugin indent on     " required!
"
" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
