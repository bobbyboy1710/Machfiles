local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
		always_show_bufferline = true,
	},
	highlights = {
		separator = {
			fg = "#073642",
			bg = "#002b36",
		},
		separator_selected = {
			fg = "#073642",
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bold = true,
		},
		fill = {
			bg = "#073642",
		},
	},
})
