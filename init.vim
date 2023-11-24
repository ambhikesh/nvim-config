set nocompatible            " disable compatibility to old-time vi
set noshowmode
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
"set termguicolors
let g:coc_logfile = expand('~/.config/nvim/coc.log')

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

 Plug 'scrooloose/nerdtree'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'https://github.com/preservim/tagbar'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'https://github.com/danilo-augusto/vim-afterglow'
 Plug 'https://github.com/vim-scripts/DrawIt'
 Plug 'https://github.com/jiangmiao/auto-pairs'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'mhinz/vim-startify'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'morhetz/gruvbox'
 call plug#end()


let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-cmake',
      \ 'coc-clangd'
      \]
:colorscheme gruvbox

set t_Co=256
nmap <F1> :NERDTreeToggle <CR>
nnoremap <C-s> :wq <CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <C-p> :term <CR>
nnoremap <C-w> :qa! <CR>
nnoremap <C-q> :q <CR>
nnoremap <C-k> :tabl <CR>
nnoremap <C-l> :tabr <CR>
nmap <F9> :Telescope <CR>


inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


autocmd ColorScheme * highlight Pmenu guibg=#RRGGBB gui=bold
autocmd ColorScheme * highlight PmenuSel guibg=#RRGGBB gui=bold
autocmd ColorScheme * highlight PmenuSbar guibg=#RRGGBB
autocmd ColorScheme * highlight PmenuThumb guibg=#RRGGBB

autocmd ColorScheme * highlight CocPopupBorder guifg=#RRGGBB guibg=NONE gui=nocombine
autocmd ColorScheme * highlight link CocPopupBorder Pmenu



lua << END

function GetCurrentTime()
  return os.date('%H:%M')  
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff'},
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { GetCurrentTime },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
END
