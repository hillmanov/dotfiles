local function get_day()
  -- Get the name of the current directory
  local day_dir = vim.fn.fnamemodify(vim.fn.expand('%:p:h'), ':t')
  -- Extract and return the number from the day_dir string
  local day_number = day_dir:match('%d+')
  return day_number
end

local function run_day(part)
  local day = get_day()
  -- If runner.ts is not in the current dir, go up one level before running it
  local cmd = "bun run runner.ts --day " .. day
  if vim.fn.filereadable("runner.ts") == 0 then
    cmd = "cd .. && " .. cmd
  end
  if part then
    cmd = cmd .. " " .. part
  end
  vim.cmd("FloatermNew --title=Advent\\ of\\ Code:\\ Day\\ " .. day .. " --titleposition=center --autoclose=0 " .. cmd)
end

-- Keymaps
vim.keymap.set("n", "<leader>d1", function() run_day("--part 1") end, { silent = true })
vim.keymap.set("n", "<leader>d2", function() run_day("--part 2") end, { silent = true })
vim.keymap.set("n", "<leader>da", function() run_day() end, { silent = true })
