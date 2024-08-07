local M = {
    "LunarVim/breadcrumbs.nvim",
    depdndencies = {
        {"SmiteshP/nvim-navic"},
    },
    }
function M.config()
    require("breadcrumbs").setup()
end

return M

