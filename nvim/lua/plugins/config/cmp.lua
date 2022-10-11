local ok, cmp = pcall(require, "cmp")
if not ok then
  return
end

local cmp_ultisnips_mappings = require "cmp_nvim_ultisnips.mappings"

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
  Copilot = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  style = {
    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      if entry.source.name == "copilot" then
        vim_item.dup = 0
        vim_item.kind = "Copilot"
      end
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        copilot = "[Copilot]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVIM_LUA]",
        ultisnips = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  window = {
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = "║",
      autocomplete = {
        require("cmp.types").cmp.TriggerEvent.InsertEnter,
        require("cmp.types").cmp.TriggerEvent.TextChanged,
      },
      keyword_length = 0,
    },
  },
  mapping = {
    ["<down>"] = cmp.mapping.select_next_item(),
    ["<up>"] = cmp.mapping.select_prev_item(),
    ["<tab>"] = cmp.mapping.confirm { select = true },
    ["<cr>"] = cmp.mapping.confirm { select = true },
    ["<c-space>"] = cmp.mapping.complete(),
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" },
    { name = "ultisnips" },
  },
  sorting = {
    comparators = {
      cmp.config.compare.recently_used,
      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  preselect = cmp.PreselectMode.Item,
}

--set max height of items
vim.cmd [[ set pumheight=20 ]]
--set highlights
local highlights = {
  CmpItemKindText = { fg = "LightGrey" },
  CmpItemKindFunction = { fg = "#C586C0" },
  CmpItemKindClass = { fg = "Orange" },
  CmpItemKindKeyword = { fg = "#f90c71" },
  CmpItemKindSnippet = { fg = "#565c64" },
  CmpItemKindConstructor = { fg = "#ae43f0" },
  CmpItemKindVariable = { fg = "#9CDCFE", bg = "NONE" },
  CmpItemKindInterface = { fg = "#f90c71", bg = "NONE" },
  CmpItemKindFolder = { fg = "#2986cc" },
  CmpItemKindReference = { fg = "#922b21" },
  CmpItemKindMethod = { fg = "#C586C0" },
  CmpItemMenu = { fg = "#C586C0", bg = "#C586C0" },
  CmpItemAbbr = { fg = "#565c64", bg = "NONE" },
  CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
  CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
}
vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = "#565c64" })
for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end

-- Copilot
require("copilot_cmp").setup {
  method = "getCompletionsCycling",
}

-- Go setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Setup lspconfig.
local nvim_lsp = require('lspconfig')

-- setup languages 
-- GoLang
nvim_lsp['gopls'].setup{
  cmd = {'gopls'},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}



