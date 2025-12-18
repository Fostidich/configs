return {
    "saghen/blink.cmp",
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
