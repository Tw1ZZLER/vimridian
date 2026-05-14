-- Single-directory, filesystem as a buffer, file explorer
return {
    "oil.nvim",
    -- Disable lazy-loading, otherwise won't take over as default file explorer
    lazy = false,
    keys = {
        {
            "-",
            "<CMD>Oil<CR>",
            mode = "n",
            desc = "Open parent directory",
        },
        {
            "<leader>e",
            "<CMD>Oil --float<CR>",
            mode = "n",
            desc = "Oil (float)",
        },
    },
    before = function()
        LZN.trigger_load("mini.icons")
    end,
    after = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            watch_for_changes = true,
        })
    end,
}
