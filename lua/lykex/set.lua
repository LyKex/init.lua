-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.rnu = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Let nvim decide which clipboard to use, see :h clipboard.
-- If $TMUX is set, it will use TMUX clipboard.
-- vim.o.clipboard = 'xlcip'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 300
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- remove banner in netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.wo.wrap = false

vim.opt.swapfile = false

-- auto reload file when changed
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained", "FileChangedShell" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
vim.api.nvim_create_autocmd({"FileChangedShellPost"}, {
  command = "echohl WarningMsg| echo 'buffer reloaded' | echohl None",
  pattern = { "*" },
})


-- global util functions
function basename(str)
  return str:match("(.*[/\\])")
end

-- terminal
function open_terminal_curr_dir()
  local dir = basename(vim.api.nvim_buf_get_name(0))
  vim.cmd("terminal")
  vim.cmd("startinsert")
  vim.fn.chansend(vim.b.terminal_job_id, "cd " .. dir .. "\n")
end

local on_exit = function(obj)
  print(obj.code)
  print(obj.signal)
  print(obj.stdout)
  print(obj.stderr)
end

vim.api.nvim_create_user_command('Job', function(input)
  local cmd=vim.system({"sbatch", "job.sh"}, {cwd=basename(vim.api.nvim_buf_get_name(0)), text=true}, on_exit)
end, { nargs = 0 })


vim.g.clipboard = {
  name = 'myClipboard',
  copy = {
    ["+"] = {'tmux', 'load-buffer', '-'},
    ["*"] = {'tmux', 'load-buffer', '-'},
  },
  paste = {
    ["+"] = {'tmux', 'save-buffer', '-'},
    ["*"] = {'tmux', 'save-buffer', '-'},
  },
  cache_enabled = true,
}
