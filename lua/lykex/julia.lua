

-- create a new pane and excute julia
local function julia_vertical()
  local dir = basename(vim.api.nvim_buf_get_name(0))
  vim.cmd('silent !tmux split-window -h -c "' .. dir .. '"')
end



vim.keymap.set("n", "<leader>jv", julia_vertical, { noremap = true, silent = true })
