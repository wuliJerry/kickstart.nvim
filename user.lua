-- user.lua
local M = {}

function M.setup_neovide()
  if vim.g.neovide then
    vim.opt.guifont = { 'Maple Mono NF', ':h17' }
    vim.g.neovide_scale_factor = 1.0

    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_transparency = 0.9
    vim.g.transparency = 0.8

    vim.g.neovide_cursor_animation_length = 0
    vim.api.nvim_set_keymap('v', '<sc-c>', '"+y', { noremap = true })
    vim.api.nvim_set_keymap('n', '<sc-v>', 'l"+P', { noremap = true })
    vim.api.nvim_set_keymap('v', '<sc-v>', '"+P', { noremap = true })
    vim.api.nvim_set_keymap('c', '<sc-v>', '<C-o>l<C-o>"+<C-o>P<C-o>l', { noremap = true })
    vim.api.nvim_set_keymap('i', '<sc-v>', '<ESC>l"+Pli', { noremap = true })
    vim.api.nvim_set_keymap('t', '<sc-v>', '<C-\\><C-n>"+Pi', { noremap = true })
  end
end

function M.setup_editor()
  vim.o.laststatus = 3
  vim.opt['tabstop'] = 4
  vim.opt['shiftwidth'] = 4
  vim.api.nvim_set_keymap('n', '<C-j>', '4j', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-k>', '4k', { noremap = true })
end

function M.setup()
  vim.cmd [[
  augroup RestoreCursorShapeOnExit
      autocmd!
      autocmd VimLeave * set guicursor=a:ver20
  augroup END
  ]]

  M.setup_neovide()
  M.setup_editor()
end

return M
