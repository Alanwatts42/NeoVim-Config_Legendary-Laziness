return {
    "motosir/skel-nvim",
    config = function()
        require("skel-nvim").setup{
        -- file pattern -> template mappings
        mappings = {
            ['*.cpp'] = "cpp.skel",
            ['*.h']   = "h.skel",
            -- patterns can map to multiple templates
            ['LICENSE'] = {"license.mit.skel", "license.gpl.skel" }
        }}
    end,
}
