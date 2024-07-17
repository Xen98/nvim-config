return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup {
      indent = {
        char = "|"
      },
      exclude = {
        buftypes = { "terminal" }
      },
      scope = {
        enabled = true,
        show_start = true,
      }
    }
  end
}
