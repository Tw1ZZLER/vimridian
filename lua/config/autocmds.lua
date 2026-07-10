local autocmd = vim.api.nvim_create_autocmd

-- Automatically start treesitter for file on file open
autocmd("FileType", {
    callback = function(ev)
        -- pcall is used because it may fail if parser for
        -- the specific filetype is not installed
        pcall(vim.treesitter.start, ev.buf)
    end,
})

-- I don't like my diagnostics being italicized
local clean_diagnostics_group = vim.api.nvim_create_augroup("NoItalicDiagnostics", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
    group = clean_diagnostics_group,
    pattern = "*",
    callback = function()
        local severities = { "Error", "Warn", "Hint", "Info" }

        for _, severity in ipairs(severities) do
            -- Fixes the core text, signs/icons, virtual text, and floating popups
            vim.api.nvim_set_hl(0, "Diagnostic" .. severity, { italic = false, update = true })
            vim.api.nvim_set_hl(0, "DiagnosticSign" .. severity, { italic = false, update = true })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. severity, { italic = false, update = true })
            vim.api.nvim_set_hl(0, "DiagnosticFloating" .. severity, { italic = false, update = true })

            -- Fixes the underline/undercurl decorations
            vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. severity, { italic = false, update = true })
        end
    end,
})
