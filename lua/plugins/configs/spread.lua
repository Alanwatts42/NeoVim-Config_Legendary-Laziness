return {
	"aarondiel/spread.nvim",
	depdndencies = {
        "nvim-treesitter/nvim-treesitter",
    },

    config = function()
		local spread = require("spread")
		local default_options = {
			silent = true,
			noremap = true
		}

		vim.keymap.add("n", "<leader>ss", spread.out, default_options)
		vim.keymap.add("n", "<leader>ssc", spread.combine, default_options)
	end
}
