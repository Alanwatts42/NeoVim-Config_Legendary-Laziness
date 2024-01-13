return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				-- -Line-comment toggle keymap
			    line = "gcc",
                block = "gbc",
			},
            opleader = {
                line = "gcc",
                block = "gbc",
            },

		})
	end,
}
