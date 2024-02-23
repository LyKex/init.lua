-- vim-slime set up for julia
vim.g.slime_target = "tmux"
vim.g.slime_default_config = {
  -- socket_name = "default",
  socket_name = vim.api.nvim_eval('get(split($TMUX, ","), 0)'),
  target_pane= "{top-right}"
  -- target_pane=function ()
  --  vim.cmd.trim(vim.cmd.system('tmux display -pt "{last}" "#{pane_id}"'))
  -- end
  }
vim.g.slime_dont_ask_default = 1
vim.g.slime_bracketed_paste = 1


vim.keymap.set('n', "<c-cr>", "<Plug>SlimeParagraphSend }je0")
vim.keymap.set('n', "<s-cr>", "<Plug>SlimeLineSend je0")
-- vim.keymap.set('n', "<leader>jv", function ()
--   io.popen('tmux split-window -v')
--   vim.cmd.SlimeSend1 'julia'
-- end,
--   {desc = "start Julia REPL vertically"})
--
--
-- vim.keymap.set('n', "<leader>jh", function ()
--   io.popen('tmux split-window -h')
--   vim.cmd.SlimeSend1 'julia'
-- end,
--   {desc = "start Julia REPL horizontally"})
--
