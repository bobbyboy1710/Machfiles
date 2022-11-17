vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
    augroup END
]])
-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- Remove floating space on write
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = TrimWhiteSpaceGrp,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
