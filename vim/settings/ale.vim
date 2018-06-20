let g:ale_linters = {
  \ 'python': ['pylint'] ,
  \ }

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 0
let g:ale_open_list = 1
let g:ale_list_window_size = 7
let g:ale_python_pylint_options = '--load-plugins pylint_django'
