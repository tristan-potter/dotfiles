" GitHub Copilot uses OpenAI Codex to suggest code and entire functions in
" real-time right from your editor. Trained on billions of lines of public
" code, GitHub Copilot turns natural language prompts including comments and
" method names into coding suggestions across dozens of languages.
"
" Copilot requires a subscription.
"
" Setup with:
" - :Copilot setup
"
" https://github.com/github/copilot.vim

Plug 'github/copilot.vim', { 'do': ':Copilot setup' }

function! s:ConfigCopilot()
  let g:copilot_filetypes = {'markdown': v:true}
endfunction

augroup CopilotConfiguration
  autocmd!
  autocmd User PlugLoaded ++nested call s:ConfigCopilot()
augroup end
