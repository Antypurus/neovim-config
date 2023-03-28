require('nightfox').setup({
    options = {
        transparent = true
    }
})

color = color or "carbonfox"
vim.cmd.colorscheme(color)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


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
]]

-- special coloring for note and todo
vim.cmd [[
    hi Comment guifg=#34eb95
    hi CustomPink guifg=PaleVioletRed
    au ColorScheme * hi Normal ctermbg=none guibg=none
    autocmd VimEnter,WinEnter * call matchadd('CustomPink', 'NOTE(Tiago)')
    autocmd VimEnter,WinEnter * call matchadd('CustomPink', 'TODO(Tiago)')
]]
