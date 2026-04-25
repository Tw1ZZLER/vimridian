-- Sources our config files under lua/config on startup
require('config.options')
require('config.keybinds')
require('config.autocmds')

-- Get lz.n going
-- defines LZN as the variable for calling LZN functions
LZN = require("lz.n")

-- load all plugins in lua/plugins, lz.n will now take it from here
LZN.load("plugins")
