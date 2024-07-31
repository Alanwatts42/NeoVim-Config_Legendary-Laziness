
return {
  'echasnovski/mini.surround',
  branch = 'stable',
  version = '*',
  main = 'mini.surround',
  config = function()
    require('mini.surround').setup({
        search_method = 'cover_or_next',
    })
  end,
}

