require("abnore.config.set")
require("abnore.config.remap")
-- Need to set mapleader etc before loading lazy, therefore this is the order
-- we need to do things in with lazy. 
require("abnore.config.lazy")
require("abnore.config.autocmd")
