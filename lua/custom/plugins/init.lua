-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  'sindrets/diffview.nvim',
  { 'stevearc/oil.nvim', opts = {} },
  { 'andrewferrier/debugprint.nvim', opts = {} },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    config = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'general'
    end,
  },
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    opts = {
      dependencies_bin = { tinymist = 'tinymist', websocat = 'websocat' },
      extra_args = { '--partial-rendering=true' },
    },
  },
}
