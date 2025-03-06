-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
  },
  {
    'mistweaverco/kulala.nvim',
    keys = {
      { '<leader>Rs', desc = 'Send request' },
      { '<leader>Ra', desc = 'Send all requests' },
      { '<leader>Rb', desc = 'Open scratchpad' },
    },
    ft = { 'http', 'rest' },
    opts = {
      -- your configuration comes here
      global_keymaps = true,
    },
  },
}
