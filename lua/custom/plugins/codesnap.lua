return {
  'mistricky/codesnap.nvim',
  lazy = true,
  build = 'make',
  opts = {
    save_path = '~/Pictures/codesnap/',
    bg_theme = 'bamboo',
    has_breadcrumbs = true,
    has_line_number = true,
    watermark = '',
    mac_window_bar = false,
    show_workspace = true,
  },
}
