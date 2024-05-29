return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 1
      local wk = require("which-key")
      wk.register({
        m = {
          name = " Markdown", -- optional group name
          p = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle markdown preview" }, -- create a binding with label
          s = { "<cmd>MarkdownPreviewStart<CR>", "Start markdown preview" }, -- create a binding with label
          d = { "<cmd>MarkdownPreviewStop<CR>", "Stop markdown preview" }, -- create a binding with label
        },
      }, { prefix = "<leader>" })
    end
  },
  {
    "cappyzawa/trim.nvim",
    opts = {
       trim_on_write = true,
       trim_trailing = true,
       trim_last_line = false,
       trim_first_line = false,
       highlight = false,
    }
  },
}





