-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  { 'stevearc/oil.nvim', opts = {} },
  { 'andrewferrier/debugprint.nvim', opts = {} },
  'sindrets/diffview.nvim',
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    config = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'general'
    end,
  },
  {
    'danymat/neogen',
    config = true,
    version = '*',
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
}
