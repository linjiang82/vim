-- hrsh7th/nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.setup({
  automatic_installation = true,
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- completion = {
  --   completeopt = "menu, menuone, noinsert"
  -- },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "npm" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },
  formatting = {
    format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
  },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup({
  -- cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

local servers = lsp_installer.get_installed_servers()
for _, lsp in ipairs(servers) do
  --Enable (broadcasting) snippet capability for completion
  lspconfig[lsp.name].setup({
    capabilities = capabilities,
    on_attach = function(client)
      client.server_capabilities.document_formatting = true
    end,
  })
end
