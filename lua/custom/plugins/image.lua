return {
  '3rd/image.nvim',
  build = false,
  ft = { 'markdown', 'norg', 'vimwiki', 'html', 'css', 'png', 'jpg', 'jpeg', 'gif', 'webp', 'svg' },
  opts = {
    processor = 'magick_cli',
    backend = 'kitty',
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
      },
      neorg = { enabled = false },
      html = { enabled = false },
      css = { enabled = false },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
  },
}
