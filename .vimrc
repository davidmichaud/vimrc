" .vimrc by D. Michaud

" =============================================================================
" Vim options
" =============================================================================

" ---------------------
" vim behaviour options
" ---------------------
if has('win32')
    behave xterm
    set nomousefocus
    let $VHOME=$HOME . "/vimfiles"
    " set runtimepath=$VIM,$VIMRUNTIME
else
    behave xterm
    set mouse=a
    let $VHOME=$HOME . "/.vim"
endif

set mousemodel=popup
let $PATH=$PATH . ":" . $VHOME . "/utils"
set nocompatible                    " turn off 100% vi compatibility
set cpoptions=aABcdeFs%/            " RTFM.
set path=.,inc,src                  " where to search when using find
if has('win32')
    set directory=~/vimfiles/tmp    " where to put swap files (should be local or it could be slow editing remote files)
else
    set directory=~/.vim/tmp        " where to put swap files (should be local or it could be slow editing remote files)
endif
set viminfo='20,\"50                " how much junk to write into viminfo
set history=500                     " depth of command (:) history
set nobackup                        " don't spew backup files all over the place, we don't work on a flaky tty.
set fileformats=unix,dos,mac        " self explanatory
set hidden                          " don't unload buffers when unloaded
set encoding=utf-8
set autoread                        " Automatically reload a file when changed from outside vim
if has('mac')
    set macmeta                     " allow interpretation of alt key bindings (disables special chars for the bound keys)
endif
filetype on                         " enable filetype detection to set automatically the filetype of the file for syntax highlightling, etc
filetype plugin on                  " enable loading plugin files for the detected filetype. File type plugins are located in the ftplugin folder.
filetype indent on                  " enable loading indent file for detected filetypes.


" ------------
" LaTeX Config
" ------------
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'Preview'  " set Preview as the pdf viewer for the LaTeX suite.
let g:Tex_Flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
 
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
" let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'latexmk --pdf $*'
 
let g:Tex_ViewRule_dvi = 'texniscope'
let g:Tex_ViewRule_ps = 'Preview'
let g:Tex_ViewRule_pdf = 'Skim'
 
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'

let g:Tex_MultipleCompileFormats = 'dvi,ps,pdf'

" let g:Tex_IgnoredWarnings ='
"       \"Underfull\n".
"       \"Overfull\n".
"       \"specifier changed to\n".
"       \"You have requested\n".
"       \"Missing number, treated as zero.\n".
"       \"There were undefined references\n".
"       \"Citation %.%# undefined\n".
"       \"\oval, \circle, or \line size unavailable\n"' 


" -------------------
" vim editing options
" -------------------
set virtualedit=all                 " allow the cursor to go past EOL in insert mode for when you're scrolling up and down to make similar edits in a dumb way
set backspace=2                     " allow deletion of chars inserted outside the current insert session
set clipboard+=unnamed              " link the unnamed register with the clipboard to allow pasting the clipboard (when the clipboard was updated last)
set nostartofline                   " keep the cursor in the same column after doing pasting/moving/etc, when possible
set nowrap                          " line wrapping is really annoying
set textwidth=0                     " auto word wrapping is really annoying, we don't live in the days of 80 column ttys over 300 baud modems, people!
set wrapmargin=0
set smarttab                        " A tab in front of a line inserts 'shiftwidth' blanks
set expandtab                       " use spaces instead of actual tabs since vim can handle them like tabs anyway, and it makes nicer output for the pee-ons that use Notepad and Eclipse...
                                    " NB: If you don't use expandtab, you should reset tabstop and shiftwidth to 8. RTFM on tabstop.
set tabstop=4                       " I don't like 8 column tabs. I don't like 2-column tabs... I like four column tabs. It's readable, and it's concise.
set shiftwidth=4                    " Number of spaces to use for each step of (auto)indent
set softtabstop=4                   " number of spaces a TAB counts for, for inserting and deleting fake tabs (expandtab)
set autoindent                      " use indent from current line on next line
set smartindent                     " general indent style like C
set cindent                         " strict C style indenting, in general good
set cino=>1s,e0,n0,f0,{0,}0,^0,:1s,=1s,l1,b0,g1s,h1s,p0.5s,t0,i1s,+0.5s,c3,C0,/0,(0,w1,)20,*30
                                        " >s   add 1 shiftwidth on normal indent
                                        " e0   add 0 to prevailing-indent if '{' not at start-of-line
                                        " n0   add 0 to prevailing-indent for statements after if/while/etc, if statements not inside {}
                                        " f0   first opening { of a function/block is placed in column 0
                                        " {0   opening braces are placed 0 characters from prevailing indent
                                        " }4   closing braces are placed 4 characters from the matching opening {'s indent
                                        " ^-1s add -1 space to prevailing-indent if opening brace is in column 0
                                        " :0   case labels are placed 0 characters from switch()'s indent
                                        " =s   statements after a case label are placed 1 shiftwidth from indent of label
                                        " g0   c++ scope (public, private, etc) placed 0 chars from indent of block they're in
                                        " h1s  c++ statements after public/private/etc 1shiftwidth in
                                        " p2   k&r function-argument parameter declarations placed 2chars in from margin
                                        " t0   types for function declaration indented flush with margin
                                        " +2   continuation lines (split lines) are indented an additional 2 spaces
                                        " (2   when in unclosed parentheses, indent two spaces
                                        " )20  unclosed parentheses will be searched for at most 20 lines away
                                        " *30  unclosed comments will be searched for 30 lines away


" ----------------------------
" folding and complete options
" ----------------------------
set foldenable                      " enable line folding
set foldmarker={,}                  " start and end of foldable lines
set foldmethod=marker
set foldlevel=15                    " more than this many lines will be folded by default
set foldopen=block,hor,mark,percent,quickfix,tag
set foldtext=SimpleFoldText()       " use the custom folded text display function above for closed folds.
set completefunc=ccomplete#Complete " default user complete function
set completeopt=menu,preview,longest " show menu for possible completions.
                                    " show information about the selected completion in the preview window.
                                    " only insert the longest common text of the match.


" --------------
" search options
" --------------
set incsearch                       " use incremental search
set hlsearch                        " highlight all instances of the current search pattern (togglable with F8 mapping below)
set noignorecase                    " ignore search case (general)
set infercase                       " infer search case
set smartcase                       " smart case


" ---------------
" display options
" ---------------
" set ruler                         " the column pos is displayed anyway by the customized status line
set title                           " display the current file in the WM title, when possible
set ttyfast                         " fast term connection: better redrawing quality
set lazyredraw                      " don't redraw the screen while executing macros and registers
set visualbell t_vb=                " disable the visual bell and the annoying audible bell... wir sind keine Anfänger...
set showmatch                       " briefly jump to the start/end of a bracket/paren/brace for 'matchtime'
set matchtime=5                     " time to show matching brace in 10ths of second resolution (5 = 500ms)
set list                            " display tabs in files and show where there are trailing spaces after the end of lines... useful for cleanung up code from the Eclipse folks...
set listchars=tab:>-,trail:-        " define what to display (this is toggled by F7 according to the map below)
set scrolloff=2                     " number of context lines to show while scrolling up/down
set cursorline                      " highlight (color defined in colorscheme) the current line the cursor's on.
"set cursorcolumn                    " highlight the current column the cursor is in.
set number                          " show line numbers
set numberwidth=6                   " fixed column width for the line numbers
set showcmd                         " show the buildup of the current command in the lower right hand of the screen
set cmdheight=3                     " set the command line height to three lines
set statusline=%f\ [B%2n]\ %m%r%h[%{&ff}]%y[L%4l\ C%4v][%p%%]
set laststatus=2                    " last window always has a status line
" set lines=60                      " sets the default number of lines to open vim with
" set columns=180                   " sets the default number of columns to open vim with.
set guioptions=ceigt                " prefer console dialogs

if has('mac')
    set transparency=5              " set transparency to 5%.
    set fuoptions=maxvert,maxhorz   " for fullscreen mode
endif

if has('mac')
    set guifont=Consolas:h11        " is there any other font? no.
    set linespace=1                 " explicitly set the space between lines to 1px. Easier to read
else
    set guifont=Consolas:h10        " is there any other font? no.
    set linespace=1                 " explicitly set the space between lines to 1px. Easier to read
endif

let g:molokai_original=1
colorscheme molokai                 " it's customized for C syntax highlighting. Josh, look into jellybeans.vim and the tags.sh and tags.awk to extend that to perl and other shit.
syntax on                           " syntax highlighting makes the world go around.


" =============================================================================
" Auto commands
" =============================================================================

" restore where we last were in the file upon opening the file (I think it's found out from the .viminfo file)
" so that the next time you open the file (even after having closed vim!), you'll come back to where you were ;-)
autocmd! BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal g'\"" |
            \ endif

autocmd! BufWritePost * :UMiniBufExplorer

" When vimrc is edited, automatically reload it
if has('win32')
    autocmd! BufWritePost _vimrc source $MYVIMRC
else
    autocmd! BufWritePost vimrc source $MYVIMRC
endif

" autocmd! BufLeave * if pumvisible() == 0|silent! pclose|endif


" =============================================================================
" custom function declarations
" =============================================================================
" Toggle line wrapping and associated display line movements
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> j
        silent! nunmap <buffer> k
        silent! iunmap <buffer> j
        silent! iunmap <buffer> k
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> 0 g0
        noremap  <buffer> <silent> k gk
        noremap  <buffer> <silent> j gj
    endif
endfunction


" following function specifies the text shown for a closed fold, used by 'foldtext' option below.
function! SimpleFoldText()
    return getline(v:foldstart).' '
endfunction

" function used to remap <tab> in insert mode for the natural integration of the omnicomplete auto-complete/context menu thing.
function! Smart_TabComplete()
    if pumvisible()
        return "\<C-X>\<C-O>"
    endif
    if (strlen(&omnifunc) == 0)
        return "\<C-N>"
    endif
    let line = getline('.')                         " curline
    let substr = strpart(line, -1, col('.')+1)      " from start to cursor
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    if (strlen(substr)<=1)                          " nothing to match on empty string
        return "\<tab>"
    endif
    let has_semicolon = match(substr, '\;') != -1
    if (has_semicolon)
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    let has_colon = match(substr, '\:') != -1
    let has_arrow = match(substr, '>') != -1
    let has_paren = match(substr, '(') != -1
    if (!has_period && !has_slash && !has_colon && !has_arrow)
        " return "\<C-X>\<C-P>"                         " existing text matching
        return "\<C-X>\<C-O>"                       " existing text matching
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                       " file matching
    else
        return "\<C-X>\<C-O>"                       " plugin matching
    endif
endfunction

function! ToggleScrollbars()
  if g:scrollbars == 'on'
    let g:scrollbars = 'off'
    set guioptions-=LRr
  else
    let g:scrollbars = 'on'
    set guioptions+=LRr
  endif
endfunction

function! ToggleMenuBar()
  if g:menubar == 'on'
    let g:menubar = 'off'
    set guioptions-=m
  else
    let g:menubar = 'on'
    set guioptions+=m
  endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/' . l:pattern . '/j' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! InsertHLine(dir)
    if a:dir == 'u'
        let n = strlen(getline(line('.')-1))-virtcol('.')+1
    elseif a:dir == 'd'
        let n = strlen(getline(line('.')+1))-virtcol('.')+1
    else
        let n = 80-virtcol('.')
    endif
    let thechar = getline('.')[col('.')-2]
    let myline = repeat(thechar, n)
    return myline
endfunction

" =============================================================================
" plugin configurations and other 'lets'
" =============================================================================
let g:scrollbars = 'off'
let g:menubar = 'off'
let g:Align_xstrlen= 3                  " slow variant of strlen for Align plugin

" Configure OmniComplete
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_SelectFirstItem = 1
let OmniCpp_LocalSearchDecl = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1

" Configure ACP
let g:acp_ignorecaseOption = 0
let g:acp_behaviorUserDefinedFunction = '<C-X><C-O>'

" Configure TagList
let Tlist_Show_Menu = 1                " show menu in TagList when active.
let Tlist_Auto_Highlight_Tag = 1       " automatically highlight the tag that's active (when you're in a function or on a variable, etc)
let Tlist_Compact_Format = 1           " don't add extra blank lines between tag types
let Tlist_Display_Prototype = 0        " display function prototype as well, not just the function name
let Tlist_File_Fold_Auto_Close = 0     " the tags for other files can be set to be closed when their buffer isn't active
let Tlist_Max_Submenu_Items = 20       " max num of tags of the same type before breaking the tree up (with ...)
let Tlist_Max_Tag_Length = 16          " max tag length to display before truncating
let Tlist_Show_One_File = 0            " don't just show the tags from the active buffer
let Tlist_Use_Right_Window = 1         " put Taglist on the right
let Tlist_Use_SingleClick = 0          " single click to activate/follow the tag
let Tlist_WinWidth = 40                " default taglist width

" Configure bufexplorer:
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSortBy='mru'          " Sort by most recently used.

" Configure miniBufExplorer (read minibufexplorer.vim in plugins dir)
let g:miniBufExplMapCTabSwitchBufs = 1 " set some mappings that make CTRL-TAB and CTRL-SHIFT-TAB switch through the buffers
let g:miniBufExplUseSingleClick = 1    " single clicking in the buf explorer opens the buffer
let g:miniBufExplModSelTarget = 1      " don't remember
let g:miniBufExplSplitBelow = 0         " Split is on the bottom.

" Configure NERDTree
let NERDTreeMouseMode = 1              " single clicking opens dir nodes, double click to open file
let NERDTreeShowBookmarks = 1          " show bookmarks by default
let NERDTreeShowHidden = 0             " show hidden files by default

" Configure Supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabCompletionContexts = ['s:ContextDiscover', 's:ContextText']
let g:SuperTabContextDiscoverDiscovery = ['&omnifunc:<c-x><c-o>', '&completefunc:<c-x><c-n>']
let g:SuperTabRetainCompletionDuration = 'insert'
let g:SuperTabMidWordCompletion = 0
let g:SuperTabLeadingSpaceCompletion = 0
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 0

" Configure AutoComplete
let g:acp_enableAtStartup = 0
let g:acp_mappingDriven = 0


" =============================================================================
" key mappings
" =============================================================================

" for LaTeX insertion of inline test math, dirty hack that will annoy me in C,
" i'm sure of it. Should go elsewhere.
" inoremap $ \(\)<++><Left><Left><Left><Left><Left><Left>

nnoremap == [{=]}

" Parenthesis/bracket expanding
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
" inoremap () ()
" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>
" inoremap {<CR> {<CR>}<Esc>O

" insert a char until col 80
inoremap <expr> <Leader><Right> InsertHLine('e')
inoremap <expr> <Leader><Up> InsertHLine('u')
inoremap <expr> <Leader><Down> InsertHLine('d')

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
nnoremap <Leader>g :vimgrep //j **/*.<left><left><left><left><left><left><left><Left>

" Now using smarttabcomplete plugin.
" tab is remapped to SmartTabComplete function from above
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" these are also part of the omnicompletion key bindings... I stole them from somewhere, so no further description.
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Space>    pumvisible() ? "\<C-y>" : "\<Space>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" if 0 puts the cursor at the beginning of the line, then it only makes sense that - puts the cursor at the end of the line...
noremap 0 ^
noremap - $
" little u undos, now make big U redo, rather than having to type ':redo'... ENTER... hooray for customization
nnoremap U :red<CR>

" Don't move the fucking cursor after pasting...
nnoremap p p`]
nnoremap P P`]

" Make cc replace lines from the default buffer
nnoremap <Leader>cc "_cc<C-R><C-O>"<Esc>
nnoremap <Leader>cw "_cw<C-R><C-O>"<Esc>

" gg usually goes to top of file, but leaves the column where it was. This makes it go to 0,0
nnoremap gg gg0

" <Leader> is by default the backslash character (\)
" when in command mode, you can hit \ followed by w (quickly) and the word under the cursor will magically appear in your command
" example: you want to formulate :s/alongfuckingword/cat/g, and 'alongfuckingword' is under your cursor...
" you start typing :s/, then hit \w and 'alongfuckingword' is inserted so now you have :s/alongfuckingword
" the rest you have to complete yourself.
cnoremap <Leader>ew <C-R><C-W>

" help on the word under the cursor
nnoremap <Leader>hw :h <C-R><C-W><CR>

" the following are mappings to call my makescript. I'm pretty sure there's a better, more integrated way to do this, but this works for me.
" call the makescript with the debug target
nnoremap <Leader>md :!make debug<CR>

" call the makescript with the clean target
nnoremap <Leader>mc :!make clean<CR>

" call the makescript with the release target
nnoremap <Leader>mr :!make release<CR>

" Common operations that are used frequently are mapped first to the function keys
" change transparency (yeah, it's not an accident that I chose the screen brightness Fn keys)
nnoremap <M-F1> :set transparency-=5<CR>
nnoremap <M-F2> :set transparency+=5<CR>

nnoremap <F1> ?<CR>
nnoremap <F2> /<CR>

nnoremap // /<C-R><C-W>

nnoremap <F3> gq$
nnoremap <F4> I<Tab><Esc>

" toggle through colorschemes using ScrollColor.vim plugin
nnoremap <M-F5> :PREVCOLOR<CR>
nnoremap <M-F6> :NEXTCOLOR<CR>

" replay the commands recorded in the q register (you'll have to practice more before you can put this to use, Josh ;-)
nnoremap <F5> @q

" repeat the last substitution command
nnoremap <F6> :s<CR>

" toggle on and off the displaying of 'non-visible' chars, tabs and spaces at the end of the line, defined above
nnoremap <F7> :set invlist<CR>

" toggle on and off the highlighting of the last search pattern.
nnoremap <F8> :set invhls<CR>

" toggle scrollbars on and off
nnoremap <F9> :call ToggleScrollbars()<CR>
nnoremap <M-F9> :call ToggleMenuBar()<CR>

" toggle fullscreen mode
nnoremap <F10> :set invfullscreen<CR>

" open yer mama (:h NERD_tree.txt) to the dir of the file in the active buf
nnoremap <F11> :NERDTreeToggle<CR>
nnoremap <C-F11> :NERDTree %:h<CR>
nnoremap <D-F11> :execute 'NERDTree '.getcwd()<CR>

" toggle on and off the TagList side menu
nnoremap <F12> :TlistToggle<CR>

" forcefully update the TagList
nnoremap <C-F12> :TlistUpdate<CR>

" THIS IS A LIFESAVER. Well at least it's helpful. CTRL+Up returns you to command mode with the last executed command for editing.
nnoremap <C-Up> :<Up>

" map CTRL-LEFT to cycle through the buffers in the order of the buffer list.
nnoremap <C-Left> :bp<CR>

" map CTRL-RIGHT to cycle through the buffers in the order of the buffer list.
nnoremap <C-Right> :bn<CR>

" OPTION-j scrolls the buffer down one line
noremap <D-j> <C-E>

" OPTION-k scrolls the buffer up one line
noremap <D-k> <C-Y>

" alternate file function jibby (:A is a script that finds and loads the header/include file of the current file and vice versa)
nnoremap <Leader>af :A<CR>

" enable autocomplete
nnoremap <Leader>ace :AcpEnable<CR>

" disable autocomplete
nnoremap <Leader>acd :AcpDisable<CR>

" the letter B is for buffers
" switch between the active and the alternate buffer
nnoremap <Leader>ba :e#<CR>

" map the sequence \ followed quickly by 'b' to show a list of open buffers, then sit there waiting for an input of which buffer you want to switch to
nnoremap <Leader>bl :buffers<CR>:b

" nicely close the current buffer using the bufkill script which will then also nicely open the next available buffer in the closed buffers' place.
" the alternative (:bd) isn't so pretty, it closes the buffer and doesn't manage the window/split/viewport properly.
nnoremap <Leader>bd :BD<CR>

" setup diffsplit for vertical diff, then drag the file you want to diff with onto vim and hit enter.
nnoremap <Leader>cf :vert diffsplit 

" when you already have a vertical split (and only one), then this will start diffing them
nnoremap <Leader>cs <C-w><Left>:diffthis<CR><C-w><Right>:diffthis<CR>

" switch off diff mode for all buffers in the current window where diff is set.
nnoremap <Leader>cx :diffoff!<CR>

" update (again) differences when in split diff mode
nnoremap <Leader>ca :diffupdate<CR>

" change directory to that of the current file.
nnoremap <Leader>cd :cd %:h<CR>

" the letter D is for delete the shit.
" the shit is extra spaces at the end of any line in the open buffer.
nnoremap <Leader>dw :%s/\ \{1,\}$//g<CR>

" if the opened file contains tabs, this replaces them all with spaces in the same place...
nnoremap <Leader>dt :retab<CR>

" easier mappings for miniBufExplorer
nnoremap <Leader>et :TMiniBufExplorer<CR>
nnoremap <Leader>eu :UMiniBufExplorer<CR>

" search path (vim path defined above) for the word under the cursor, and show the results in the quickfix window
nnoremap <Leader>f :execute "vimgrep /" . expand("<cword>") . "/j **/*\.[ch]" <Bar> cw<CR>
nnoremap <Leader>fs :execute "vimgrep /" . expand("<cword>") . "/j **/*\.c" <Bar> cw<CR>
nnoremap <Leader>fh :execute "vimgrep /" . expand("<cword>") . "/j **/*\.h" <Bar> cw<CR>

" insert things while in insert mode
inoremap <Leader>if <C-R>=expand("%:t")<CR>
inoremap <Leader>ds <C-R>=strftime("%d%m%y")<CR>
inoremap <Leader>dl <C-R>=strftime("%d.%m.%Y")<CR>

nnoremap <Leader>ds "_ce<C-R>=strftime("%d%m%y")<CR><Esc>
nnoremap <Leader>dl "_c5e<C-R>=strftime("%d.%m.%Y")<CR><Esc>

" the letter R is for repeat
" repeat the last substitution command
nnoremap <Leader>rs :s<CR>

" the letter T is for tag
" source the tags vim script which was built by the tag awk script and ctags and contains all the special words (variables, methods, typedefs) for pretty highlighting...
nnoremap <Leader>th :so tags.vim<CR>

" call the tags script to generate the tags file and the tags vim script and when done, source the tags vim script.
if has('mac')
    nnoremap <Leader>tg :!~/.vim/tags/tags.sh $PWD 09_SOFTWARE_UNITS<CR>:so tags.vim<CR>
else
    nnoremap <Leader>tg :exec "!" . $HOME . "/vimfiles/tags/tags.bat . 09_SOFTWARE_UNITS"<CR>:so tags.vim<CR>
endif

" if the word under the cursor is special (a tag), follow it to its definition
nnoremap <Leader>tt g<C-]>

" b is for back
" Return through the tag stack back to where you came from
" after following a tag somewhere with <Leader>t, you can come back to where you came from with <Leader>y
nnoremap <Leader>tb <C-t>

" the letter S is for save
" write the current buffer back to file
nnoremap <Leader>sf :w<CR>

" write the current buffer in unix format
nnoremap <Leader>su :w ++ff=unix<CR>

" write the current buffer in dos format
nnoremap <Leader>sd :w ++ff=dos<CR>

" the letter W is for window
" create a vertical split of the current buffer
nnoremap <Leader>wv <C-w>v

" split the current window with a horizontal split.
nnoremap <Leader>wh <C-w>s

" close the current window, doesn't close the file if hidden is set (it is)
nnoremap <Leader>wc <C-w>c

" close the current window, doesn't close the file if hidden is set (it is)
nnoremap <Leader>wq :q<CR>

" toggle line wrap with virtual editing garbage
nnoremap <silent> <Leader>wr :call ToggleWrap()<CR>

" map for the hole register
nnoremap <Leader>- "_
inoremap <Leader>' <C-R><C-O>"

" Move a line of text up or down
nnoremap <M-k> mz:m-2<CR>`z
nnoremap <M-j> mz:m+<CR>`z

" Go up to the window above (vertical split)
nnoremap <Leader><Up> <C-w><Up>
nnoremap <Space><Up> <C-w><Up>
nnoremap <Leader>k <C-w><Up>
nnoremap <Space>k <C-w><Up>

" Go one window/viewport down (vert splits)
nnoremap <Leader><Down> <C-w><Down>
nnoremap <Space><Down> <C-w><Down>
nnoremap <Leader>j <C-w><Down>
nnoremap <Space>j <C-w><Down>

" Go one window left
nnoremap <Leader><Left> <C-w><Left>
nnoremap <Space><Left> <C-w><Left>

" Go one window right
nnoremap <Leader><Right> <C-w><Right>
nnoremap <Space><Right> <C-w><Right>

nnoremap <Leader>hg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <C-Down> <C-^>
