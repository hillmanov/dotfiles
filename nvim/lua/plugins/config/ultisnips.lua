local g = vim.g

g.UltiSnipsSnippetDirectories = { os.getenv "HOME" .. "/.config/nvim/UltiSnips" }
g.UltiSnipsExpandTrigger = ';;'
g.UltiSnipsJumpForwardTrigger = ';;'
g.UltiSnipsJumpBackwardTrigger = '::'

