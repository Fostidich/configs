vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

_G.config = {}

config.startup_eob = vim.opt.fillchars:get().eob

config.frame_enabled = true
config.frame_callbacks = {}
config.register_frame_callback = function(cb)
    table.insert(config.frame_callbacks, cb)
end
config.execute_frame_callbacks = function()
    for _, cb in ipairs(config.frame_callbacks) do cb() end
end
