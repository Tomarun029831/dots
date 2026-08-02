require('mini.files').setup()
local function fit_to_top_right()
  local wins = {}
  for _, win_id in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win_id) then
      local buf = vim.api.nvim_win_get_buf(win_id)
      if vim.bo[buf].filetype == 'minifiles' then
        table.insert(wins, win_id)
      end
    end
  end

  if #wins == 0 then return end

  local max_right = 0
  local configs = {}
  for _, win_id in ipairs(wins) do
    local config = vim.api.nvim_win_get_config(win_id)
    configs[win_id] = config
    local border_width = config.border and 2 or 0 -- config.border == nil ? 0 : 2
    local right_edge = config.col + config.width + border_width
    if right_edge > max_right then
      max_right = right_edge
    end
  end

  local offset = (vim.o.columns - 1) - max_right
  for win_id, config in pairs(configs) do
    vim.api.nvim_win_set_config(win_id, {
      relative = 'editor',
      row = 1,
      col = config.col + offset,
    })
  end
end

vim.api.nvim_create_autocmd('User', {
  pattern = { 'MiniFilesWindowOpen', 'MiniFilesWindowUpdate' },
  callback = fit_to_top_right,
})

