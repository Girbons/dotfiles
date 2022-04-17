local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = { 
    -- go
  b.diagnostics.golangci_lint,
  b.diagnostics.staticcheck,
  b.formatting.gofmt,
  b.formatting.goimports,

    -- python
  b.diagnostics.flake8,
  b.diagnostics.pylint,
  b.diagnostics.pyproject_flake8,
  b.formatting.black,
  b.formatting.isort,

  -- markdown
  b.diagnostics.markdownlint,

    -- rust
  b.formatting.rustfmt,

  -- dart
  b.formatting.dart_format,

  -- json
  b.formatting.fixjson,

  -- sql
  b.diagnostics.sqlfluff,
  b.formatting.sqlformat,

  -- webdev stuff
  b.formatting.prettier,
  b.formatting.deno_fmt,
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- Spell
  b.formatting.codespell,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then            
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"         
        end 
    end,
  }
end

return M
