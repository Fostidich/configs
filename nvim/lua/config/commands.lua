vim.cmd.cnoreabbrev('hs', 'split')
vim.cmd.cnoreabbrev('vs', 'vsplit')

vim.api.nvim_create_user_command("ToggleQuickfix", ToggleQuickfix, {})
vim.api.nvim_create_user_command("SoloBuf", SoloBuf, {})
vim.api.nvim_create_user_command("ToggleWrap", ToggleWrap, {})
vim.api.nvim_create_user_command("ClearReg", ClearReg, {})
vim.api.nvim_create_user_command("ToggleFrame", ToggleFrame, {})
