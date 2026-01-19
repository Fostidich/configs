local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Error: failed to clone lazy.nvim repo", "ErrorMsg" }
        }, true, {})
    end
end

require("lazy").setup({
    spec = { { import = "plugins" } }
})
