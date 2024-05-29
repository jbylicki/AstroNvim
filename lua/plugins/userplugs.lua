local telescope, builtin = require('telescope'), require('telescope.builtin')
function fuzzyFindFiles()
  builtin.grep_string({
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
  })
end

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
      wk.add({
        { "<leader>fq", "<cmd>lua fuzzyFindFiles{}<cr>", desc = "Fuzzy search files" },
        { "<leader>m", group = " Markdown" },
        { "<leader>md", "<cmd>MarkdownPreviewStop<CR>", desc = "Stop markdown preview" },
        { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview" },
        { "<leader>ms", "<cmd>MarkdownPreviewStart<CR>", desc = "Start markdown preview" },
      })
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
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
}

