-- proper colors
vim.opt.termguicolors = true

-- more opinionated
vim.opt.number = true -- show linenumbers
vim.opt.relativenumber = true

vim.opt.mouse = "a" -- enable mouse
vim.opt.mousefocus = true
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

vim.opt.timeoutlen = 400 -- until which-key pops up
vim.opt.updatetime = 250 -- for autocommands and hovers

-- don't ask about existing swap files
vim.opt.shortmess:append("A")

-- no vim backups
vim.opt.swapfile = false
vim.opt.backup = false

-- use spaces as tabs
local tabsize = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize

-- left move at beginning of line moves to end
-- of previous line; right move at end of line
-- moves to beginning of next line
vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}

-- space as leader, backslash as local leader for R
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- smarter search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true

-- consistent number column
vim.opt.signcolumn = "yes:1"

-- scrolling without going all the way up or down
vim.opt.scrolloff = 5

-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")
--
vim.opt.updatetime = 50

-- how to show autocomplete menu
vim.opt.completeopt = "menuone,noinsert"

-- add folds with treesitter grammar
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- but open all by default
vim.opt.foldlevel = 99

-- global statusline
vim.opt.laststatus = 2

vim.cmd([[
let g:currentmode={
       \ 'n'  : '%#String# NORMAL ',
       \ 'v'  : '%#Search# VISUAL ',
       \ "\<C-V>" : '%#Title# V·Block ',
       \ 'V'  : '%#IncSearch# V·Line ',
       \ 'Rv' : '%#String# V·Replace ',
       \ 'i'  : '%#ModeMsg# INSERT ',
       \ 'R'  : '%#Substitute# R ',
       \ 'c'  : '%#CurSearch# Command ',
       \ 't'  : '%#ModeMsg# TERM ',
       \}
]])
vim.opt.statusline = "%{%g:currentmode[mode()]%} %* %t | %y | %* %= c:%c l:%l/%L %p%% 🦦 "

-- split right and below by default
vim.opt.splitright = true
vim.opt.splitbelow = true

--tabline
vim.opt.showtabline = 1

--windowline -- disable to stop showing the file name at the top of the buffer
-- vim.opt.winbar = "%f"

--don't continue comments automagically
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- hide cmdline when not used
vim.opt.cmdheight = 0

-- (don't == 0) replace certain elements with prettier ones
vim.opt.conceallevel = 0

------------ for R ----------------------------------------------------------

vim.cmd([[
" options for radian
  let R_app = "radian"          " use radian instead of the bland R terminal
  let R_cmd = "R"
  let R_hl_term = 0
  let R_args = []               " if you had set any
  let R_bracketed_paste = 1

" options for Nvim-R
  let R_assign = 0              " remove _ shortcut for <-

" general options
  " always enter in insert mode in the terminal
  " autocmd BufWinEnter,WinEnter term://* startinsert
]])

-- Automatically set filetype for R scripts based on shebang
vim.api.nvim_exec([[
  augroup DetectRShebang
    autocmd!
    autocmd BufRead,BufNewFile *.R if getline(1) =~ '^#!/usr/bin/env Rscript%s.*\n' | setfiletype r | endif
  augroup END
]], false)

-- Automatically set bash filetype based on shebang
vim.api.nvim_exec([[
  augroup DetectShebang
    autocmd!
    autocmd BufRead,BufNewFile * if getline(1) =~ '^#!.*/bin/env%s.*\n' | setfiletype sh | endif
  augroup END
]], false)
