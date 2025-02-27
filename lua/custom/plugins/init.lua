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
    config = function()
      -- Function to get the absolute path of a program
      local function get_absolute_path(program)
        -- Use io.popen to execute the 'which' command and capture the output
        local handle = io.popen('which ' .. program)
        if handle then
          -- Read the output
          local result = handle:read '*a'
          -- Close the handle
          handle:close()
          -- Remove any trailing newlines or whitespace
          result = result:match '^%s*(.-)%s*$'
          return result
        else
          return nil
        end
      end

      local config = {
        cmd = { get_absolute_path 'jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
      }
      require('jdtls').start_or_attach(config)
    end,
  },
}
