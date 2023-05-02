-- Hook LSP into completion
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
  .protocol
  .make_client_capabilities())


-- Setup python language server pyls
require'lspconfig'.pylsp.setup {
  cmd = {"pylsp"},
  filetypes = {"python"},
  settings = {
    pylsp = {
      configurationSources = {"flake8"},
      plugins = {
        jedi_completion = {enabled = true},
        jedi_hover = {enabled = true},
        jedi_references = {enabled = true},
        jedi_signature_help = {enabled = true},
        jedi_symbols = {enabled = true, all_scopes = true},
        pycodestyle = {enabled = false},
        flake8 = {
          enabled = true,
          ignore = {},
          maxLineLength = 100
        },
        mypy = {enabled = false},
        isort = {enabled = false},
        yapf = {enabled = false},
        pylint = {enabled = false},
        pydocstyle = {enabled = false},
        mccabe = {enabled = false},
        preload = {enabled = false},
        rope_completion = {enabled = false}
      }
    }
  },
  on_attach = on_attach
}

require'lspconfig'.clangd.setup{
    cmd = {"clangd"},
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
--    root_dir = {
 --       root_pattern(
 --         '.clangd',
  --        '.clang-tidy',
   --       '.clang-format',
    --      'compile_commands.json',
     --     'compile_flags.txt',
      --    'configure.ac',
       --   '.git'
        --)
  --  },
    single_file_support = true
}

-- Setup go language server gopls
-- https://sterba.dev/posts/neovim-lsp/
require'lspconfig'.gopls.setup {
    capabilities = capabilities,
    completeUnimported = true,
    analyses = {unusedparams = true},
    staticcheck = true,
    on_attach = function()
        -- "n" means normal mode
        -- {buffer=0} means only for this buffer
        -- <cmd> == :
        -- <cr> == enter

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
        vim.keymap.set("n", "gR", vim.lsp.buf.references, {buffer = 0})
        vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer = 0})
        vim.keymap.set("n", "gf", vim.lsp.buf.formatting, {buffer = 0})
        vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {buffer = 0})
        vim.keymap.set("n", "en", vim.diagnostic.goto_next, {buffer = 0})
        vim.keymap.set("n", "ep", vim.diagnostic.goto_prev, {buffer = 0})
    end
}

-- LSP autocomplete
vim.opt.completeopt = {"menu", "menuone", "noselect"} -- setting vim values

-- Setup nvim-cmp
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'orgmode'},
		{name = 'luasnip'} -- For luasnip users.
    }, {{name = 'buffer'}})
})

-- Enable inline errors
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
      {update_in_insert = true})

require('orgmode').setup_ts_grammar()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "dockerfile", "go", "python", "bash", "json", "cpp", "proto", "make", "org", "java", "meson", "html", "yaml", "markdown", "perl", "git_rebase", "gitcommit", "cmake"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/my-orgs/refile.org',
})
