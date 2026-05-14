-- Formatting plugin
-- credit: https://www.lazyvim.org/plugins/formatting#conformnvim
-- credit: https://github.com/stevearc/conform.nvim#installation
return {
    "conform.nvim",
    keys = {
        {
            "<leader>cf",
            function() require("conform").format { timeout_ms = 3000 } end,
            desc = "Format",
        },
        {
            "<leader>cF",
            function() require("conform").format { formatters = { "injected" }, timeout_ms = 3000 } end,
            mode = { "n", "x" },
            desc = "Format Injected Langs",
        },
    },
    after = function()
        require("conform").setup {
            default_format_opts = {
                timeout_ms = 3000,
                async = false, -- not recommended to change
                quiet = false, -- not recommended to change
                lsp_format = "fallback", -- not recommended to change
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            -- ADD FORMATTERS HERE!!!
            formatters_by_ft = {
                lua = { "stylua" },
                nix = { "alejandra" },
                -- Conform will run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                -- rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            formatters = {
                injected = { options = { ignore_errors = true } },
                -- # Example of using shfmt with extra args
                -- shfmt = {
                --   prepend_args = { "-i", "2", "-ci" },
                -- },
            },
        }
    end,
}
