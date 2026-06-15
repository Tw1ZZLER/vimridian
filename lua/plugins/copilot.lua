-- Copilot LSP provider and stuff
return {
    "copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    before = function() end,
    after = function() require("copilot").setup {} end,
}
