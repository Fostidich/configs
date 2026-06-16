return {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.lib" },
    build = function() require('blink.cmp').build():wait(60000) end,
    opts = {
        keymap = {
            ["<C-x>"] = { function(cmp) cmp.show() end },
        },
        completion = {
            menu = {
                winblend = 0,
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
            },
            documentation = {
                window = {
                    winblend = 0,
                    winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                },
            },
            ghost_text = {
                enabled = true
            },
        }
    }
}
