local M = {}

-- overriding default plugin configs!
M.treesitter = {
   ensure_installed = {
      "bash",
      "c",
      "css",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "toml",
      "vim",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

return M
