vim.cmd('set synmaxcol=200') -- Limits the syntax highlighting
vim.wo.wrap = false -- Display long lines as just one line
-- vim.o.showmatch = true -- Show matching brackets

vim.cmd('set wildmode=list:longest,list:full') -- Show menu with possible tab competions
vim.cmd('set wildignore+=.git,.svn')
vim.cmd('set wildignore+=*.o,*.obj,*.jpg,*.png,*.gif,*.log,*.gz,*.bin,*.gem,*.rbc,*.class')
vim.cmd('set wildignore+=*.min.js,**/node_modules/**,**/images/**')
vim.cmd('set wildignore+=**/assets/**/original/**,**/assets/**/thumb/**,**/assets/**/small/**')
vim.cmd('set wildignore+=tmp,public,vendor/bundle/*,vendor/cache/*,test/fixtures/*,vendor/gems/*,spec/cov,a/*')
vim.cmd('set wildignore+=sorbet/*')

vim.cmd('set ts=2') -- Insert 2 spaces for a tab
vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.wo.number = true -- set numbered lines
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.title = true

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.updatetime = 300 -- Faster completion
vim.cmd('set inccommand=nosplit') -- Make substitution work in realtime
vim.o.guifont = "JetBrains Mono Nerd Font Complete:h14"

vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
-- vim.o.cmdheight = 2 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.hls = true -- highlight search
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
