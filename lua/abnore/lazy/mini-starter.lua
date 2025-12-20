return {
  "echasnovski/mini.starter",
  config = function()
    local starter = require("mini.starter")

    starter.setup({
      evaluate_single = true,
header = [[
███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
]],
      items = {
        -- Built-in
        starter.sections.builtin_actions(),

        -- Files
        starter.sections.recent_files(3, false),
        starter.sections.recent_files(3, true),


        -- Telescope (explicit, clean)
        {
          name = "Find files",
          action = "Telescope find_files",
          section = "Telescope",
        },
        {
            name = "Live grep",
            action = "Telescope live_grep",
            section = "Telescope",
        },
        -- Project / Neovim
        {
            name = "Neovim config",
            action = function()
                require("oil").open("~/.config/nvim/lua/abnore")
            end,
            section = "Neovim",
        },
        {
          name = "TODO",
          action = "Telescope grep_string search=TODO",
          section = "Neovim",
        },
      },

      content_hooks = {
        starter.gen_hook.adding_bullet("░ "),
        starter.gen_hook.indexing("section",{ "Builtin actions", "Neovim" }),
        starter.gen_hook.aligning("center", "center"),
        starter.gen_hook.padding(0, 2),
      },

      footer = function()
          local ok, out = pcall(vim.fn.system, "fortune -s")
          if ok and type(out) == "string" and out ~= "" then
              return out:gsub("\n$", "")
          end
          return ""
      end,
  })

  vim.api.nvim_create_autocmd("User", {
      pattern = "MiniStarterOpened",
      once = true,
      callback = function()
          vim.opt.laststatus = 0
      end,
  })
  vim.api.nvim_create_autocmd("BufLeave", {
      callback = function(ev)
          if vim.bo[ev.buf].filetype == "ministarter" then
              vim.opt.laststatus = 2
          end
      end,
  })
end,
}
