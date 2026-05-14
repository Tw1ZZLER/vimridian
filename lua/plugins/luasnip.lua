-- Thank you Vimjoyer for this config
-- https://github.com/vimjoyer/nixconf/blob/main/wrappedPrograms/neovim/lua/plugins/luasnip.lua
-- and Lazyvim
-- https://www.lazyvim.org/extras/coding/luasnip

return {
    "luasnip",
    event = "InsertEnter",
    before = function() LZN.trigger_load "friendly-snippets" end,
    after = function()
        local luasnip = require "luasnip"
        luasnip.filetype_extend("javascript", { "javascriptreact" })

        local snippet_paths = vim.api.nvim_get_runtime_file("lua/luasnippets", true)
        require("luasnip.loaders.from_lua").load {
            paths = snippet_paths,
        }

        luasnip.config.set_config {
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        }

        -- Snippet navigation in select mode (insert mode handled by blink.cmp)
        vim.keymap.set("s", "<Tab>", function() luasnip.jump(1) end, { silent = true })
        vim.keymap.set("s", "<S-Tab>", function() luasnip.jump(-1) end, { silent = true })
    end,
}
