require ("Antypurus")

--- neovide configurations ----
if vim.g.neovide then
    vim.o.guifont = "CommitMono Nerd Font:h9"
    vim.opt.linespace = 1
    vim.g.neovide_scale_factor = 1.0
    
    vim.g.neovide_transparency = 0.8
    vim.g.neovide_refresh_rate = 120

    vim.g.neovide_cursor_animation_length = 0.0
    vim.g.neovide_cursor_antialiasing = true
end