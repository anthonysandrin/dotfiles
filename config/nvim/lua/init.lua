nvim_lsp = require 'nvim_lsp'

return { init = function () 

-- Language Server Protocol {{{
-- Use bash-language-server for bash
nvim_lsp.bashls.setup {}
-- Use CCLS for c/c++/objective-c
--nvim_lsp.ccls.setup {}
nvim_lsp.clangd.setup {}
-- Use ocamllsp for ocaml
nvim_lsp.ocamllsp.setup {}
-- Use python-language-server for python
nvim_lsp.pyls.setup {}
-- }}}

end }
-- vim: foldmethod=marker
