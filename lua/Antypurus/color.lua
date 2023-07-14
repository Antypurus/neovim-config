require('nightfox').setup({
    options = {
        transparent = true
    }
})

color = color or "carbonfox"
vim.cmd.colorscheme(color)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd [[
    hi ActiveWindow guibg=#141414
    hi InactiveWindow guibg=#030303
]]


-- TODO(Tiago): for now all of these are relying on direct vim cmds
-- but in the future i might want ot move this over to a more lua
-- modern way of doing it
-- mark trailing whitespace
vim.cmd [[
    match ExtraWhitespace /\s\+$/
    au BufWinEnter * match ExtraWhitespace /\s\+$/
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
    au BufWinLeave * call clearmatches()
    highlight ExtraWhitespace ctermbg=red guibg=red
    hi Comment guifg=#34eb95
]]
