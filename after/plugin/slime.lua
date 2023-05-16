-- vim-slime set up for julia
vim.g.slime_target = "tmux"
vim.g.slime_default_config = {
  socket_name = "default",
  target_pane= "{right}"
  -- target_pane=function ()
  --  vim.cmd.trim(vim.cmd.system('tmux display -pt "{last}" "#{pane_id}"'))
  -- end
  }

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
