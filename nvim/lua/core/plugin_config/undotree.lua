vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
-- init.lua

-- Check if the `persistent_undo` feature is supported
if vim.fn.has('persistent_undo') == 1 then
  -- Set the `undodir` to the specified directory
  vim.cmd([[set undodir=$HOME/.config/nvim/.undodir]])

  -- Enable the `undofile` option
  vim.cmd([[set undofile]])
end

