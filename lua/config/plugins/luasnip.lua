local ls = require "luasnip"
local types = require "luasnip.util.types"

local M = {}

function M.setup()
  require("luasnip.loaders.from_vscode").lazy_load()

  ls.config.set_config {
    history = true,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,

    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { {"<- Choice", "Error"} },
        },
      },
    },
  }

  -- <c-k> is my expansion key
  -- this will expand the current item or jump to the next item within the snippet
  vim.keymap.set({"i", "s"}, "<c-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, {silent = true})

  -- <c-j> is my jump backwards key
  -- this always moves to the previous item within the snippet
  vim.keymap.set({"i", "s"}, "<c-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, {silent = true})

  -- <c-l> is selecting within a list of options
  vim.keymap.set("i", "c-l", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end)
end

return M
