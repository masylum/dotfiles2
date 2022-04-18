vim.cmd("hi def CopilotSuggestion guifg=#F5C2E7 ctermfg=244")
vim.cmd("imap <silent><script><expr> <C-J> copilot#Accept('<CR>')")
vim.cmd("let g:copilot_no_tab_map = v:true")
