return {
    'mini.nvim',
    after = function()
        require('mini.icons').setup()

        -- mock nvim-web-devicons to use mini.icons instead
        require("mini.icons").mock_nvim_web_devicons()
    end
}
