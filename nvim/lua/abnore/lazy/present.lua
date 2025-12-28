return {
    "tjdevries/present.nvim",
    config = function()
        local present = require("present")

        present.setup({
            syntax = {
                comment = "%%",
                stop = "<!%-%-%s*stop%s*%-%->",
            },
            executors = {
                python  = present.create_system_executor("python3"),
            },
        })
    end,
}
