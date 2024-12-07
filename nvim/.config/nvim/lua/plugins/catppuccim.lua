
return {
   "catppuccin/nvim",
   lazy = false,
   name = "catppuccin",
   priority = 1000,
   config = function ()
      local catppuccin = require('catppuccin')
      catppuccin.setup({
         flavour = "mocha",

         color_overrides = {
				mocha = {
					base = "#0d090d",
					mantle = "#0d090d",
					crust = "#0d090d",
				},
			},
      })

      vim.cmd.colorscheme('catppuccin')
   end,
}
