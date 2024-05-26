local M = {}

M.colors = {
    bg = "#151515",
    fg = "#e4e4e4",
    red = "#ff0000",
    yellow = "#49b6ff",
    orange = "#ff5e00",
    blue = "#006ee4",
    green = "#c8ff00",
    cyan = "#00a7e4",
    magenta = "#6f2fd8",
    purple = "#2712dc",
    pink = "#b312dc",
    grey1 = "#e4e4e4",
    grey2 = "#c7c7c7",
    grey3 = "#b6b6b6",
    grey4 = "#a5a5a5",
    grey5 = "#9b9b9b",
    grey6 = "#949494",
    grey7 = "#838383",
    grey8 = "#727272",
    grey9 = "#696969",
    grey10 = "#626262",
    grey11 = "#5c5c5c",
    grey12 = "#565656",
    grey13 = "#333a47",
    grey14 = "#404040",
    grey15 = "#1e222a",
    grey16 = "#333333",
    grey17 = "#0f1115",
    grey18 = "#2b2b2b",
    grey19 = "#272727"
}

local themes = {

    gruvbox = {
         "ellisonleao/gruvbox.nvim", 
        priority = 1000 ,
        config = function()
        require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = false,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = false, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
            vim.cmd("colorscheme gruvbox")
        end
    },
    
    nightfox = {
        "EdenEast/nightfox.nvim",
        config = function()
        require('nightfox').setup({
            options = {

                fox = "carbonfox",
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = true,     -- Disable setting background
                terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false,    -- Non focused panes set to alternative background
                module_default = true,   -- Default enable value for modules
                colorblind = {
                enable = false,        -- Enable colorblind support
                simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                severity = {
                    protan = 0,          -- Severity [0,1] for protan (red)
                    deutan = 0,          -- Severity [0,1] for deutan (green)
                    tritan = 0,          -- Severity [0,1] for tritan (blue)
                }, },
                styles = {               -- Style to be applied to different syntax groups
                comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
                conditionals = "NONE",
                constants = "NONE",
                functions = "NONE",
                keywords = "NONE",
                numbers = "NONE",
                operators = "NONE",
                strings = "NONE",
                types = "NONE",
                variables = "NONE",
                },
                inverse = {             -- Inverse highlight for different types
                match_paren = false,
                visual = false,
                search = false,
                },
                modules = {             -- List of various plugins and additional options
                -- ...
                },
            },
            palettes = {},
            specs = {},
            groups = {},
            })

            -- setup must be called before loading
            vim.cmd("colorscheme nightfox")
        end
    },

    monochrome = {
        'kdheepak/monochrome.nvim',
        config = function()
            require('monochrome').setup{}
            vim.cmd 'colorscheme monochrome'
        end
    },

    rasmus = {
        'kvrohit/rasmus.nvim',
        config = function()
            require('rasmus').setup{}
            vim.cmd 'colorscheme rasmus'
        end
    }, 

   githubnvimtheme = {
    'projekt0n/github-nvim-theme',
    config = function()
        require('github-theme').setup({
            theme_style = "dark", -- or "light"
            -- Other configuration options
        })
        -- Do not use the vim.cmd line for colorscheme here
    end
    },
 
    onenord = {
        "rmehri01/onenord.nvim",
        config = function()
            require('onenord').setup {
                borders = true,
                fade_nc = false,
                styles = {
                    comments = "italic",
                    strings = "NONE",
                    keywords = "NONE",
                    functions = "italic",
                    variables = "bold",
                    diagnostics = "underline"
                },
                disable = {
                    background = false,
                    cursorline = false,
                    eob_lines = true
                },
                colors = {},
            }
        end
    },
    tokyonight = {
        "folke/tokyonight.nvim",
        config = function()
            local theme = require('tokyonight')
            theme.setup({
                style = 'night',
                on_colors = function(colors)
                    colors.bg_dark = '#000000'
                    colors.bg = '#11121D'
                    -- colors.bg_visual = M.colors.grey12
                end
            })
            theme.load()
        end
    },
    onedark = {
        "navarasu/onedark.nvim",
        config = function()
            local theme = require('onedark')
            theme.setup {
                style = 'darker',
                transparent = false, -- Show/hide background
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
                lualine = {
                    transparent = true, -- lualine center bar transparency
                },
            }
            theme.load()
        end
    },
    palenightfall = {
        "JoosepAlviste/palenightfall.nvim",
        config = function()
            require('palenightfall').setup {}
        end
    },
    nordic = {
        "AlexvZyl/nordic.nvim",
        config = function()
            require('nordic').setup {}
        end
    },
    onedarkpro = {
        "olimorris/onedarkpro.nvim",
        config = function()
            vim.o.background = "dark"
            require('onedarkpro').load()
        end
    },
    tokyodark = {
        "tiagovla/tokyodark.nvim",
        config = function()
            vim.g.tokyodark_transparent_background = false
            vim.g.tokyodark_enable_italic_comment = true
            vim.g.tokyodark_enable_italic = true
            vim.g.tokyodark_color_gamma = "0.0"
            vim.cmd 'colorscheme tokyodark'
        end
    },
    moonfly = {
        "bluz71/vim-moonfly-colors",
        config = function()
            vim.cmd [[colorscheme moonfly]]
        end
    },
    dracula = {
        "Mofiqul/dracula.nvim",
        config = function()
            local theme = require('dracula')
            theme.setup {}
            theme.load()
        end
    },
    draculanight = {
        "magidc/draculanight",
        config = function()
            local theme = require('draculanight')
            theme.setup {}
            theme.load()
        end
    },
    catppuccin = {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
            vim.cmd [[colorscheme catppuccin]]
        end
    },
    material = {
        "marko-cerovac/material.nvim",
        config = function()
            require "plugins.configs.materialui"
        end
    },
    beardedtheme = {
        "xStormyy/bearded-theme.nvim",
        config = function()
            require('plugins.config').setup{}
            vim.cmd 'colorscheme bearded-theme'
        end
    },

    monochrome = {
        'kdheepak/monochrome.nvim',
        config = function()
            require('monochrome').setup{}
            vim.cmd 'colorscheme monochrome'
        end
    },


    citruszest = {
        "zootedb0t/citruszest.nvim",
        config = function()
            require('citruszest').setup{}
            -- lazy = false,
            -- priority = 1000,
            vim.cmd 'colorscheme citruszest'
        end
    },

}

M.set_active_theme = function(theme_name)
    M.theme_name = theme_name
end

M.get_active_theme =  function()
    theme = themes[M.theme_name]
    theme.lazy = false 
    theme.priority = 1000
    return theme
end

return M
