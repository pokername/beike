return
{
	"L3MON4D3/LuaSnip",
--  lazy = true,
	version = "v2.*", 
	build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip").config.setup({enable_autosnippets = true})
    require("luasnip").config.setup({store_selection_keys="`"})
    vim.cmd([[
      imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
      inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
      snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
      snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
      imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
      smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    ]])
  end
}





