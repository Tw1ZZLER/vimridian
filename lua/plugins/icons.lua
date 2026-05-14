-- credit: https://github.com/nvim-lualine/lualine.nvim/issues/1378
return {
    "mini.icons",
    after = function()
        require("mini.icons").setup()

        -- mock nvim-web-devicons to use mini.icons instead
        require("mini.icons").mock_nvim_web_devicons()
    end,
}
