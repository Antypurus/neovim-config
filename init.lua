require("config.plugins")
require("config.generic")
require("config.plugin.telescope")
require("config.plugin.git")
require("config.plugin.lsp")
require("config.plugin.misc")

local keymaps = require("config.keymaps")
keymaps.setup()
