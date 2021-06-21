command! LspCodeAction lua require 'utils'.code_action()
command! LspDeclaration lua require 'utils'.declaration()
command! LspDefinition lua require 'utils'.definition()
command! LspDocumentSymbol lua require 'utils'.document_symbol()
command! LspFormatting lua require 'utils'.formatting()
command! LspFormattingSync lua require 'utils'.formatting_sync()
command! LspHover lua require 'utils'.hover()
command! LspImplementation lua require 'utils'.implementation()
command! LspRangeCodeAction lua require 'utils'.range_code_action()
command! LspRangeFormatting lua require 'utils'.range_formatting()
command! LspReferences lua require 'utils'.references()
command! LspRename lua require 'utils'.rename()
command! LspTypeDefinition lua require 'utils'.type_definition()
command! LspWorkspaceSymbol lua require 'utils'.workspace_symbol()
command! LspGotoNext lua require 'utils'.goto_next()
command! LspGotoPrev lua require 'utils'.goto_prev()
command! LspShowLineDiagnostics lua require 'utils'.show_line_diagnostics()
command! NextHunk lua require 'utils'.next_hunk()
command! PrevHunk lua require 'utils'.prev_hunk()
command! StageHunk lua require 'utils'.stage_hunk()
command! UndoStageHunk lua require 'utils'.undo_stage_hunk()
command! ResetHunk lua require 'utils'.reset_hunk()
command! ResetBuffer lua require 'utils'.reset_buffer()
command! PreviewHunk lua require 'utils'.preview_hunk()
command! BlameLine lua require 'utils'.blame_line()
command! W noa w

function! QuickFixToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
