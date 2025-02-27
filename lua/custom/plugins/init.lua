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
      local function run_bash(command)
        -- Use io.popen to execute the command and capture the output
        local handle = io.popen(command)
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

      local function get_absolute_path(program)
        return run_bash('which ' .. program)
      end

      local function get_nix_store(program)
        return run_bash("find /nix/store -maxdepth 1 -type d -name '*" .. program .. "*'")
      end

      local function get_plugin(plugin)
        return run_bash('find ' .. get_nix_store '-jdt-language-server-' .. "/share/java/jdtls/plugins/ -maxdepth 1 -type f -name '" .. plugin .. "*.jar'")
      end

      local config = {
        cmd = {
          get_absolute_path 'jdtls',
          '--jvm-arg=-javaagent:' .. get_nix_store '-lombok-' .. '/share/java/lombok.jar',

          -- get_absolute_path 'java',
          -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          -- '-Dosgi.bundles.defaultStartLevel=4',
          -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
          -- '-Dlog.protocol=true',
          -- '-Dlog.level=ALL',
          -- '-Xmx1g',
          -- '--add-modules=ALL-SYSTEM',
          -- '--add-opens',
          -- 'java.base/java.util=ALL-UNNAMED',
          -- '--add-opens',
          -- 'java.base/java.lang=ALL-UNNAMED',
          -- '-jar',
          -- get_plugin 'org.eclipse.equinox.launcher_',
          -- '-configuration',
          -- get_nix_store '-jdt-language-server-' .. '/share/java/jdtls/config_linux',
        },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
      }

      require('jdtls').start_or_attach(config)
    end,
  },
}
