local M = {}
local lspconfig = require("lspconfig")
local util = require('lspconfig/util')
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry --directory ' .. workspace .. ' env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

M.setup = function(on_attach, capabilities)
  lspconfig.pyright.setup({
    before_init = function(_, config)
      config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
