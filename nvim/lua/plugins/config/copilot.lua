require('copilot').setup({
  copilot_node_command = os.getenv "HOME" .. '/.local/share/fnm/node-versions/v16.17.1/installation/bin/node', -- Node version must be < 18
})
